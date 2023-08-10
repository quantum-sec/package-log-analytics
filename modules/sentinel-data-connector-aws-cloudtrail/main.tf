# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY SENTINEL DATA CONNECTOR FOR AWS CLOUDTRAIL
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 1.2"
  required_providers {
    azurerm = ">= 2.54"
  }
}

resource "azurerm_sentinel_data_connector_aws_cloud_trail" "data_connector_aws_cloudtrail" {
  aws_role_arn               = var.aws_role_arn
  log_analytics_workspace_id = var.log_analytics_workspace_id
  name                       = var.name

}
