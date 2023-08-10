# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY SENTINEL DATA CONNECTOR MICROSOFT DEFENDER FOR ENDPOINT
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 1.2"
  required_providers {
    azurerm = ">= 2.54"
  }
}

resource "azurerm_sentinel_data_connector_microsoft_defender_advanced_threat_protection" "data_connector_microsoft_defender_atp" {
  log_analytics_workspace_id = var.log_analytics_workspace_id
  name                       = var.name
  tenant_id                  = var.tenant_id

}
