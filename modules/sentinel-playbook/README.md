<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~> 2.22 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | ~> 3.2.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | 2.42.0 |
| <a name="provider_null"></a> [null](#provider\_null) | 3.2.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azure_role_assignment"></a> [azure\_role\_assignment](#module\_azure\_role\_assignment) | git::git@github.com:quantum-sec/package-azure.git//modules/azure-role-assignment | 1.6.1 |
| <a name="module_azure_sentinel_playbooks"></a> [azure\_sentinel\_playbooks](#module\_azure\_sentinel\_playbooks) | git::git@github.com:quantum-sec/package-azure.git//modules/azure-arm-deployment | 1.6.1 |

## Resources

| Name | Type |
|------|------|
| [null_resource.template_hash](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [azuread_service_principal.builtin_app](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/service_principal) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_arm_deployment_name_prefix"></a> [arm\_deployment\_name\_prefix](#input\_arm\_deployment\_name\_prefix) | A unique string prepended to the ARM deployment name to ensure it is globally unique (i.e. your company name). | `string` | n/a | yes |
| <a name="input_parameters_override"></a> [parameters\_override](#input\_parameters\_override) | Key/Value map to be applied to the arm script parameters. | `map(string)` | `{}` | no |
| <a name="input_playbook_template"></a> [playbook\_template](#input\_playbook\_template) | The JSON template of the playbook to be deployed | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which this resource will be provisioned. | `string` | n/a | yes |
| <a name="input_role_definition_name"></a> [role\_definition\_name](#input\_role\_definition\_name) | The name of role definitiion in Azure subscription that is required to be assigned. | `string` | `"Microsoft Sentinel Automation Contributor"` | no |
| <a name="input_sentinel_principal_id"></a> [sentinel\_principal\_id](#input\_sentinel\_principal\_id) | This is the Microsoft Sentinel Application ID that we can extract from Azure AD enterprise application. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_logic_app_id"></a> [logic\_app\_id](#output\_logic\_app\_id) | The ID of the LogicApp. |
| <a name="output_output_content"></a> [output\_content](#output\_output\_content) | The JSON content of the outputs of the ARM template deployment. |
<!-- END_TF_DOCS -->
