# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY SENTINEL DATA CONNECTOR FOR JIRA AUDIT
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12.26"
  required_providers {
    azurerm = ">= 2.54.0"
  }
}

module "data_connector_jira_audit" {
  source       = "../sentinel-data-connector-arm-generic"
  arm_template = "https://raw.githubusercontent.com/Azure/Azure-Sentinel/master/DataConnectors/AtlassianJiraAudit/azuredeploy_Connector_JiraAuditAPI_AzureFunction.json"
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
    "JiraAccessToken" = {
      value = var.accessToken
    }
    # username - (required) is a type of string
    "JiraUsername" = {
      value = var.username
    }
    # homesiteName - (required) is a type of string
    "JiraHomeSiteName" = {
      value = var.homesiteName
    }
  })
}
