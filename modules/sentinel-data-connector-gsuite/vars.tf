variable "name" {
  description = "(required)"
  type        = string
  validation {
    condition     = length(var.name) < 11
    error_message = "Error: length(name) < 11"
  }
  nullable = false
}

variable "location" {
  description = "(required)"
  type        = string
  nullable    = false
}

variable "workspaceId" {
  description = "(required)"
  type        = string
  nullable    = false
}

variable "workspaceKey" {
  description = "(required)"
  sensitive   = true
  type        = string
  nullable    = false
}

variable "pickleString" {
  description = "(required)"
  sensitive   = true
  type        = string
  nullable    = false
}