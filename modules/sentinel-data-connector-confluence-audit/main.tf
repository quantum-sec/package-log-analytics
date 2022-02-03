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
  source       = "../sentinel-data-connector-arm-generic"
  arm_template = "https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/DataConnectors/AtlassianConfluenceAudit/azuredeploy_Connector_ConfluenceAuditAPI_AzureFunction.json"
  # location - (required) is a type of string
  location = var.location
  # name - (required) is a type of string
  name = var.name
  parameters = jsonencode({
    # name - (required) is a type of string
    "FunctionName" = {
      value = var.name
    }
    # workspaceId - (required) is a type of string
    "WorkspaceID" = {
      value = var.workspaceId
    }
    # workspaceKey - (required) is a type of string
    "WorkspaceKey" = {
      value = var.workspaceKey
    }
    # accessToken - (required) is a type of string
    "ConfluenceAccessToken" = {
      value = var.accessToken
    }
    # username - (required) is a type of string
    "ConfluenceUsername" = {
      value = var.username
    }
    # homesiteName - (required) is a type of string
    "ConfluenceHomeSiteName" = {
      value = var.homesiteName
    }
  })
}
