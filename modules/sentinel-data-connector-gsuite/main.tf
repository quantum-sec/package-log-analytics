# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY SENTINEL DATA CONNECTOR FOR GOOGLE WORKSPACE (GSUITE)
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12.26"
  required_providers {
    azurerm = ">= 2.54.0"
  }
}

module "data_connector_gsuite" {
  source = "../sentinel-data-connector-arm-generic"
  # arm_template - (required) is a type of string
  arm_template = var.arm_template
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  # name - (required) is a type of string
  name = var.name
  parameters = jsonencode({
    # name - (required) is a type of string
    "FunctionName" = {
      value = var.name
    }
    # workspace_id - (required) is a type of string
    "WorkspaceID" = {
      value = var.workspace_id
    }
    # workspace_key - (required) is a type of string
    "WorkspaceKey" = {
      value = var.workspace_key
    }
    # pickle_string - (required) is a type of string
    "GooglePickleString" = {
      value = var.pickle_string
    }
  })
}
