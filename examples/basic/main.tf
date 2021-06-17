provider "kubernetes" {
  config_path = var.PATH_KUBECONFIG
  insecure    = var.INSECURE_KUBECONFIG
}

provider "helm" {
  kubernetes {
    config_path = var.PATH_KUBECONFIG
  }
}

module "kerberus_dashboard" {
  source = "../../"

  kerberus_k8s_endpoint = var.KERBERUS_K8S_ENDPOINT

  argocd_token = var.ARGOCD_TOKEN
  argocd_url   = var.ARGOCD_URL

  kerberus_dashboard_values_path = var.KERBERUS_DASHBOARD_VALUES_PATH

  github_client_id      = var.GITHUB_CLIENT_ID
  github_client_secrets = var.GITHUB_CLIENT_SECRETS
  github_token          = var.GITHUB_TOKEN

  gitlab_token = var.GITLAB_TOKEN

  github_app_id             = var.GITHUB_APP_ID
  github_app_webhook_url    = var.GITHUB_APP_WEBHOOK_URL
  github_app_client_id      = var.GITHUB_APP_CLIENT_ID
  github_app_client_secret  = var.GITHUB_APP_CLIENT_SECRET
  github_app_webhook_secret = var.GITHUB_APP_WEBHOOK_SECRET
  github_app_private_key    = var.GITHUB_APP_PRIVATE_KEY
}