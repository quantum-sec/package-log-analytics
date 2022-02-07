output "id" {
  description = "The ID of the Resource Group Template Deployment."
  value       = azurerm_resource_group_template_deployment.data_connector_arm.id
}

output "output_content" {
  description = "The JSON Content of the Outputs of the ARM Template Deployment."
  value       = azurerm_resource_group_template_deployment.data_connector_arm.output_content
}