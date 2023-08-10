# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY A MICROSOFT SENTINEL WATCHLIST ITEM
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 1.2"
  required_providers {
    azurerm = ">= 3.2.0"
  }
}

resource "azurerm_sentinel_watchlist_item" "watchlist_item" {
  name         = var.name
  watchlist_id = var.watchlist_id
  properties   = var.properties
}
