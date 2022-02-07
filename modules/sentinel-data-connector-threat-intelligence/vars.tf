variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace that this Threat Intelligence Data Connector resides in."
  type        = string
}

variable "name" {
  description = "The name which should be used for this Threat Intelligence Data Connector."
  type        = string
}

variable "tenant_id" {
  description = "The ID of the tenant that this Threat Intelligence Data Connector connects to."
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
