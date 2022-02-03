## Requirements

| Name                                                                      | Version    |
|---------------------------------------------------------------------------|------------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm)       | >= 2.54.0  |

## Providers

No providers.

## Modules

| Name                                                                                                    | Source                                 | Version |
|---------------------------------------------------------------------------------------------------------|----------------------------------------|---------|
| <a name="module_data_connector_gsuite"></a> [data\_connector\_gsuite](#module\_data\_connector\_gsuite) | ../sentinel-data-connector-arm-generic | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                   | Description | Type     | Default | Required |
|------------------------------------------------------------------------|-------------|----------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location)             | (required)  | `string` | n/a     |   yes    |
| <a name="input_name"></a> [name](#input\_name)                         | (required)  | `string` | n/a     |   yes    |
| <a name="input_pickleString"></a> [pickleString](#input\_pickleString) | (required)  | `string` | n/a     |   yes    |
| <a name="input_workspaceId"></a> [workspaceId](#input\_workspaceId)    | (required)  | `string` | n/a     |   yes    |
| <a name="input_workspaceKey"></a> [workspaceKey](#input\_workspaceKey) | (required)  | `string` | n/a     |   yes    |

## Outputs

| Name                                                                                                    | Description                                 |
|---------------------------------------------------------------------------------------------------------|---------------------------------------------|
| <a name="output_data_connector_gsuite"></a> [data\_connector\_gsuite](#output\_data\_connector\_gsuite) | n/a                                         |
| <a name="output_id"></a> [id](#output\_id)                                                              | n/a                                         |
| <a name="output_output_content"></a> [output\_content](#output\_output\_content)                        | returns a string, use jsondecode() to parse |
| <a name="output_parameters_content"></a> [parameters\_content](#output\_parameters\_content)            | returns a string, use jsondecode() to parse |
| <a name="output_template_content"></a> [template\_content](#output\_template\_content)                  | returns a string, use jsondecode() to parse |
