variable "resource_group_name" {
  description = "The name of the resource group in which this resource will be provisioned."
  type        = string
}

variable "arm_deployment_name_prefix" {
  description = "A unique string prepended to the ARM deployment name to ensure it is globally unique (i.e. your company name)."
  type        = string
}

variable "playbook_template" {
  description = "The JSON template of the playbook to be deployed"
  type        = string
}

variable "parameters_override" {
  description = "Key/Value map to be applied to the arm script parameters."
  type        = map(string)
  default     = {}
}

variable "role_definition_name" {
  description = "The name of role definitiion in Azure subscription that is required to be assigned."
  type        = string
  default     = "Microsoft Sentinel Automation Contributor"
}

variable "sentinel_principal_id" {
  description = "This is the Microsoft Sentinel Application ID that we can extract from Azure AD enterprise application."
  type        = string
  default     = null
}
