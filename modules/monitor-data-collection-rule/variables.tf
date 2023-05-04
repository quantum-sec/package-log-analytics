variable "location" {
  type        = string
  description = "The Azure Region where the Data Collection Rule should exist"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group where the Data Collection Rule should exist"
}

variable "name" {
  type        = string
  description = "The name which should be used for this Data Collection Rule"
}

variable "target_resource_id" {
  type        = string
  description = "The ID of the Azure Resource which to associate to a Data Collection Rule or a Data Collection Endpoint."
}

variable "kind" {
  type        = string
  description = "The kind of the Data Collection Rule."
  default     = null
}

variable "description" {
  type        = string
  description = "The description of the Data Collection Rule"
  default     = ""
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource"
  default     = {}
}

variable "data_sources" {
  type = object({
    data_import = optional(object({
      event_hub_data_source = object({
        name           = string
        stream         = string
        consumer_group = optional(string)
      })
    }))
    extension = optional(list(object({
      extension_name     = string
      name               = string
      streams            = list(string)
      extension_json     = optional(string)
      input_data_sources = optional(list(string))
    })))
    iis_log = optional(list(object({
      name            = string
      streams         = list(string)
      log_directories = optional(list(string))
    })))
    log_file = optional(list(object({
      name          = string
      streams       = list(string)
      file_patterns = list(string)
      format        = string
      settings = optional(object({
        text = object({
          record_start_timestamp_format = string
        })
      }))
    })))
    performance_counter = optional(list(object({
      name                          = string
      counter_specifiers            = list(string)
      sampling_frequency_in_seconds = number
      streams                       = list(string)
    })))
    platform_telemetry = optional(list(object({
      name    = string
      streams = list(string)
    })))
    prometheus_forwarder = optional(list(object({
      name    = string
      streams = list(string)
      label_include_filter = optional(list(object({
        label = string
        value = string
      })))
    })))
    syslog = optional(list(object({
      name           = string
      log_levels     = list(string)
      facility_names = list(string)
      streams        = optional(list(string)) # After provider version 4.0, this will be required.
    })))
    windows_event_log = optional(list(object({
      name           = string
      streams        = list(string)
      x_path_queries = list(string)
    })))
    windows_firewall_log = optional(list(object({
      name    = string
      streams = list(string)
    })))
  })
  description = "A data_sources block."
  default     = {}
  # TODO: add variable validations
}

variable "data_flow" {
  type = list(object({
    destinations       = list(string)
    streams            = list(string)
    built_in_transform = optional(string)
    output_stream      = optional(string)
    transform_kql      = optional(string)
  }))
  description = "One or more data_flow blocks."
}

variable "destinations" {
  type = object({
    azure_monitor_metrics = optional(object({
      name = string
    }))
    event_hub = optional(list(object({
      name         = string
      event_hub_id = string
    })))
    event_hub_direct = optional(list(object({
      name         = string
      event_hub_id = string
    })))
    log_analytics = optional(list(object({
      name                  = string
      workspace_resource_id = string
    })))
    monitor_account = optional(list(object({
      name               = string
      monitor_account_id = string
    })))
    storage_blob = optional(list(object({
      name               = string
      storage_account_id = string
      container_name     = string
    })))
    storage_blob_direct = optional(list(object({
      name               = string
      storage_account_id = string
      container_name     = string
    })))
    storage_table_direct = optional(list(object({
      name               = string
      table_name         = string
      storage_account_id = string
    })))
  })
  description = "A destinations block."
  # TODO: add variable validations
}

variable "stream_declaration" {
  type = object({
    stream_name = string
    column = list(object({
      name = string
      type = string
    }))
  })
  default     = null
  description = "A stream_declaration block."
}

variable "identity" {
  type = object({
    type         = string
    identity_ids = optional(list(string))
  })
  default     = null
  description = "An identity block."
}
