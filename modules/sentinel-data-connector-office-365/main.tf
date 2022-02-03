# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY SENTINEL DATA CONNECTOR FOR OFFICE 365
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12.26"
  required_providers {
    azurerm = ">= 2.54.0"
  }
}

resource "azurerm_sentinel_data_connector_office_365" "data_connector_office_365" {
  # exchange_enabled - (optional) is a type of bool
  exchange_enabled = var.exchange_enabled
  # log_analytics_workspace_id - (required) is a type of string
  log_analytics_workspace_id = var.log_analytics_workspace_id
  # name - (required) is a type of string
  name = var.name
  # sharepoint_enabled - (optional) is a type of bool
  sharepoint_enabled = var.sharepoint_enabled
  # teams_enabled - (optional) is a type of bool
  teams_enabled = var.teams_enabled
  # tenant_id - (optional) is a type of string
  tenant_id = var.tenant_id

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
