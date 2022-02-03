# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY SENTINEL DATA CONNECTOR MICROSOFT DEFENDER FOR CLOUD
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12.26"
  required_providers {
    azurerm = ">= 2.54.0"
  }
}

resource "azurerm_sentinel_data_connector_azure_security_center" "data_connector_azure_security_center" {
  # log_analytics_workspace_id - (required) is a type of string
  log_analytics_workspace_id = var.log_analytics_workspace_id
  # name - (required) is a type of string
  name = var.name
  # subscription_id - (optional) is a type of string
  subscription_id = var.subscription_id

  dynamic "timeouts" {
    for_each = var.timeouts
    content {
      # create - (optional) is a type of string
      create = timeouts.value["create"]
      # delete - (optional) is a type of string
      delete = timeouts.value["delete"]
      # read - (optional) is a type of string
      read = timeouts.value["read"]
    }
  }

}
