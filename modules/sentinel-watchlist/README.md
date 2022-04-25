<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 3.2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_sentinel_watchlist.watchlist](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_watchlist) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_duration"></a> [default\_duration](#input\_default\_duration) | The key used to optimize query performance when using Watchlist for joins with other data. | `string` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of this Sentinel Watchlist. | `string` | `null` | no |
| <a name="input_item_search_key"></a> [item\_search\_key](#input\_item\_search\_key) | The key used to optimize query performance when using Watchlist for joins with other data. | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | The description of this Sentinel Watchlist. | `list(string)` | `null` | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | The ID of the Log Analytics Workspace where this Sentinel Watchlist resides in. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name which should be used for this Sentinel Watchlist. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Sentinel Watchlist. |
<!-- END_TF_DOCS -->
