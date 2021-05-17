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


