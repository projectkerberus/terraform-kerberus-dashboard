variable "PATH_KUBECONFIG" {
  description = "A path to a kube config file."
  type        = string
  default     = "./config"
}

variable "INSECURE_KUBECONFIG" {
  description = "Whether the server should be accessed without verifying the TLS certificate"
  type        = bool
  default     = false
}

variable "KERBERUS_K8S_ENDPOINT" {
  description = "kubernetes api endpoint."
  type        = string
  default     = "kubernetes.io"
}

variable "ARGOCD_URL" {
  description = "FQDN for Argo CD GUI"
  type        = string
  default     = "argocd.io"
}

variable "ARGOCD_TOKEN" {
  description = "Argo CD helm chart values.yaml path"
  type        = string
  default     = "my_token"
}

variable "GITHUB_CLIENT_ID" {
  description = "Github OAuth Apps client id"
  type        = string
  default     = "my_client_id"
}

variable "GITHUB_CLIENT_SECRETS" {
  description = "Github OAuth Apps client secrets"
  type        = string
  default     = "my_client_secrets"
}

variable "GITHUB_TOKEN" {
  description = "Github personal access token, please see: https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token"
  type        = string
  default     = "my_token"
}


