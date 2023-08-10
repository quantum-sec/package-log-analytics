<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.54.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_data_connector_slack_audit"></a> [data\_connector\_slack\_audit](#module\_data\_connector\_slack\_audit) | ../sentinel-data-connector-arm-generic | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_bearer_token"></a> [api\_bearer\_token](#input\_api\_bearer\_token) | Slack API Bearer Token to access audit logs | `string` | n/a | yes |
| <a name="input_arm_template"></a> [arm\_template](#input\_arm\_template) | The ARM template URL to download the template from. | `string` | `"https://raw.githubusercontent.com/Azure/Azure-Sentinel/135bcce714b0c92a310899c1a8061c95abd08b28/Solutions/SlackAudit/Data%20Connectors/azuredeploy_Connector_SlackAuditAPI_AzureFunction.json"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name which should be used for this Slack Audit Data Connector. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Resource Group where the Resource Group Template Deployment should exist. | `string` | n/a | yes |
| <a name="input_workspace_id"></a> [workspace\_id](#input\_workspace\_id) | The ID of the Log Analytics Workspace that this Slack Audit Data Connector resides in. | `string` | n/a | yes |
| <a name="input_workspace_key"></a> [workspace\_key](#input\_workspace\_key) | The key of the Log Analytics Workspace that this Slack Audit Data Connector resides in. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Resource Group Template Deployment. |
| <a name="output_output_content"></a> [output\_content](#output\_output\_content) | The JSON Content of the Outputs of the ARM Template Deployment. |
<!-- END_TF_DOCS -->
