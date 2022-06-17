<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.10.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_log_analytics_workspace.workspace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | The Azure region in which this Azure Log Analytics workspace will be deployed. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name to assign to the Log Analytics workspace. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which this Log Analytics workspace will be provisioned. | `string` | n/a | yes |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | The workspace data retention in days. Possible values are a range between 30 and 730. | `number` | `31` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | Specifies the SKU of the Log Analytics Workspace. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Log Analytics workspace. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Log Analytics workspace. |
| <a name="output_primary_shared_key"></a> [primary\_shared\_key](#output\_primary\_shared\_key) | The primary shared key for accessing and managing the Log Analytics workspace. |
| <a name="output_secondary_shared_key"></a> [secondary\_shared\_key](#output\_secondary\_shared\_key) | The secondary shared key for accessing and managing the Log Analytics workspace. |
| <a name="output_workspace_id"></a> [workspace\_id](#output\_workspace\_id) | The workspace or customer ID of the Log Analytics workspace. |
<!-- END_TF_DOCS -->
