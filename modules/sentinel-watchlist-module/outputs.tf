output "id" {
  description = "The ID of the Sentinel Watchlist."
  value       = module.watchlist.id
}

output "items_id" {
  description = "The ID of the Sentinel Watchlist Item."
  value       = values(module.watchlist_item)[*].id
}
