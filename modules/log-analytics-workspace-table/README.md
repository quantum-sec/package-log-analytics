<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | ~> 1.6 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.53 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azapi"></a> [azapi](#provider\_azapi) | 1.6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azapi_resource.workspace_table](https://registry.terraform.io/providers/azure/azapi/latest/docs/resources/resource) | resource |
| [azapi_update_resource.workspace_table](https://registry.terraform.io/providers/azure/azapi/latest/docs/resources/update_resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_mode"></a> [mode](#input\_mode) | Is it a new table, or is an existing table being updated? | `string` | `"Create"` | no |
| <a name="input_tables"></a> [tables](#input\_tables) | n/a | <pre>map(object({<br>    plan                 = optional(string)<br>    description          = optional(string)<br>    displayName          = optional(string)<br>    retentionInDays      = optional(number)<br>    totalRetentionInDays = optional(number)<br>    columns = optional(list(object({<br>      name         = string<br>      type         = string<br>      description  = optional(string)<br>      displayName  = optional(string)<br>      dataTypeHint = optional(string)<br>    })))<br>  }))</pre> | n/a | yes |
| <a name="input_workspace_resource_id"></a> [workspace\_resource\_id](#input\_workspace\_resource\_id) | The full resource ID of the Log Analytics workspace with which the solution will be linked. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Azure resource. |
| <a name="output_output"></a> [output](#output\_output) | The output from the response body. |
<!-- END_TF_DOCS -->
