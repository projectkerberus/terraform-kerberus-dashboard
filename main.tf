resource "kubernetes_namespace" "kerberus_dashboard_namespace" {
  metadata {
    name = var.kerberus_dashboard_namespace
  }
}

resource "kubernetes_service_account" "create_kerberus_dashboard_service_account" {
  metadata {
    name      = var.kerberus_service_account
    namespace = kubernetes_namespace.kerberus_dashboard_namespace.metadata[0].name
  }

  automount_service_account_token = true
}

resource "kubernetes_cluster_role_binding" "bind_kerberus_dashboard_service_account_to_admin_role" {
  metadata {
    name = kubernetes_service_account.create_kerberus_dashboard_service_account.metadata[0].name
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }
  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.create_kerberus_dashboard_service_account.metadata[0].name
    namespace = kubernetes_service_account.create_kerberus_dashboard_service_account.metadata[0].namespace
  }
}

data "kubernetes_secret" "retreive_kerberus_dashboard_service_account_token" {
  metadata {
    name      = kubernetes_service_account.create_kerberus_dashboard_service_account.default_secret_name
    namespace = kubernetes_service_account.create_kerberus_dashboard_service_account.metadata[0].namespace
  }
}

locals {
  github_app_credentials_file = templatefile(join("/", [path.module, "./files/github-app-credentials.yaml.tpl"]), {
    appId         = var.github_app_id,
    webhookUrl    = var.github_app_webhook_url,
    clientId      = var.github_app_client_id,
    clientSecret  = var.github_app_client_secret,
    webhookSecret = var.github_app_webhook_secret,
    privateKey    = var.github_app_private_key
  })
}

resource "kubernetes_secret" "github_app_credentials" {
  metadata {
    name      = "github-app-credentials"
    namespace = kubernetes_namespace.kerberus_dashboard_namespace.metadata[0].name
  }

  data = {
    "github-app-credentials" = local.github_app_credentials_file
  }
}

resource "helm_release" "kerberus_dashboard" {
  name       = "kerberus-dashboard"
  namespace  = kubernetes_namespace.kerberus_dashboard_namespace.metadata[0].name
  repository = var.kerberus_dashboard_repository
  chart      = var.kerberus_dashboard_chart
  version    = var.kerberus_dashboard_chart_version
  values     = var.kerberus_dashboard_values_path != "" ? [file(var.kerberus_dashboard_values_path)] : []

  # Argo CD
  set {
    name  = "argocd.baseUrl"
    value = var.argocd_url
  }

  set {
    name  = "argocd.token"
    value = format("argocd.token=%s", var.argocd_token)
  }

  # K8S
  set {
    name  = "kubernetes.token"
    value = data.kubernetes_secret.retreive_kerberus_dashboard_service_account_token.data["token"]
  }

  set {
    name  = "kubernetes.url"
    value = var.kerberus_k8s_endpoint
  }

  # Github
  dynamic "set" {
    for_each = var.github_client_id != "" && var.github_client_secrets != "" && var.github_token != "" ? { "auth.github.clientId" : var.github_client_id,
    "auth.github.clientSecret" : var.github_client_secrets, "providers.github.token" : var.github_token } : {}
    content {
      name  = set.key
      value = set.value
    }
  }

  # Gitlab
  dynamic "set" {
    for_each = var.gitlab_token != "" ? { "auth.gitlabToken" : var.gitlab_token } : {}
    content {
      name  = set.key
      value = set.value
    }
  }

}
