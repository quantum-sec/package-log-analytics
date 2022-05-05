<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.54 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 2.54 |

## Resources

| Name | Type |
|------|------|
| [azurerm_sentinel_data_connector_aws_cloud_trail.data_connector_aws_cloudtrail](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_aws_cloud_trail) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_role_arn"></a> [aws\_role\_arn](#input\_aws\_role\_arn) | The ARN of the AWS CloudTrail role, which is connected to this AWS CloudTrail Data Connector. | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | The ID of the Log Analytics Workspace that this AWS CloudTrail Data Connector resides in. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name which should be used for this AWS CloudTrail Data Connector. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the AWS CloudTrail Data Connector. |
<!-- END_TF_DOCS -->
