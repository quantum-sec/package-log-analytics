variable "name" {
  description = "The name which should be used for this AWS S3 Data Connector."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace that this AWS S3 Data Connector resides in."
  type        = string
}

variable "aws_role_arn" {
  description = "The ARN of the AWS role, which is connected to this AWS S3 Data Connector."
  type        = string
}

variable "destination_table" {
  description = "The name of the Log Analytics table that will store the ingested data."
  type        = string

  validation {
    condition     = contains(["AWSCloudTrail", "AWSGuardDuty", "AWSVPCFlow"], var.destination_table)
    error_message = "Invalid input, options: \"AWSCloudTrail\", \"AWSGuardDuty\", \"AWSVPCFlow\"."
  }
}

variable "sqs_urls" {
  description = "Specifies a list of AWS SQS urls for the AWS S3 Data Connector."
  type        = set(string)
}
