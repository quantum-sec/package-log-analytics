variable "name" {
  description = "(required)"
  type        = string
  validation {
    condition     = length(var.name) < 11
    error_message = "Error: length(name) must be <11."
  }
}

variable "location" {
  description = "(required)"
  type        = string
}

variable "arm_template" {
  description = "(required)"
  type        = string
}

variable "parameters" {
  description = "(optional)"
  type        = string
  default     = null
}
