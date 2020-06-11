variable "location" {
  description = "The Azure region in which the Log Analytics workspace is provisioned."
  type        = string
}

variable "workspace_name" {
  description = "The name of the Log Analytics workspace with which the solution will be linked."
  type        = string
}

variable "workspace_resource_id" {
  description = "The full resource ID of the Log Analytics workspace with which the solution will be linked."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which the Log Analytics solution will be provisioned."
  type        = string
}

variable "solution_name" {
  description = "Specifies the name of the solution to be deployed."
  type        = string
}

variable "publisher" {
  description = "The publisher of the solution. For example `Microsoft`."
  type        = string
}

variable "product" {
  description = "The product name of the solution. For example `OMSGallery/Containers`."
  type        = string
}
