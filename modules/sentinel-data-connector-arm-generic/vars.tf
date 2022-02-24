variable "name" {
  description = "The name which should be used for the Sentinel Data Connector."
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
}

variable "parameters" {
  description = "The contents of the ARM Template parameters file - containing a JSON list of parameters."
  type        = string
  default     = null
}
