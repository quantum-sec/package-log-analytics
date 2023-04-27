<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.53 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.53.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_monitor_data_collection_rule.dcr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_data_collection_rule) | resource |
| [azurerm_monitor_data_collection_rule_association.dcr_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_data_collection_rule_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_data_flow"></a> [data\_flow](#input\_data\_flow) | One or more data\_flow blocks as defined below. | <pre>list(object({<br>    destinations       = list(string)<br>    streams            = list(string)<br>    built_in_transform = optional(string)<br>    output_stream      = optional(string)<br>    transform_kql      = optional(string)<br>  }))</pre> | n/a | yes |
| <a name="input_data_sources"></a> [data\_sources](#input\_data\_sources) | A data\_sources block as defined below. | <pre>object({<br>    data_import = optional(object({<br>      event_hub_data_source = object({<br>        name           = string<br>        stream         = string<br>        consumer_group = optional(string)<br>      })<br>    }))<br>    extension = optional(list(object({<br>      extension_name     = string<br>      name               = string<br>      streams            = list(string)<br>      extension_json     = optional(string)<br>      input_data_sources = optional(list(string))<br>    })))<br>    iis_log = optional(list(object({<br>      name            = string<br>      streams         = list(string)<br>      log_directories = optional(list(string))<br>    })))<br>    log_file = optional(list(object({<br>      name          = string<br>      streams       = list(string)<br>      file_patterns = list(string)<br>      format        = string<br>      settings = optional(object({<br>        text = object({<br>          record_start_timestamp_format = string<br>        })<br>      }))<br>    })))<br>    performance_counter = optional(list(object({<br>      name                          = string<br>      counter_specifiers            = list(string)<br>      sampling_frequency_in_seconds = number<br>      streams                       = list(string)<br>    })))<br>    platform_telemetry = optional(list(object({<br>      name    = string<br>      streams = list(string)<br>    })))<br>    prometheus_forwarder = optional(list(object({<br>      name    = string<br>      streams = list(string)<br>      label_include_filter = optional(list(object({<br>        label = string<br>        value = string<br>      })))<br>    })))<br>    syslog = optional(list(object({<br>      name           = string<br>      log_levels     = list(string)<br>      facility_names = list(string)<br>      streams        = optional(list(string)) # After provider version 4.0, this will be required.<br>    })))<br>    windows_event_log = optional(list(object({<br>      name           = string<br>      streams        = list(string)<br>      x_path_queries = list(string)<br>    })))<br>    windows_firewall_log = optional(list(object({<br>      name    = string<br>      streams = list(string)<br>    })))<br>  })</pre> | `{}` | no |
| <a name="input_description"></a> [description](#input\_description) | The description of the Data Collection Rule | `string` | `""` | no |
| <a name="input_destinations"></a> [destinations](#input\_destinations) | A destinations block as defined below | <pre>object({<br>    azure_monitor_metrics = optional(object({<br>      name = string<br>    }))<br>    event_hub = optional(list(object({<br>      name         = string<br>      event_hub_id = string<br>    })))<br>    event_hub_direct = optional(list(object({<br>      name         = string<br>      event_hub_id = string<br>    })))<br>    log_analytics = optional(list(object({<br>      name                  = string<br>      workspace_resource_id = string<br>    })))<br>    monitor_account = optional(list(object({<br>      name               = string<br>      monitor_account_id = string<br>    })))<br>    storage_blob = optional(list(object({<br>      name               = string<br>      storage_account_id = string<br>      container_name     = string<br>    })))<br>    storage_blob_direct = optional(list(object({<br>      name               = string<br>      storage_account_id = string<br>      container_name     = string<br>    })))<br>    storage_table_direct = optional(list(object({<br>      name               = string<br>      table_name         = string<br>      storage_account_id = string<br>    })))<br>  })</pre> | n/a | yes |
| <a name="input_identity"></a> [identity](#input\_identity) | An identity block as defined below. | <pre>object({<br>    type         = string<br>    identity_ids = optional(list(string))<br>  })</pre> | `null` | no |
| <a name="input_kind"></a> [kind](#input\_kind) | The kind of the Data Collection Rule. | `string` | `""` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure Region where the Data Collection Rule should exist | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name which should be used for this Data Collection Rule | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Resource Group where the Data Collection Rule should exist | `string` | n/a | yes |
| <a name="input_stream_declaration"></a> [stream\_declaration](#input\_stream\_declaration) | A stream\_declaration block as defined below. | <pre>object({<br>    stream_name = string<br>    column = list(object({<br>      name = string<br>      type = string<br>    }))<br>  })</pre> | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to the resource | `map(string)` | `{}` | no |
| <a name="input_target_resource_id"></a> [target\_resource\_id](#input\_target\_resource\_id) | The ID of the Azure Resource which to associate to a Data Collection Rule or a Data Collection Endpoint. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Data Collection Rule. |
<!-- END_TF_DOCS -->
