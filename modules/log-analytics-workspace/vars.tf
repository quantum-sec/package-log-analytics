variable "location" {
  description = "The Azure region in which this Azure Log Analytics workspace will be deployed."
  type        = string
}

variable "name" {
  description = "The name to assign to the LA workspace."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which this LA workspace will be provisioned."
  type        = string
}

variable "sku" {
  description = "The SKU that determines the class of workspace to be provisioned. Either `Free` , `Standard` , `PerGB2018` or `Premium`."
  type        = string
  default     = "Free"
}

variable "retention_in_days" {
  description = "(Optional) The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730."
  type        = string
  default     = 7
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = string
  default     = null
}
