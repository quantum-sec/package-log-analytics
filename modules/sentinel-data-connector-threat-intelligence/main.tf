# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY SENTINEL DATA CONNECTOR FOR THREAT INTELLIGENCE PLATFORMS
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12.26"
  required_providers {
    azurerm = ">= 2.54"
  }
}

resource "azurerm_sentinel_data_connector_threat_intelligence" "data_connector_threat_intelligence" {
  log_analytics_workspace_id = var.log_analytics_workspace_id
  name                       = var.name
  tenant_id                  = var.tenant_id

}
