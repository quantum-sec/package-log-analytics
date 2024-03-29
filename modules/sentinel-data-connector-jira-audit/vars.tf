variable "name" {
  description = "The name which should be used for this Jira Audit Data Connector."
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
  default     = "https://raw.githubusercontent.com/Azure/Azure-Sentinel/9218a8839d6b8b2d95ee426b97a7f1fd6744ae45/DataConnectors/AtlassianJiraAudit/azuredeploy_Connector_JiraAuditAPI_AzureFunction.json"
}

variable "workspace_id" {
  description = "The ID of the Log Analytics Workspace that this Jira Audit Data Connector resides in."
  type        = string
}

variable "workspace_key" {
  description = "The key of the Log Analytics Workspace that this Jira Audit Data Connector resides in."
  type        = string
}

variable "access_token" {
  description = "Jira access_token for audit stream"
  type        = string
}

variable "username" {
  description = "Jira username for audit stream"
  type        = string
}

variable "homesite_name" {
  description = "https://HOMESITENAME.atlassian.net"
  type        = string
}
