variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace that this Azure Security Center Data Connector resides in."
  type        = string
}

variable "name" {
  description = "The name which should be used for this Azure Security Center Data Connector."
  type        = string
}

variable "subscription_id" {
  description = "The ID of the subscription that this Azure Security Center Data Connector connects to."
  type        = string
  default     = null
}
