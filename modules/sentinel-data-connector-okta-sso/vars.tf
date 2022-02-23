variable "name" {
  description = "The name which should be used for this Okta SSO Data Connector."
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
  default     = "https://raw.githubusercontent.com/Azure/Azure-Sentinel/9422a1c90600b834619d1c570653f7ec24530155/DataConnectors/Okta%20Single%20Sign-On/azuredeploy_OktaSingleSignOn_API_FunctionApp_V2.json"
}

variable "workspace_id" {
  description = "The ID of the Log Analytics Workspace that this Okta SSO Data Connector resides in."
  type        = string
}

variable "workspace_key" {
  description = "The key of the Log Analytics Workspace that this Okta SSO Data Connector resides in."
  type        = string
}

variable "api_token" {
  description = "Okta API Token for access to audit data"
  type        = string
}

variable "okta_domain" {
  description = "Okta API Token for access to audit data"
  type        = string
}
