# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY SENTINEL DATA CONNECTOR FOR AWS S3
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12.26"
  required_providers {
    azurerm = ">= 3.34"
  }
}

resource "azurerm_sentinel_data_connector_aws_s3" "data_connector_aws_s3" {
  name                       = var.name
  log_analytics_workspace_id = var.log_analytics_workspace_id
  aws_role_arn               = var.aws_role_arn
  destination_table          = var.destination_table
  sqs_urls                   = var.sqs_urls
}
