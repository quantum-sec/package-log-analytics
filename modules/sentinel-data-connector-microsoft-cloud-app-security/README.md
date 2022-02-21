<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 2.54 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 2.54 |

## Resources

| Name | Type |
|------|------|
| [azurerm_sentinel_data_connector_microsoft_cloud_app_security.data_connector_microsoft_cloud_app_security](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_microsoft_cloud_app_security) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | The ID of the Log Analytics Workspace that this Microsoft Cloud App Security Data Connector resides in. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name which should be used for this Microsoft Cloud App Security Data Connector. | `string` | n/a | yes |
| <a name="input_alerts_enabled"></a> [alerts\_enabled](#input\_alerts\_enabled) | Should the alerts be enabled? | `bool` | `true` | no |
| <a name="input_discovery_logs_enabled"></a> [discovery\_logs\_enabled](#input\_discovery\_logs\_enabled) | Should the Discovery Logs be enabled? | `bool` | `true` | no |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | The ID of the Tenant that this Microsoft Cloud App Security Data Connector connects to. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Microsoft Cloud App Security Data Connector. |
<!-- END_TF_DOCS -->
