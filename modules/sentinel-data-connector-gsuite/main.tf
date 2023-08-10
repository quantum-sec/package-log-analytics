# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY SENTINEL DATA CONNECTOR FOR GOOGLE WORKSPACE (GSUITE)
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 1.2"
  required_providers {
    azurerm = ">= 2.54.0"
  }
}

module "data_connector_gsuite" {
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
    "GooglePickleString" = {
      value = var.pickle_string
    }
  })
}
