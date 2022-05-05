# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY SENTINEL DATA CONNECTOR FOR OFFICE 365
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12.26"
  required_providers {
    azurerm = ">= 2.54"
  }
}

resource "azurerm_sentinel_data_connector_office_365" "data_connector_office_365" {
  exchange_enabled           = var.exchange_enabled
  log_analytics_workspace_id = var.log_analytics_workspace_id
  name                       = var.name
  sharepoint_enabled         = var.sharepoint_enabled
  teams_enabled              = var.teams_enabled
  tenant_id                  = var.tenant_id

}
