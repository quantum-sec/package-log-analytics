# ---------------------------------------------------------------------------------------------------------------------
# GENERIC TERRAFORM MODULE FOR ARM TEMPLATE SENTINEL DATA CONNECTOR DEPLOYMENTS
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 1.2"
  required_providers {
    azurerm = ">= 2.54.0"
    http    = ">= 3.2.1"
  }
}

data "http" "arm_template" {
  url = var.arm_template
}

resource "azurerm_resource_group_template_deployment" "data_connector_arm" {
  name                = "${var.name}-deployment"
  deployment_mode     = "Incremental"
  parameters_content  = var.parameters
  resource_group_name = var.resource_group_name
  template_content    = data.http.arm_template.body

}
