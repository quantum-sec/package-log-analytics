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

resource "azurerm_resource_group_template_deployment" "data_connector_arm" {
  # name - (required) is a type of string
  name            = "${var.name}-deployment"
  deployment_mode = "Incremental"
  # parameters_content - (optional) is a type of string
  parameters_content = var.parameters
  # resource_group_name - (required) is a type of string
  resource_group_name = var.resource_group_name
  template_content    = data.http.arm_template.body

}
