variable "exchange_enabled" {
  description = "Should the Exchange data connector be enabled?"
  type        = bool
  default     = true
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace that this Office 365 Data Connector resides in."
  type        = string
}

variable "name" {
  description = "The name which should be used for this Office 365 Data Connector."
  type        = string
}

variable "sharepoint_enabled" {
  description = "Should the SharePoint data connector be enabled?"
  type        = bool
  default     = true
}

variable "teams_enabled" {
  description = "Should the Microsoft Teams data connector be enabled?"
  type        = bool
  default     = true
}

variable "tenant_id" {
  description = "The ID of the Tenant that this Office 365 Data Connector connects to."
  type        = string
  default     = null
}
