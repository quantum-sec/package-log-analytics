# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# CREATE SUBSCRIPTION POLICY ASSIGNMENT
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

terraform {
  required_version = ">= 1.2"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.34"
    }
  }
}

resource "azurerm_subscription_policy_assignment" "this" {
  name                 = var.name
  policy_definition_id = var.policy_definition_id
  subscription_id      = var.subscription_id

  parameters = var.parameters
  location   = var.location

  identity {
    type = "SystemAssigned"
  }
}
