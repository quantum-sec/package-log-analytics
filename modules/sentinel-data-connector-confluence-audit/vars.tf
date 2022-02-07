variable "name" {
  description = "The name which should be used for this Confluence Audit Data Connector."
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
  default     = "https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/DataConnectors/AtlassianConfluenceAudit/azuredeploy_Connector_ConfluenceAuditAPI_AzureFunction.json"
}

variable "workspace_id" {
  description = "The ID of the Log Analytics Workspace that this Confluence Audit Data Connector resides in."
  type        = string
}

variable "workspace_key" {
  description = "The key of the Log Analytics Workspace that this Confluence Audit Data Connector resides in."
  type        = string
}

variable "access_token" {
  description = "Confluence access_token for audit stream"
  type        = string
}

variable "username" {
  description = "Confluence username for audit stream"
  type        = string
}

variable "homesite_name" {
  description = "https://HOMESITENAME.atlassian.net"
  type        = string
}
