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
    "ConfluenceAccessToken" = {
      value = var.access_token
    }
    "ConfluenceUsername" = {
      value = var.username
    }
    "ConfluenceHomeSiteName" = {
      value = var.homesite_name
    }
  })
}
