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

variable "arm_template" {
  description = "(required)"
  type        = string
  nullable    = false
}

variable "parameters" {
  description = "(optional)"
  type        = string
  default     = null
}