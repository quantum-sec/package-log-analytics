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

variable "accessToken" {
  description = "(required)"
  type        = string
}

variable "username" {
  description = "(required)"
  type        = string
}

variable "homesiteName" {
  description = "(required)"
  type        = string
}
