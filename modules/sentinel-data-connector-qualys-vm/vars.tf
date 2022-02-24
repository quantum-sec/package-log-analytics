variable "name" {
  description = "The name which should be used for this Qualys VM Data Connector."
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
  default     = "https://raw.githubusercontent.com/Azure/Azure-Sentinel/b6cb23d9ff4dfa7943d548bd464b2bb13d9e9637/DataConnectors/Qualys%20VM/azuredeploy_QualysVM_API_FunctionApp_V2.json"
}

variable "workspace_id" {
  description = "The ID of the Log Analytics Workspace that this Qualys VM Data Connector resides in."
  type        = string
}

variable "workspace_key" {
  description = "The key of the Log Analytics Workspace that this Qualys VM Data Connector resides in."
  type        = string
}

variable "username" {
  description = "Qualys username for vulnerability management audit logs"
  type        = string
}

variable "password" {
  description = "Qualys password for vulnerability management audit logs"
  type        = string
}

variable "uri" {
  description = "Qualys uri for vulnerability management audit logs"
  type        = string
}

variable "filter_parameters" {
  description = "Filter parameters for Qualys audit logs"
  type        = string
  default     = "&truncation_limit=50"
}

variable "time_interval" {
  description = "Polling time interval to fetch Qualys audit logs"
  type        = string
  default     = "5"
}
