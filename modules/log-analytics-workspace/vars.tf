variable "location" {
  description = "The Azure region in which this Azure Log Analytics workspace will be deployed."
  type        = string
}

variable "name" {
  description = "The name to assign to the Log Analytics workspace."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which this Log Analytics workspace will be provisioned."
  type        = string
}

variable "sku" {
  description = "Specifies the SKU of the Log Analytics Workspace."
  type        = string
  default     = null
  validation {
    error_message = "Possible values are \"Free\", \"PerNode\", \"Premium\", \"Standard\", \"Standalone\", \"Unlimited\", \"CapacityReservation\", and \"PerGB2018\"."
    condition = anytrue([
      var.sku == "Free",
      var.sku == "PerNode",
      var.sku == "Premium",
      var.sku == "Standard",
      var.sku == "Standalone",
      var.sku == "Unlimited",
      var.sku == "CapacityReservation",
      var.sku == "PerGB2018",
      var.sku == null
    ])
  }
}

variable "retention_in_days" {
  description = "The workspace data retention in days. Possible values are a range between 30 and 730."
  type        = number
  default     = null
  validation {
    error_message = "Possible values are either 7 (Free Tier only) or range between 30 and 730."
    condition = var.retention_in_days == null ? true : (
    var.retention_in_days == 7 || (var.retention_in_days >= 30 && var.retention_in_days <= 730))
  }
}

variable "daily_quota_gb" {
  description = "The workspace daily quota for ingestion in GB."
  type        = number
  default     = null
}

variable "internet_ingestion_enabled" {
  description = "Should the Log Analytics Workspace support ingestion over the Public Internet."
  type        = bool
  default     = null
}

variable "internet_query_enabled" {
  description = "Should the Log Analytics Workspace support querying over the Public Internet."
  type        = bool
  default     = null
}

variable "reservation_capacity_in_gb_per_day" {
  description = "The capacity reservation level in GB for this workspace."
  type        = number
  default     = null
  validation {
    condition = var.reservation_capacity_in_gb_per_day == null ? true : (
    var.reservation_capacity_in_gb_per_day >= 100 && var.reservation_capacity_in_gb_per_day <= 5000)
    error_message = "`reservation_capacity_in_gb_per_day` must be between 100 and 5000."
  }
  validation {
    condition = var.reservation_capacity_in_gb_per_day == null ? true : (
    var.reservation_capacity_in_gb_per_day % 100 == 0)
    error_message = "`reservation_capacity_in_gb_per_day` must be in increments of 100."
  }
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
