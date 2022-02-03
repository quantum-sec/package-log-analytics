variable "alerts_enabled" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "discovery_logs_enabled" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "log_analytics_workspace_id" {
  description = "(required)"
  type        = string
  nullable    = false
}

variable "name" {
  description = "(required)"
  type        = string
  nullable    = false
}

variable "tenant_id" {
  description = "(optional)"
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