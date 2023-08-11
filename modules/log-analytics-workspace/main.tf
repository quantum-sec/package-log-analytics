# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY AN AZURE LOG ANALYTICS WORKSPACE
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.34"
    }
  }
  required_version = ">= 1.2"
}

resource "azurerm_log_analytics_workspace" "workspace" {
  name                               = var.name
  resource_group_name                = var.resource_group_name
  location                           = var.location
  sku                                = var.sku
  retention_in_days                  = var.retention_in_days
  daily_quota_gb                     = var.daily_quota_gb
  internet_ingestion_enabled         = var.internet_ingestion_enabled
  internet_query_enabled             = var.internet_query_enabled
  reservation_capacity_in_gb_per_day = var.sku == "CapacityReservation" ? var.reservation_capacity_in_gb_per_day : null
  tags                               = var.tags
}
