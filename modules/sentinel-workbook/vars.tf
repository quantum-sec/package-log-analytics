# ---------------------------------------------------------------------------------------------------------------------
# MODULE VARIABLES
# ---------------------------------------------------------------------------------------------------------------------

variable "resource_group_name" {
  description = "The name of the resource group in which this resource will be provisioned."
  type        = string
}

variable "name" {
  description = "The name of the workbook that will be deployed in Microsoft Sentinel."
  type        = string
  default     = "Quantum-Workbook"
}

variable "workbook_source_id" {
  description = "The resource id of log analytics workspace on which the workbook will be deployed."
  type        = string
}

variable "workbook_content" {
  description = "Content of the workbook to deploy"
  type        = string
}
