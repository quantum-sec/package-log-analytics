# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY SENTINEL DATA CONNECTOR FOR CONFLUENCE AUDIT
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12.26"
  required_providers {
    azurerm = ">= 2.54.0"
  }
}

module "data_connector_confluence_audit" {
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
    # access_token - (required) is a type of string
    "ConfluenceAccessToken" = {
      value = var.access_token
    }
    # username - (required) is a type of string
    "ConfluenceUsername" = {
      value = var.username
    }
    # homesite_name - (required) is a type of string
    "ConfluenceHomeSiteName" = {
      value = var.homesite_name
    }
  })
}
