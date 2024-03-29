# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY AN AZURE LOG ANALYTICS SAVED SEARCH
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

resource "azurerm_log_analytics_saved_search" "search" {
  name                       = var.name
  display_name               = var.name
  category                   = var.category
  log_analytics_workspace_id = var.log_analytics_workspace_id

  query = var.query

  function_alias      = var.name
  function_parameters = var.function_parameters

  tags = var.tags
}
