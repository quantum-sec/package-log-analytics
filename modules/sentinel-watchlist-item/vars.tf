variable "name" {
  description = "The name in UUID format which should be used for this Sentinel Watchlist Item."
  type        = string
  default     = null
}

variable "watchlist_id" {
  description = "The ID of the Sentinel Watchlist that this Item resides in."
  type        = string
}

variable "properties" {
  description = "The key value pairs of the Sentinel Watchlist Item."
  type        = map(string)
}
