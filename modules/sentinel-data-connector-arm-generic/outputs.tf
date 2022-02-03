output "id" {
  value = azurerm_resource_group_template_deployment.data_connector_arm.id
}

output "output_content" {
  description = "returns a string, use jsondecode() to parse"
  value       = azurerm_resource_group_template_deployment.data_connector_arm.output_content
}

output "parameters_content" {
  description = "returns a string, use jsondecode() to parse"
  value       = azurerm_resource_group_template_deployment.data_connector_arm.parameters_content
}

output "template_content" {
  description = "returns a string, use jsondecode() to parse"
  value       = azurerm_resource_group_template_deployment.data_connector_arm.template_content
}

output "data_connector_arm" {
  value = azurerm_resource_group_template_deployment.data_connector_arm
}