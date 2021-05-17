# Terraform Kerberus Dashboard

Terraform module which creates deploy the Kerberus Dashboard on your Kubernates cluster.

## Usage

```hcl
module "kerberus_dashboard" {
  source = "project-kerberus/dashboard/kerberus"

  kerberus_k8s_endpoint = "https://kubernetes.io/"

  argocd_token = "hjudshf3jcu3892uc0389muri23umjrc9i32mjr23i9ur0urc3icfjk"
  argocd_url   = "https://argoproj.github.io/"

}
```

## Examples

* [Basic](./examples/basic)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.08 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | 2.0.3 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.0.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.0.3 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.0.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.kerberus_dashboard](https://registry.terraform.io/providers/hashicorp/helm/2.0.3/docs/resources/release) | resource |
| [kubernetes_cluster_role_binding.bind_kerberus_dashboard_service_account_to_admin_role](https://registry.terraform.io/providers/hashicorp/kubernetes/2.0.3/docs/resources/cluster_role_binding) | resource |
| [kubernetes_namespace.kerberus_dashboard_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/2.0.3/docs/resources/namespace) | resource |
| [kubernetes_service_account.create_kerberus_dashboard_service_account](https://registry.terraform.io/providers/hashicorp/kubernetes/2.0.3/docs/resources/service_account) | resource |
| [kubernetes_secret.retreive_kerberus_dashboard_service_account_token](https://registry.terraform.io/providers/hashicorp/kubernetes/2.0.3/docs/data-sources/secret) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_argocd_token"></a> [argocd\_token](#input\_argocd\_token) | Auth tokens for Argo CD management automation. | `string` | n/a | yes |
| <a name="input_argocd_url"></a> [argocd\_url](#input\_argocd\_url) | FQDN for Argo CD GUI | `string` | n/a | yes |
| <a name="input_github_client_id"></a> [github\_client\_id](#input\_github\_client\_id) | Github OAuth Apps client id | `string` | `""` | no |
| <a name="input_github_client_secrets"></a> [github\_client\_secrets](#input\_github\_client\_secrets) | Github OAuth Apps client secrets | `string` | `""` | no |
| <a name="input_github_token"></a> [github\_token](#input\_github\_token) | Github personal access token, please see: https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token | `string` | `""` | no |
| <a name="input_gitlab_token"></a> [gitlab\_token](#input\_gitlab\_token) | GitLab personal access token, please see: https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html#create-a-personal-access-token | `string` | `""` | no |
| <a name="input_kerberus_dashboard_chart"></a> [kerberus\_dashboard\_chart](#input\_kerberus\_dashboard\_chart) | Kerberus chart name to be installed. | `string` | `"kerberus-dashboard"` | no |
| <a name="input_kerberus_dashboard_chart_version"></a> [kerberus\_dashboard\_chart\_version](#input\_kerberus\_dashboard\_chart\_version) | Specify the exact Kerberus chart version to install. If this is not specified, the latest version is installed. | `string` | `null` | no |
| <a name="input_kerberus_dashboard_namespace"></a> [kerberus\_dashboard\_namespace](#input\_kerberus\_dashboard\_namespace) | The name of kubernetes namespace for the Kerberus dashboard. | `string` | `"kerberus-dashboard-system"` | no |
| <a name="input_kerberus_dashboard_repository"></a> [kerberus\_dashboard\_repository](#input\_kerberus\_dashboard\_repository) | Repository URL where to locate the Kerberus chart | `string` | `"https://projectkerberus.github.io/kerberus-dashboard/"` | no |
| <a name="input_kerberus_dashboard_values_path"></a> [kerberus\_dashboard\_values\_path](#input\_kerberus\_dashboard\_values\_path) | kerberus dashboard helm chart values.yaml path | `string` | `""` | no |
| <a name="input_kerberus_k8s_endpoint"></a> [kerberus\_k8s\_endpoint](#input\_kerberus\_k8s\_endpoint) | kubernetes api endpoint. | `string` | n/a | yes |
| <a name="input_kerberus_service_account"></a> [kerberus\_service\_account](#input\_kerberus\_service\_account) | The name of the kerberus service account on Kubernetes | `string` | `"kerberus-admin"` | no |

## Outputs

No outputs.
## Authors

Module is maintained by [Kiratech](https://www.kiratech.it/) with help from [these awesome contributors](https://github.com/projectkerberus/terraform-kerberus-dashboard/graphs/contributors).

## License

See [LICENSE](./LICENSE) for full details.