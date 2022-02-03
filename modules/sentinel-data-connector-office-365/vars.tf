variable "exchange_enabled" {
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

variable "sharepoint_enabled" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "teams_enabled" {
  description = "(optional)"
  type        = bool
  default     = null
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