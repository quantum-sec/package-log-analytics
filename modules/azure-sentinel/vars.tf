variable "location" {
  description = "The Azure region in which LA workspace associated with sentinel instance will be deployed."
  type        = string
}

variable "workspace_name" {
  description = "The name to assign to the LA workspace on which sentinel will be deployed"
  type        = string
}

variable "workspace_resource_id" {
  description = "workspace id of LA workspace on which sentinel will be deployed"
}

variable "resource_group_name" {
  description = "The name of the resource group in which this LA workspace will be provisioned."
  type        = string
}

variable "solution_name" {
  description = "For binding LA workspace to azure sentinel add SecurityInsights as solution name"
  type        = string
  default     = "SecurityInsights"
}

variable "product" {
  description = "Select type of product to be part of LA workspace as a solution. In the case of AZ sentinel below mentioned is the product."
  type        = string
  default     = "OMSGallery/SecurityInsights"
}

variable "publisher" {
  description = "(Required) The publisher of the solution. For example Quantum. Changing this forces a new resource to be created."
  type        = string
  default     = "Microsoft"
}
