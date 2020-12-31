# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY AN AZURE LOG ANALYTICS SAVED SEARCH
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12.26"
}

resource "azurerm_log_analytics_saved_search" "search" {
  name                       = var.name
  display_name               = coalesce(var.display_name, var.name)
  category                   = var.category
  log_analytics_workspace_id = var.log_analytics_workspace_id

  query = var.query

  function_alias      = var.function_alias
  function_parameters = var.function_parameters

  tags = var.tags
}
