# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY SENTINEL DATA CONNECTOR MICROSOFT DEFENDER FOR CLOUD
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 1.2"
  required_providers {
    azurerm = ">= 2.54"
  }
}

resource "azurerm_sentinel_data_connector_azure_security_center" "data_connector_azure_security_center" {
  log_analytics_workspace_id = var.log_analytics_workspace_id
  name                       = var.name
  subscription_id            = var.subscription_id

}
