# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY AN AZURE LOG ANALYTICS WORKSPACE TABLE
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.53"
    }
    azapi = {
      source  = "azure/azapi"
      version = "~> 1.6"
    }
  }
  required_version = ">= 0.12"
  experiments      = [module_variable_optional_attrs]
}

# If the Error: `Changing Classic table AzureDiagnostics schema by using DataCollectionRuleBased tables api is forbidden,
# please migrate the table first or use the appropriate classic table api.`
# is noticed. Please check the documentation below
# https://learn.microsoft.com/en-us/azure/azure-monitor/logs/custom-logs-migrate#migration-procedure

resource "azapi_resource" "workspace_table" {
  for_each               = var.mode == "Create" ? var.tables : {}
  type                   = "Microsoft.OperationalInsights/workspaces/tables@2022-10-01"
  name                   = each.key
  parent_id              = var.workspace_resource_id
  response_export_values = ["id"]
  body = jsonencode({
    properties = {
      plan                 = each.value["plan"]
      retentionInDays      = each.value["retentionInDays"]
      totalRetentionInDays = each.value["totalRetentionInDays"]
      schema = {
        columns = [
          for column in each.value["columns"] : {
            dataTypeHint = column["dataTypeHint"]
            description  = column["description"]
            displayName  = column["displayName"]
            name         = column["name"]
            type         = column["type"]
          }
        ]
        description = each.value["description"]
        displayName = each.value["displayName"]
        name        = each.key
      }
    }
  })
}

resource "azapi_update_resource" "workspace_table" {
  for_each               = var.mode == "Update" ? var.tables : {}
  type                   = "Microsoft.OperationalInsights/workspaces/tables@2022-10-01"
  name                   = each.key
  parent_id              = var.workspace_resource_id
  response_export_values = ["id"]
  body = jsonencode({
    properties = {
      plan                 = each.value["plan"]
      retentionInDays      = each.value["retentionInDays"]
      totalRetentionInDays = each.value["totalRetentionInDays"]
      schema               = null
    }
  })
}
