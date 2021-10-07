variable "kerberus_k8s_endpoint" {
  description = "kubernetes api endpoint."
  type        = string
}

variable "argocd_url" {
  description = "FQDN for Argo CD GUI"
  type        = string
}

variable "argocd_token" {
  description = "Auth tokens for Argo CD management automation."
  type        = string
}

variable "kerberus_dashboard_namespace" {
  description = "The name of kubernetes namespace for the Kerberus dashboard."
  type        = string
  default     = "kerberus-dashboard-system"
}

variable "kerberus_service_account" {
  description = "The name of the kerberus service account on Kubernetes"
  type        = string
  default     = "kerberus-admin"
}

variable "kerberus_dashboard_repository" {
  description = "Repository URL where to locate the Kerberus chart"
  type        = string
  default     = "https://projectkerberus.github.io/kerberus-dashboard/"
}

variable "kerberus_dashboard_chart" {
  description = "Kerberus chart name to be installed."
  type        = string
  default     = "kerberus-dashboard"
}

variable "kerberus_dashboard_chart_version" {
  description = "Specify the exact Kerberus chart version to install. If this is not specified, the latest version is installed."
  type        = string
  default     = null
}

variable "kerberus_dashboard_values_path" {
  description = "kerberus dashboard helm chart values.yaml path"
  type        = string
  default     = ""
}

variable "github_client_id" {
  description = "Github OAuth Apps client id"
  type        = string
  default     = ""
}

variable "github_client_secrets" {
  description = "Github OAuth Apps client secrets"
  type        = string
  default     = ""
}

variable "github_token" {
  description = "Github personal access token, please see: https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token"
  type        = string
  default     = ""
}

variable "gitlab_token" {
  description = "GitLab personal access token, please see: https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html#create-a-personal-access-token"
  type        = string
  default     = ""
}

variable "github_app_id" {
  description = "GitHub App ID"
  type        = string
  default     = ""
}

variable "github_app_client_id" {
  description = "GitHub App ClientID. GitHub Apps can use OAuth credentials to identify users."
  type        = string
  default     = ""
}

variable "github_app_client_secret" {
  description = "GitHub App Secret. GitHub Apps can use OAuth credentials to identify users."
  type        = string
  default     = ""
}

variable "github_app_webhook_url" {
  description = "GitHub App Webhook URL. Webhooks allow you to build or set up integrations, such as GitHub Apps or OAuth Apps, which subscribe to certain events on GitHub.com."
  type        = string
  default     = ""
}

variable "github_app_webhook_secret" {
  description = "GitHub App Webhook secret. Webhooks allow you to build or set up integrations, such as GitHub Apps or OAuth Apps, which subscribe to certain events on GitHub.com."
  type        = string
  default     = ""
}

variable "github_app_private_key" {
  description = "GitHub App Private key. You need a private key to sign access token requests."
  type        = string
  default     = ""
}

#AD
variable "microsoft_client_id" {
  description = "Microsoft AD client id"
  type        = string
  default     = ""
}

variable "microsoft_client_secrets" {
  description = "Microsoft AD client secrets"
  type        = string
  default     = ""
}

variable "microsoft_tenantId" {
  description = "Microsoft AD tenantId"
  type        = string
  default     = ""
}
