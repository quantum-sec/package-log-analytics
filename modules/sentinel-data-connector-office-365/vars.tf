variable "exchange_enabled" {
  description = "(optional)"
  type        = bool
  default     = true
}

variable "log_analytics_workspace_id" {
  description = "(required)"
  type        = string
}

variable "name" {
  description = "(required)"
  type        = string
}

variable "sharepoint_enabled" {
  description = "(optional)"
  type        = bool
  default     = true
}

variable "teams_enabled" {
  description = "(optional)"
  type        = bool
  default     = true
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