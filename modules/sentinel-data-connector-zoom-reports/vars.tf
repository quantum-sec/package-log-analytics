variable "name" {
  description = "The name which should be used for this Zoom Reports Data Connector."
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
  default     = "https://raw.githubusercontent.com/Azure/Azure-Sentinel/bf94fa717261f21b64a4582c9c307dc44d2d21fe/DataConnectors/ZoomReports/azuredeploy_Connector_ZoomAPI_AzureFunction.json"
}

variable "workspace_id" {
  description = "The ID of the Log Analytics Workspace that this Zoom Reports Data Connector resides in."
  type        = string
}

variable "workspace_key" {
  description = "The key of the Log Analytics Workspace that this Zoom Reports Data Connector resides in."
  type        = string
}

variable "api_key" {
  description = "Zoom API key to access audit reports"
  type        = string
}

variable "api_secret" {
  description = "Zoom API Secret to access audit reports"
  type        = string
}
