variable "name" {
  description = "The name which should be used for this Google workspace Sentinel Data Connector."
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
  default     = "https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/DataConnectors/GoogleWorkspaceReports/azuredeploy_Connector_GWorkspaceReportsAPI_AzureFunction.json?ref=da85f4e"
}

variable "workspace_id" {
  description = "The ID of the Log Analytics Workspace that this Google workspace Data Connector resides in."
  type        = string
}

variable "workspace_key" {
  description = "The key of the Log Analytics Workspace that this Google workspace Data Connector resides in."
  type        = string
}

variable "pickle_string" {
  description = "Google workspace credential pickle string"
  type        = string
}
