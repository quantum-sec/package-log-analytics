# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY SENTINEL DATA CONNECTOR FOR OKTA SSO
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12.26"
  required_providers {
    azurerm = ">= 2.54.0"
  }
}

module "data_connector_okta_sso" {
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
    "APIToken" = {
      value = var.api_token
    }
    "Uri" = {
      value = "https://${var.okta_domain}/api/v1/logs?since="
    }
  })
}
