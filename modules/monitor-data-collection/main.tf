# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY AN AZURE MONITOR DATA COLLECTION RULE (DCR)
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.53"
    }
  }
  required_version = ">= 0.12"
  experiments      = [module_variable_optional_attrs]
}

resource "azurerm_monitor_data_collection_rule" "dcr" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  description         = var.description
  kind                = var.kind
  tags                = var.tags

  data_sources { #TODO: Fix this
    dynamic "data_import" {
      for_each = var.data_sources.data_import != null ? [var.data_sources.data_import] : []

      content {
        event_hub_data_source {
          name           = data_import.value.event_hub_data_source.name
          stream         = data_import.value.event_hub_data_source.stream
          consumer_group = data_import.value.event_hub_data_source.consumer_group
        }
      }
    }

    dynamic "extension" {
      for_each = var.data_sources.extension != null ? var.data_sources.extension : []

      content {
        extension {
          extension_name     = extension.value.extension_name
          name               = extension.value.name
          streams            = extension.value.streams
          extension_json     = extension.value.extension_json
          input_data_sources = extension.value.input_data_sources
        }
      }
    }

    dynamic "iis_log" {
      for_each = var.data_sources.iis_log != null ? var.data_sources.iis_log : []

      content {
        iis_log {
          name            = iis_log.value.name
          streams         = iis_log.value.streams
          log_directories = iis_log.value.log_directories
        }
      }
    }

    dynamic "log_file" {
      for_each = var.data_sources.log_file != null ? var.data_sources.log_file : []

      content {
        log_file {
          name          = log_file.value.name
          streams       = log_file.value.streams
          file_patterns = log_file.value.file_patterns
          format        = log_file.value.format
          settings = log_file.value.settings != null ? {
            text = {
              record_start_timestamp_format = log_file.value.settings.text.record_start_timestamp_format
            }
          } : null
        }
      }
    }

    dynamic "performance_counter" {
      for_each = var.data_sources.performance_counter != null ? var.data_sources.performance_counter : []

      content {
        performance_counter {
          name                          = performance_counter.value.name
          counter_specifiers            = performance_counter.value.counter_specifiers
          sampling_frequency_in_seconds = performance_counter.value.sampling_frequency_in_seconds
          streams                       = performance_counter.value.streams
        }
      }
    }

    dynamic "platform_telemetry" {
      for_each = var.data_sources.platform_telemetry != null ? var.data_sources.platform_telemetry : []

      content {
        platform_telemetry {
          name    = platform_telemetry.value.name
          streams = platform_telemetry.value.streams
        }
      }
    }

    dynamic "prometheus_forwarder" {
      for_each = var.data_sources.prometheus_forwarder != null ? var.data_sources.prometheus_forwarder : []

      content {
        prometheus_forwarder {
          name    = prometheus_forwarder.value.name
          streams = prometheus_forwarder.value.streams

          label_include_filter = prometheus_forwarder.value.label_include_filter != null ? [
            for label in prometheus_forwarder.value.label_include_filter : {
              label = label.label
              value = label.value
            }
          ] : null
        }
      }
    }

    dynamic "syslog" {
      for_each = var.data_sources.syslog != null ? var.data_sources.syslog : {}
      content {
        name           = syslog.value.name
        log_levels     = syslog.value.log_levels
        facility_names = syslog.value.facility_names
        streams        = syslog.value.streams
      }
    }

    dynamic "windows_event_log" {
      for_each = var.data_sources.windows_event_log != null ? var.data_sources.windows_event_log : {}
      content {
        name           = windows_event_log.value.name
        streams        = windows_event_log.value.streams
        x_path_queries = windows_event_log.value.x_path_queries
      }
    }

    dynamic "windows_firewall_log" {
      for_each = var.data_sources.windows_firewall_log != null ? var.data_sources.windows_firewall_log : {}
      content {
        name    = windows_firewall_log.value.name
        streams = windows_firewall_log.value.streams
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

  dynamic "destinations" {
    for_each = [var.destinations]
    content {
      dynamic "azure_monitor_metrics" {
        for_each = [destinations.value["azure_monitor_metrics"]] != null ? [destinations.value["azure_monitor_metrics"]] : []
        content {
          name = azure_monitor_metrics.value["name"]
        }
      }
      dynamic "event_hub" {
        for_each = destinations.value["event_hub"] != null ? destinations.value["event_hub"] : []
        content {
          name         = event_hub.value["name"]
          event_hub_id = event_hub.value["event_hub_id"]
        }
      }
      dynamic "event_hub_direct" {
        for_each = destinations.value["event_hub_direct"] != null ? destinations.value["event_hub_direct"] : []
        content {
          name         = event_hub_direct.value["name"]
          event_hub_id = event_hub_direct.value["event_hub_id"]
        }
      }
      dynamic "log_analytics" {
        for_each = destinations.value["log_analytics"] != null ? destinations.value["log_analytics"] : []
        content {
          name                  = log_analytics.value["name"]
          workspace_resource_id = log_analytics.value["workspace_resource_id"]
        }
      }
      dynamic "monitor_account" {
        for_each = destinations.value["monitor_account"] != null ? destinations.value["monitor_account"] : []
        content {
          name               = monitor_account.value["name"]
          monitor_account_id = monitor_account.value["monitor_account_id"]
        }
      }
      dynamic "storage_blob" {
        for_each = destinations.value["storage_blob"] != null ? destinations.value["storage_blob"] : []
        content {
          name               = storage_blob.value["name"]
          storage_account_id = storage_blob.value["storage_account_id"]
          container_name     = storage_blob.value["container_name"]
        }
      }
      dynamic "storage_blob_direct" {
        for_each = destinations.value["storage_blob_direct"] != null ? destinations.value["storage_blob_direct"] : []
        content {
          name               = storage_blob_direct.value["name"]
          storage_account_id = storage_blob_direct.value["storage_account_id"]
          container_name     = storage_blob_direct.value["container_name"]
        }
      }
      dynamic "storage_table_direct" {
        for_each = destinations.value["storage_table_direct"] != null ? destinations.value["storage_table_direct"] : []
        content {
          name               = storage_table_direct.value["name"]
          table_name         = storage_table_direct.value["table_name"]
          storage_account_id = storage_table_direct.value["storage_account_id"]
        }
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

resource "azurerm_monitor_data_collection_rule_association" "dcr_association" {
  name                    = "${var.name}-association"
  description             = var.description
  target_resource_id      = var.target_resource_id
  data_collection_rule_id = azurerm_monitor_data_collection_rule.dcr.id
}
