# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY AN AZURE LOG ANALYTICS SOLUTION
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.34"
    }
  }
  required_version = ">= 0.12.26"
}

resource "azurerm_log_analytics_solution" "solution" {
  solution_name         = var.solution_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = var.workspace_resource_id
  workspace_name        = var.workspace_name

  plan {
    publisher = var.publisher
    product   = var.product
  }

  tags = var.tags

}
