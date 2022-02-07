variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace that this Azure Active Directory Data Connector resides in."
  type        = string
}

variable "name" {
  description = "The name which should be used for this Azure Active Directory Data Connector."
  type        = string
}

variable "tenant_id" {
  description = "The ID of the tenant that this Azure Active Directory Data Connector connects to."
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
