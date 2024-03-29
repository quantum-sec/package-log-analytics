# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY AN AZURE MONITOR DATA COLLECTION RULE (DCR)
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.53"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
  }
  required_version = ">= 1.2"
  experiments      = [module_variable_optional_attrs]
}

resource "azurerm_monitor_data_collection_rule" "dcr" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  description         = var.description
  kind                = var.kind
  tags                = var.tags

  dynamic "data_sources" {
    for_each = var.data_sources != {} ? [var.data_sources] : []
    content {
      dynamic "data_import" {
        for_each = data_sources.value["data_import"] != null ? [data_sources.value["data_import"]] : []
        content {
          event_hub_data_source {
            name           = data_import.value["event_hub_data_source"]["name"]
            stream         = data_import.value["event_hub_data_source"]["stream"]
            consumer_group = data_import.value["event_hub_data_source"]["consumer_group"]
          }
        }
      }
      dynamic "extension" {
        for_each = data_sources.value["extension"] != null ? data_sources.value["extension"] : []
        content {
          extension_name     = extension.value["extension_name"]
          name               = extension.value["name"]
          streams            = extension.value["streams"]
          extension_json     = extension.value["extension_json"]
          input_data_sources = extension.value["input_data_sources"]
        }
      }
      dynamic "iis_log" {
        for_each = data_sources.value["iis_log"] != null ? data_sources.value["iis_log"] : []
        content {
          name            = iis_log.value["name"]
          streams         = iis_log.value["streams"]
          log_directories = iis_log.value["log_directories"]
        }
      }
      dynamic "log_file" {
        for_each = data_sources.value["log_file"] != null ? data_sources.value["log_file"] : []
        content {
          name          = log_file.value["name"]
          streams       = log_file.value["streams"]
          file_patterns = log_file.value["file_patterns"]
          format        = log_file.value["format"]
          dynamic "settings" {
            for_each = log_file.value["settings"] != null ? [log_file.value["settings"]] : []
            content {
              text {
                record_start_timestamp_format = settings.value["text"]["record_start_timestamp_format"]
              }
            }
          }
        }
      }
      dynamic "performance_counter" {
        for_each = data_sources.value["performance_counter"] != null ? data_sources.value["performance_counter"] : []
        content {
          name                          = performance_counter.value["name"]
          counter_specifiers            = performance_counter.value["counter_specifiers"]
          sampling_frequency_in_seconds = performance_counter.value["sampling_frequency_in_seconds"]
          streams                       = performance_counter.value["streams"]
        }
      }
      dynamic "platform_telemetry" {
        for_each = data_sources.value["platform_telemetry"] != null ? data_sources.value["platform_telemetry"] : []
        content {
          name    = platform_telemetry.value["name"]
          streams = platform_telemetry.value["streams"]
        }
      }
      dynamic "prometheus_forwarder" {
        for_each = data_sources.value["prometheus_forwarder"] != null ? data_sources.value["prometheus_forwarder"] : []
        content {
          name    = prometheus_forwarder.value["name"]
          streams = prometheus_forwarder.value["streams"]
          dynamic "label_include_filter" {
            for_each = prometheus_forwarder.value["label_include_filter"] != null ? prometheus_forwarder.value["label_include_filter"] : []
            content {
              label = label_include_filter.value["label"]
              value = label_include_filter.value["value"]
            }
          }
        }
      }
      dynamic "syslog" {
        for_each = data_sources.value["syslog"] != null ? data_sources.value["syslog"] : []
        content {
          name           = syslog.value["name"]
          log_levels     = syslog.value["log_levels"]
          facility_names = syslog.value["facility_names"]
          streams        = syslog.value["streams"]
        }
      }
      dynamic "windows_event_log" {
        for_each = data_sources.value["windows_event_log"] != null ? data_sources.value["windows_event_log"] : []
        content {
          name           = windows_event_log.value["name"]
          streams        = windows_event_log.value["streams"]
          x_path_queries = windows_event_log.value["x_path_queries"]
        }
      }
      dynamic "windows_firewall_log" {
        for_each = data_sources.value["windows_firewall_log"] != null ? data_sources.value["windows_firewall_log"] : []
        content {
          name    = windows_firewall_log.value["name"]
          streams = windows_firewall_log.value["streams"]
        }
      }
    }
  }

  dynamic "data_flow" {
    for_each = var.data_flow
    content {
      destinations       = data_flow.value["destinations"]
      streams            = data_flow.value["streams"]
      built_in_transform = data_flow.value["built_in_transform"]
      output_stream      = data_flow.value["output_stream"]
      transform_kql      = data_flow.value["transform_kql"]
    }
  }

  destinations {
    dynamic "azure_monitor_metrics" {
      for_each = var.destinations["azure_monitor_metrics"] != null ? [var.destinations["azure_monitor_metrics"]] : []
      content {
        name = azure_monitor_metrics.value["name"]
      }
    }
    dynamic "event_hub" {
      for_each = var.destinations["event_hub"] != null ? var.destinations["event_hub"] : []
      content {
        name         = event_hub.value["name"]
        event_hub_id = event_hub.value["event_hub_id"]
      }
    }
    dynamic "event_hub_direct" {
      for_each = var.destinations["event_hub_direct"] != null ? var.destinations["event_hub_direct"] : []
      content {
        name         = event_hub_direct.value["name"]
        event_hub_id = event_hub_direct.value["event_hub_id"]
      }
    }
    dynamic "log_analytics" {
      for_each = var.destinations["log_analytics"] != null ? var.destinations["log_analytics"] : []
      content {
        name                  = log_analytics.value["name"]
        workspace_resource_id = log_analytics.value["workspace_resource_id"]
      }
    }
    dynamic "monitor_account" {
      for_each = var.destinations["monitor_account"] != null ? var.destinations["monitor_account"] : []
      content {
        name               = monitor_account.value["name"]
        monitor_account_id = monitor_account.value["monitor_account_id"]
      }
    }
    dynamic "storage_blob" {
      for_each = var.destinations["storage_blob"] != null ? var.destinations["storage_blob"] : []
      content {
        name               = storage_blob.value["name"]
        storage_account_id = storage_blob.value["storage_account_id"]
        container_name     = storage_blob.value["container_name"]
      }
    }
    dynamic "storage_blob_direct" {
      for_each = var.destinations["storage_blob_direct"] != null ? var.destinations["storage_blob_direct"] : []
      content {
        name               = storage_blob_direct.value["name"]
        storage_account_id = storage_blob_direct.value["storage_account_id"]
        container_name     = storage_blob_direct.value["container_name"]
      }
    }
    dynamic "storage_table_direct" {
      for_each = var.destinations["storage_table_direct"] != null ? var.destinations["storage_table_direct"] : []
      content {
        name               = storage_table_direct.value["name"]
        table_name         = storage_table_direct.value["table_name"]
        storage_account_id = storage_table_direct.value["storage_account_id"]
      }
    }
  }

  dynamic "stream_declaration" {
    for_each = var.stream_declaration != null ? [var.stream_declaration] : []
    content {
      stream_name = stream_declaration.value["stream_name"]
      dynamic "column" {
        for_each = stream_declaration.value["column"]
        content {
          name = column.value["name"]
          type = column.value["type"]
        }
      }
    }
  }

  dynamic "identity" {
    for_each = var.identity != null ? [var.identity] : []
    content {
      type         = identity.value["type"]
      identity_ids = identity.value["identity_ids"]
    }
  }
}

# azurerm_monitor_data_collection_rule_association doesn't support resource of type
# 'Microsoft.OperationalInsights/workspaces'
# https://github.com/hashicorp/terraform-provider-azurerm/issues/20637

#resource "azurerm_monitor_data_collection_rule_association" "dcr_association" {
#  name                    = "${var.name}-association"
#  description             = var.description
#  target_resource_id      = var.target_resource_id
#  data_collection_rule_id = azurerm_monitor_data_collection_rule.dcr.id
#}

# TODO: add validations for resource_group_name and target_resource_id to prevent potential CLI injection.
# DCR needs to be linked to a Log Analytics workspace
# https://learn.microsoft.com/en-gb/azure/azure-monitor/logs/tutorial-workspace-transformations-api#link-workspace-to-dcr
resource "null_resource" "dcr_association" {
  provisioner "local-exec" {
    command = "az monitor log-analytics workspace update --resource-group ${var.resource_group_name} --workspace-name ${var.target_resource_id} --data-collection-rule \"${azurerm_monitor_data_collection_rule.dcr.id}\""
  }
  depends_on = [
    azurerm_monitor_data_collection_rule.dcr
  ]
}
