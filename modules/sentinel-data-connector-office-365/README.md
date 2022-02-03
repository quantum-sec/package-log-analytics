## Requirements

| Name                                                                      | Version    |
|---------------------------------------------------------------------------|------------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.26 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm)       | >= 2.54.0  |

## Providers

| Name                                                          | Version   |
|---------------------------------------------------------------|-----------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 2.54.0 |

## Modules

No modules.

## Resources

| Name                                                                                                                                                                                       | Type     |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------|
| [azurerm_sentinel_data_connector_office_365.data_connector_office_365](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sentinel_data_connector_office_365) | resource |

## Inputs

| Name                                                                                                                   | Description                                             | Type                                                                                                                                                 | Default | Required |
|------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|---------|:--------:|
| <a name="input_exchange_enabled"></a> [exchange\_enabled](#input\_exchange\_enabled)                                   | (optional)                                              | `bool`                                                                                                                                               | `true`  |    no    |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | (required)                                              | `string`                                                                                                                                             | n/a     |   yes    |
| <a name="input_name"></a> [name](#input\_name)                                                                         | (required)                                              | `string`                                                                                                                                             | n/a     |   yes    |
| <a name="input_sharepoint_enabled"></a> [sharepoint\_enabled](#input\_sharepoint\_enabled)                             | (optional)                                              | `bool`                                                                                                                                               | `true`  |    no    |
| <a name="input_teams_enabled"></a> [teams\_enabled](#input\_teams\_enabled)                                            | (optional)                                              | `bool`                                                                                                                                               | `true`  |    no    |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id)                                                        | (optional)                                              | `string`                                                                                                                                             | `null`  |    no    |
| <a name="input_timeouts"></a> [timeouts](#input\_timeouts)                                                             | nested block: NestingSingle, min items: 0, max items: 0 | <pre>set(object(<br>    {<br>      create = string<br>      delete = string<br>      read   = string<br>      update = string<br>    }<br>  ))</pre> | `[]`    |    no    |

## Outputs

| Name                                                                                                                  | Description |
|-----------------------------------------------------------------------------------------------------------------------|-------------|
| <a name="output_data_connector_office_365"></a> [data\_connector\_office\_365](#output\_data\_connector\_office\_365) | n/a         |
| <a name="output_id"></a> [id](#output\_id)                                                                            | n/a         |
| <a name="output_tenant_id"></a> [tenant\_id](#output\_tenant\_id)                                                     | n/a         |