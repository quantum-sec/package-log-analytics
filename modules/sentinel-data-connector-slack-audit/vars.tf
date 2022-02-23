variable "name" {
  description = "The name which should be used for this Slack Audit Data Connector."
  type        = string
  validation {
    condition     = length(var.name) < 11
    error_message = "Error: length(name) must be <11."
  }
}

variable "resource_group_name" {
  description = "The name of the Resource Group where the Resource Group Template Deployment should exist."
  type        = string
}

variable "arm_template" {
  description = "The ARM template URL to download the template from."
  type        = string
  default     = "https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/Solutions/SlackAudit/Data%20Connectors/azuredeploy_Connector_SlackAuditAPI_AzureFunction.json?ref=135bcce"
}

variable "workspace_id" {
  description = "The ID of the Log Analytics Workspace that this Slack Audit Data Connector resides in."
  type        = string
}

variable "workspace_key" {
  description = "The key of the Log Analytics Workspace that this Slack Audit Data Connector resides in."
  type        = string
}

variable "api_bearer_token" {
  description = "Slack API Bearer Token to access audit logs"
  type        = string
}
