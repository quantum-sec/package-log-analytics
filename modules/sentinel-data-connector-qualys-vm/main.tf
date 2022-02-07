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
    # username - (required) is a type of string
    "APIUsername" = {
      value = var.username
    }
    # password - (required) is a type of string
    "APIPassword" = {
      value = var.password
    }
    # uri - (required) is a type of string
    "Uri" = {
      value = var.uri
    }
    # filter_parameters - (optional) is a type of string
    "FilterParameters" = {
      value = var.filter_parameters
    }
    # time_interval - (optional) is a type of string
    "TimeInterval" = {
      value = var.time_interval
    }
  })
}
