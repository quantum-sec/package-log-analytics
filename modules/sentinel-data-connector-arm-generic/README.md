## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.54.0 |

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
| [azurerm_resource_group.data_connector_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group)                                          | resource    |
| [azurerm_resource_group_template_deployment.data_connector_arm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group_template_deployment) | resource    |
| [http_http.arm_template](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http)                                                                      | data source |

## Inputs

| Name                                                                     | Description | Type     | Default | Required |
|--------------------------------------------------------------------------|-------------|----------|---------|:--------:|
| <a name="input_arm_template"></a> [arm\_template](#input\_arm\_template) | (required)  | `string` | n/a     |   yes    |
| <a name="input_location"></a> [location](#input\_location)               | (required)  | `string` | n/a     |   yes    |
| <a name="input_name"></a> [name](#input\_name)                           | (required)  | `string` | n/a     |   yes    |
| <a name="input_parameters"></a> [parameters](#input\_parameters)         | (optional)  | `string` | `null`  |    no    |

## Outputs

| Name                                                                                           | Description                                 |
|------------------------------------------------------------------------------------------------|---------------------------------------------|
| <a name="output_data_connector_arm"></a> [data\_connector\_arm](#output\_data\_connector\_arm) | n/a                                         |
| <a name="output_id"></a> [id](#output\_id)                                                     | n/a                                         |
| <a name="output_output_content"></a> [output\_content](#output\_output\_content)               | returns a string, use jsondecode() to parse |
| <a name="output_parameters_content"></a> [parameters\_content](#output\_parameters\_content)   | returns a string, use jsondecode() to parse |
| <a name="output_template_content"></a> [template\_content](#output\_template\_content)         | returns a string, use jsondecode() to parse |
