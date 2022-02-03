# ---------------------------------------------------------------------------------------------------------------------
# GENERIC TERRAFORM MODULE FOR ARM TEMPLATE SENTINEL DATA CONNECTOR DEPLOYMENTS
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12.26"
  required_providers {
    azurerm = ">= 2.54.0"
  }
}

data "http" "arm_template" {
  # url - (required) is a type of string
  url = var.arm_template
}

resource "azurerm_resource_group" "data_connector_rg" {
  # location - (required) is a type of string
  location = var.location
  # name - (required) is a type of string
  name = "${var.name}-rg"

}

resource "azurerm_resource_group_template_deployment" "data_connector_arm" {
  # name - (required) is a type of string
  name            = "${var.name}-deployment"
  deployment_mode = "Complete" # != Incremental as RG is just for Sentinel Connector
  # parameters_content - (optional) is a type of string
  parameters_content  = var.parameters
  resource_group_name = azurerm_resource_group.data_connector_rg.name
  template_content    = data.http.arm_template.body

}