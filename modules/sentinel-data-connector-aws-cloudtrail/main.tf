# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY SENTINEL DATA CONNECTOR FOR AWS CLOUDTRAIL
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12.26"
  required_providers {
    azurerm = ">= 2.54.0"
  }
}

resource "azurerm_sentinel_data_connector_aws_cloud_trail" "data_connector_aws_cloudtrail" {
  # aws_role_arn - (required) is a type of string
  aws_role_arn = var.aws_role_arn
  # log_analytics_workspace_id - (required) is a type of string
  log_analytics_workspace_id = var.log_analytics_workspace_id
  # name - (required) is a type of string
  name = var.name

  dynamic "timeouts" {
    for_each = var.timeouts
    content {
      # create - (optional) is a type of string
      create = timeouts.value["create"]
      # delete - (optional) is a type of string
      delete = timeouts.value["delete"]
      # read - (optional) is a type of string
      read = timeouts.value["read"]
      # update - (optional) is a type of string
      update = timeouts.value["update"]
    }
  }

}
