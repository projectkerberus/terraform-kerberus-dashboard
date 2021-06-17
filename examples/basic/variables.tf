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


variable "KERBERUS_DASHBOARD_NAMESPACE" {
  description = "The name of kubernetes namespace for the Kerberus dashboard."
  type        = string
  default     = "kerberus-dashboard-system"
}

variable "KERBERUS_SERVICE_ACCOUNT" {
  description = "The name of the kerberus service account on Kubernetes"
  type        = string
  default     = "kerberus-admin"
}

variable "KERBERUS_DASHBOARD_REPOSITORY" {
  description = "Repository URL where to locate the Kerberus chart"
  type        = string
  default     = "https://projectkerberus.github.io/kerberus-dashboard/"
}

variable "KERBERUS_DASHBOARD_CHART" {
  description = "Kerberus chart name to be installed."
  type        = string
  default     = "kerberus-dashboard"
}

variable "KERBERUS_DASHBOARD_CHART_VERSION" {
  description = "Specify the exact Kerberus chart version to install. If this is not specified, the latest version is installed."
  type        = string
  default     = null
}

variable "KERBERUS_DASHBOARD_VALUES_PATH" {
  description = "kerberus dashboard helm chart values.yaml path"
  type        = string
  default     = ""
}

variable "GITHUB_CLIENT_ID" {
  description = "Github OAuth Apps client id"
  type        = string
  default     = ""
}

variable "GITHUB_CLIENT_SECRETS" {
  description = "Github OAuth Apps client secrets"
  type        = string
  default     = ""
}

variable "GITHUB_TOKEN" {
  description = "Github personal access token, please see: https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token"
  type        = string
  default     = ""
}

variable "GITLAB_TOKEN" {
  description = "GitLab personal access token, please see: https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html#create-a-personal-access-token"
  type        = string
  default     = ""
}

variable "GITHUB_APP_ID" {
  description = "GitHub App ID"
  type        = string
  default     = ""
}

variable "GITHUB_APP_CLIENT_ID" {
  description = "GitHub App ClientID. GitHub Apps can use OAuth credentials to identify users."
  type        = string
  default     = ""
}

variable "GITHUB_APP_CLIENT_SECRET" {
  description = "GitHub App Secret. GitHub Apps can use OAuth credentials to identify users."
  type        = string
  default     = ""
}

variable "GITHUB_APP_WEBHOOK_URL" {
  description = "GitHub App Webhook URL. Webhooks allow you to build or set up integrations, such as GitHub Apps or OAuth Apps, which subscribe to certain events on GitHub.com."
  type        = string
  default     = ""
}

variable "GITHUB_APP_WEBHOOK_SECRET" {
  description = "GitHub App Webhook secret. Webhooks allow you to build or set up integrations, such as GitHub Apps or OAuth Apps, which subscribe to certain events on GitHub.com."
  type        = string
  default     = ""
}

variable "GITHUB_APP_PRIVATE_KEY" {
  description = "GitHub App Private key. You need a private key to sign access token requests."
  type        = string
  default     = ""
}
