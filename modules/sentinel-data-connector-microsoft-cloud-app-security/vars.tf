variable "alerts_enabled" {
  description = "Should the alerts be enabled?"
  type        = bool
  default     = true
}

variable "discovery_logs_enabled" {
  description = "Should the Discovery Logs be enabled?"
  type        = bool
  default     = true
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace that this Microsoft Cloud App Security Data Connector resides in."
  type        = string
}

variable "name" {
  description = "The name which should be used for this Microsoft Cloud App Security Data Connector."
  type        = string
}

variable "tenant_id" {
  description = "The ID of the Tenant that this Microsoft Cloud App Security Data Connector connects to."
  type        = string
  default     = null
}

variable "timeouts" {
  description = "nested block: NestingSingle, min items: 0, max items: 0"
  type = set(object(
    {
      create = string
      delete = string
      read   = string
      update = string
    }
  ))
  default = []
}
