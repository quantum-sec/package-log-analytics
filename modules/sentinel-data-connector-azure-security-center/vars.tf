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

variable "subscription_id" {
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
    }
  ))
  default = []
}