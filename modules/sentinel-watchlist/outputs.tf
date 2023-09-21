output "id" {
  description = "The ID of the Sentinel Watchlist."
  value       = azurerm_sentinel_watchlist.watchlist.id
}

output "items_id" {
  description = "The ID of the Sentinel Watchlist Item."
  value       = values(azurerm_sentinel_watchlist_item.watchlist_item)[*].id
}
