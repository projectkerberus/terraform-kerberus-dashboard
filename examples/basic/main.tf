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

  github_client_id      = var.GITHUB_CLIENT_ID
  github_client_secrets = var.GITHUB_CLIENT_SECRETS
  github_token          = var.GITHUB_TOKEN
}
 