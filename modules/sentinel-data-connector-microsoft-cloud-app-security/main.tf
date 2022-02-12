# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY SENTINEL DATA CONNECTOR MICROSOFT DEFENDER FOR CLOUDAPPS
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12.26"
  required_providers {
    azurerm = ">= 2.54.0"
  }
}

resource "azurerm_sentinel_data_connector_microsoft_cloud_app_security" "data_connector_microsoft_cloud_app_security" {
  alerts_enabled             = var.alerts_enabled
  discovery_logs_enabled     = var.discovery_logs_enabled
  log_analytics_workspace_id = var.log_analytics_workspace_id
  name                       = var.name
  tenant_id                  = var.tenant_id

}
