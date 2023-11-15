variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the Metric Alert instance."
}

variable "name" {
  type        = string
  description = "The name of the Metric Alert."
}

variable "scopes" {
  type        = set(string)
  description = "Resource IDs at which the metric criteria should be applied."
}

variable "enabled" {
  type        = bool
  description = "Should this Metric Alert be enabled?"
  default     = true
}

variable "auto_mitigate" {
  type        = bool
  description = "Should the alerts in this Metric Alert be auto resolved?"
  default     = true
}

variable "description" {
  type        = string
  description = "The description of this Metric Alert."
  default     = ""
}

variable "frequency" {
  type        = string
  description = "The evaluation frequency of this Metric Alert, represented in ISO 8601 duration format."
  default     = "PT1M"
}

variable "severity" {
  type        = number
  description = "The severity of this Metric Alert."
  default     = 3
}

variable "target_resource_type" {
  type        = string
  description = "The resource type of the target resource."
  default     = ""
}

variable "target_resource_location" {
  type        = string
  description = "The location of the target resource."
  default     = ""
}

variable "window_size" {
  type        = string
  description = "The period of time that is used to monitor alert activity, represented in ISO 8601 duration format."
  default     = "PT5M"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource"
  default     = {}
}

variable "action" {
  type = list(object({
    action_group_id    = string
    webhook_properties = optional(map(string))
  }))
  default     = []
  description = "Define a list of actions to trigger when an alert is triggered."
}

variable "criteria" {
  type = list(object({
    metric_namespace = string
    metric_name      = string
    aggregation      = string
    operator         = string
    threshold        = number
    dimension = optional(list(object({
      name     = string
      operator = string
      values   = list(string)
    })))
    skip_metric_validation = optional(bool)
  }))
  default     = []
  description = "One or more criteria blocks."
}

variable "dynamic_criteria" {
  type = object({
    metric_namespace  = string
    metric_name       = string
    aggregation       = string
    operator          = string
    alert_sensitivity = string
    dimension = optional(list(object({
      name     = string
      operator = string
      values   = list(string)
    })))
    evaluation_total_count   = optional(number)
    evaluation_failure_count = optional(number)
    ignore_data_before       = optional(string)
    skip_metric_validation   = optional(bool)
  })
  default     = null
  description = "A dynamic_criteria block."
}

variable "application_insights_web_test_location_availability_criteria" {
  type = object({
    web_test_id           = string
    component_id          = string
    failed_location_count = number
  })
  default     = null
  description = "A application_insights_web_test_location_availability_criteria block."
}

variable "webhook_url" {
  type        = string
  description = "The URI where webhooks should be sent."
}
