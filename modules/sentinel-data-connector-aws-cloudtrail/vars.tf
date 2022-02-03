variable "aws_role_arn" {
  description = "(required)"
  type        = string
  nullable    = false
}

variable "log_analytics_workspace_id" {
  description = "(required)"
  type        = string
  nullable    = false
}

variable "name" {
  description = "(required)"
  type        = string
  nullable    = false
}

variable "timeouts" {
  description = "nested block: NestingSingle, min items: 0, max items: 0"
  type = set(object(
    {
      create = string
      delete = string
      read   = string
      update = string
    }
  ))
  default = []
}