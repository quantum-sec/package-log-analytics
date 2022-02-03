# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY SENTINEL DATA CONNECTOR FOR ZOOM REPORTS
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12.26"
  required_providers {
    azurerm = ">= 2.54.0"
  }
}

module "data_connector_zoom_reports" {
  source       = "../sentinel-data-connector-arm-generic"
  arm_template = "https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/DataConnectors/ZoomReports/azuredeploy_Connector_ZoomAPI_AzureFunction.json"
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
    # apiKey - (required) is a type of string
    "ZoomApiKey" = {
      value = var.apiKey
    }
    # apiSecret - (required) is a type of string
    "ZoomApiSecret" = {
      value = var.apiSecret
    }
  })
}
