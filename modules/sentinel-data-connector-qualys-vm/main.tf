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
  source       = "../sentinel-data-connector-arm-generic"
  arm_template = "https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/DataConnectors/Qualys%20VM/azuredeploy_QualysVM_API_FunctionApp_V2.json"
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
    # filterParameters - (optional) is a type of string
    "FilterParameters" = {
      value = var.filterParameters
    }
    # timeInterval - (optional) is a type of string
    "TimeInterval" = {
      value = var.timeInterval
    }
  })
}