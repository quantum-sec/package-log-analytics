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
  source       = "../sentinel-data-connector-arm-generic"
  arm_template = "https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/DataConnectors/GoogleWorkspaceReports/azuredeploy_Connector_GWorkspaceReportsAPI_AzureFunction.json"
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
    # pickleString - (required) is a type of string
    "GooglePickleString" = {
      value = var.pickleString
    }
  })
}
