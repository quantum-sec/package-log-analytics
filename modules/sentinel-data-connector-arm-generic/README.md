<!-- BEGIN_TF_DOCS -->
## Requirements

| Name                                                                      | Version    |
|---------------------------------------------------------------------------|------------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm)       | >= 2.54.0  |

## Providers

| Name                                                          | Version   |
|---------------------------------------------------------------|-----------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 2.54.0 |
| <a name="provider_http"></a> [http](#provider\_http)          | n/a       |

## Modules

No modules.

## Resources

| Name                                                                                                                                                                                | Type        |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------|
| [azurerm_resource_group_template_deployment.data_connector_arm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group_template_deployment) | resource    |
| [http_http.arm_template](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http)                                                                      | data source |

## Inputs

| Name                                                                                            | Description                                                                               | Type     | Default | Required |
|-------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------|----------|---------|:--------:|
| <a name="input_arm_template"></a> [arm\_template](#input\_arm\_template)                        | The ARM template URL to download the template from.                                       | `string` | n/a     |   yes    |
| <a name="input_name"></a> [name](#input\_name)                                                  | The name which should be used for the Sentinel Data Connector.                            | `string` | n/a     |   yes    |
| <a name="input_parameters"></a> [parameters](#input\_parameters)                                | The contents of the ARM Template parameters file - containing a JSON list of parameters.  | `string` | `null`  |    no    |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Resource Group where the Resource Group Template Deployment should exist. | `string` | n/a     |   yes    |

## Outputs

| Name                                                                             | Description                                                     |
|----------------------------------------------------------------------------------|-----------------------------------------------------------------|
| <a name="output_id"></a> [id](#output\_id)                                       | The ID of the Resource Group Template Deployment.               |
| <a name="output_output_content"></a> [output\_content](#output\_output\_content) | The JSON Content of the Outputs of the ARM Template Deployment. |
<!-- END_TF_DOCS -->