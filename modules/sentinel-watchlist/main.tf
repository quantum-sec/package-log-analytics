# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY A MICROSOFT SENTINEL WATCHLIST
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 1.2"
  required_providers {
    azurerm = ">= 3.2.0"
  }
}

resource "azurerm_sentinel_watchlist" "watchlist" {
  name                       = var.name
  log_analytics_workspace_id = var.log_analytics_workspace_id
  display_name               = var.name
  description                = var.description
  item_search_key            = var.item_search_key
  default_duration           = var.default_duration
  labels                     = var.labels
}
