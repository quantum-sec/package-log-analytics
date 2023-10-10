<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.34 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.69.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_log_analytics_saved_search.search](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_saved_search) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_category"></a> [category](#input\_category) | The category under which the saved search will be displayed. | `string` | n/a | yes |
| <a name="input_function_parameters"></a> [function\_parameters](#input\_function\_parameters) | A list of parameter definitions (strings) in the following format: `param_name:type=default_value`. | `set(string)` | `null` | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | The ID of the Log Analytics workspace with which the saved search will be associated. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the saved search. | `string` | n/a | yes |
| <a name="input_query"></a> [query](#input\_query) | The KQL query for the saved search. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The unique identifier of the saved search. |
<!-- END_TF_DOCS -->
