# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY A MICROSOFT SENTINEL WATCHLIST + WATCHLIST ITEMS
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 1.2"
  required_providers {
    azurerm = ">= 3.2.0"
    time    = ">= 0.11.2"
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

resource "time_sleep" "delay_before_create_watchlist_items" {
  depends_on      = [azurerm_sentinel_watchlist.watchlist]
  create_duration = "10s"
}


resource "azurerm_sentinel_watchlist_item" "watchlist_item" {
  depends_on   = [time_sleep.delay_before_create_watchlist_items]
  for_each     = { for index, elem in var.properties : index => elem }
  watchlist_id = azurerm_sentinel_watchlist.watchlist.id
  properties   = each.value
}
