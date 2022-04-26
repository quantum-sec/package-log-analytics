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
| [azurerm_sentinel_watchlist_item.watchlist_item](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_watchlist_item) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | The name in UUID format which should be used for this Sentinel Watchlist Item. | `string` | `null` | no |
| <a name="input_properties"></a> [properties](#input\_properties) | The key value pairs of the Sentinel Watchlist Item. | `map(string)` | n/a | yes |
| <a name="input_watchlist_id"></a> [watchlist\_id](#input\_watchlist\_id) | The ID of the Sentinel Watchlist that this Item resides in. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Sentinel Watchlist Item. |
<!-- END_TF_DOCS -->
