# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY SENTINEL DATA CONNECTOR FOR QUALYS VULNERABILITY MANAGEMENT
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12.26"
  required_providers {
    azurerm = ">= 2.54.0"
  }
}

module "data_connector_qualys_vm" {
  source              = "../sentinel-data-connector-arm-generic"
  arm_template        = var.arm_template
  resource_group_name = var.resource_group_name
  name                = var.name
  parameters = jsonencode({
    "FunctionName" = {
      value = var.name
    }
    "WorkspaceID" = {
      value = var.workspace_id
    }
    "WorkspaceKey" = {
      value = var.workspace_key
    }
    "APIUsername" = {
      value = var.username
    }
    "APIPassword" = {
      value = var.password
    }
    "Uri" = {
      value = var.uri
    }
    "FilterParameters" = {
      value = var.filter_parameters
    }
    "TimeInterval" = {
      value = var.time_interval
    }
  })
}
