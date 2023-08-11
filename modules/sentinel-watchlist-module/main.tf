# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY A MICROSOFT SENTINEL WATCHLIST + WATCHLIST ITEMS
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 1.2"
  required_providers {
    azurerm = ">= 3.2.0"
  }
}

module "watchlist" {
  source                     = "../sentinel-watchlist"
  name                       = var.name
  log_analytics_workspace_id = var.log_analytics_workspace_id
  description                = var.description
  item_search_key            = var.item_search_key
}

module "watchlist_item" {
  for_each     = { for index, elem in var.properties : index => elem }
  source       = "../sentinel-watchlist-item"
  watchlist_id = module.watchlist.id
  properties   = each.value
}
