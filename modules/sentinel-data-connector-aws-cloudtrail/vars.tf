variable "aws_role_arn" {
  description = "The ARN of the AWS CloudTrail role, which is connected to this AWS CloudTrail Data Connector."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace that this AWS CloudTrail Data Connector resides in."
  type        = string
}

variable "name" {
  description = "The name which should be used for this AWS CloudTrail Data Connector."
  type        = string
}
