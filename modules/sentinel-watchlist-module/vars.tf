variable "name" {
  description = "The name which should be used for this Sentinel Watchlist."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace where this Sentinel Watchlist resides in."
  type        = string
}

variable "item_search_key" {
  description = "The key used to optimize query performance when using Watchlist for joins with other data."
  type        = string
}

variable "description" {
  description = "The description of this Sentinel Watchlist."
  type        = string
  default     = null
}

variable "properties" {
  description = "The key value pairs of the Sentinel Watchlist Item."
  type        = list(map(string))
}
