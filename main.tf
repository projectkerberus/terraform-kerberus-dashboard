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

resource "helm_release" "kerberus_dashboard" {
  name       = "kerberus-dashboard"
  namespace  = kubernetes_namespace.kerberus_dashboard_namespace.metadata[0].name
  repository = var.kerberus_dashboard_repository
  chart      = var.kerberus_dashboard_chart
  version    = var.kerberus_dashboard_chart_version
  values     = var.kerberus_dashboard_values_path != "" ? [file(var.kerberus_dashboard_values_path)] : []

  set {
    name  = "argocd.baseUrl"
    value = var.argocd_url
  }

  set {
    name  = "argocd.token"
    value = format("argocd.token=%s", var.argocd_token)
  }

  set {
    name  = "auth.github.clientId"
    value = var.github_client_id
  }

  set {
    name  = "auth.github.clientSecret"
    value = var.github_client_secrets
  }

  set {
    name  = "auth.githubToken"
    value = var.github_token
  }

  set {
    name  = "kubernetes.token"
    value = data.kubernetes_secret.retreive_kerberus_dashboard_service_account_token.data["token"]
  }

  set {
    name  = "kubernetes.url"
    value = var.kerberus_k8s_endpoint
  }
}
