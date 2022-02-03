## Requirements

| Name                                                                      | Version    |
|---------------------------------------------------------------------------|------------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm)       | >= 2.54.0  |

## Providers

No providers.

## Modules

| Name                                                                                                               | Source                                 | Version |
|--------------------------------------------------------------------------------------------------------------------|----------------------------------------|---------|
| <a name="module_data_connector_qualys_vm"></a> [data\_connector\_qualys\_vm](#module\_data\_connector\_qualys\_vm) | ../sentinel-data-connector-arm-generic | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                               | Description | Type     | Default                  | Required |
|------------------------------------------------------------------------------------|-------------|----------|--------------------------|:--------:|
| <a name="input_filterParameters"></a> [filterParameters](#input\_filterParameters) | (optional)  | `string` | `"&truncation_limit=50"` |    no    |
| <a name="input_location"></a> [location](#input\_location)                         | (required)  | `string` | n/a                      |   yes    |
| <a name="input_name"></a> [name](#input\_name)                                     | (required)  | `string` | n/a                      |   yes    |
| <a name="input_password"></a> [password](#input\_password)                         | (required)  | `string` | n/a                      |   yes    |
| <a name="input_timeInterval"></a> [timeInterval](#input\_timeInterval)             | (optional)  | `string` | `"5"`                    |    no    |
| <a name="input_uri"></a> [uri](#input\_uri)                                        | (required)  | `string` | n/a                      |   yes    |
| <a name="input_username"></a> [username](#input\_username)                         | (required)  | `string` | n/a                      |   yes    |
| <a name="input_workspaceId"></a> [workspaceId](#input\_workspaceId)                | (required)  | `string` | n/a                      |   yes    |
| <a name="input_workspaceKey"></a> [workspaceKey](#input\_workspaceKey)             | (required)  | `string` | n/a                      |   yes    |

## Outputs

| Name                                                                                                               | Description                                 |
|--------------------------------------------------------------------------------------------------------------------|---------------------------------------------|
| <a name="output_data_connector_qualys_vm"></a> [data\_connector\_qualys\_vm](#output\_data\_connector\_qualys\_vm) | n/a                                         |
| <a name="output_id"></a> [id](#output\_id)                                                                         | n/a                                         |
| <a name="output_output_content"></a> [output\_content](#output\_output\_content)                                   | returns a string, use jsondecode() to parse |
| <a name="output_parameters_content"></a> [parameters\_content](#output\_parameters\_content)                       | returns a string, use jsondecode() to parse |
| <a name="output_template_content"></a> [template\_content](#output\_template\_content)                             | returns a string, use jsondecode() to parse |