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

variable "workspaceId" {
  description = "(required)"
  type        = string
}

variable "workspaceKey" {
  description = "(required)"
  type        = string
}

variable "username" {
  description = "(required)"
  type        = string
}

variable "password" {
  description = "(required)"
  type        = string
}

variable "uri" {
  description = "(required)"
  type        = string
}

variable "filterParameters" {
  description = "(optional)"
  type        = string
  default     = "&truncation_limit=50"
}

variable "timeInterval" {
  description = "(optional)"
  type        = string
  default     = "5"
}
