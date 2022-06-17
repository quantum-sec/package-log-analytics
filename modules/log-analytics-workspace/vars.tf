variable "location" {
  description = "The Azure region in which this Azure Log Analytics workspace will be deployed."
  type        = string
}

variable "name" {
  description = "The name to assign to the Log Analytics workspace."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which this Log Analytics workspace will be provisioned."
  type        = string
}

variable "sku" {
  description = "The SKU that determines the class of workspace to be provisioned. Currently only `PerGB2018` is accepted for new workspaces."
  type        = string
  default     = null
}

variable "retention_in_days" {
  description = "The workspace data retention in days. Possible values are a range between 30 and 730."
  type        = number
  default     = 31
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}
