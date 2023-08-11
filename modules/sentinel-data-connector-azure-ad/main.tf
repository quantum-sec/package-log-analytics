# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY SENTINEL DATA CONNECTOR FOR AZURE ACTIVE DIRECTORY
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 1.2"
  required_providers {
    azurerm = ">= 2.54"
  }
}

resource "azurerm_sentinel_data_connector_azure_active_directory" "data_connector_azure_ad" {
  log_analytics_workspace_id = var.log_analytics_workspace_id
  name                       = var.name
  tenant_id                  = var.tenant_id

}
