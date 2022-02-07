output "id" {
  description = "The ID of the Resource Group Template Deployment."
  value       = module.data_connector_qualys_vm.id
}

output "output_content" {
  description = "The JSON Content of the Outputs of the ARM Template Deployment."
  value       = module.data_connector_qualys_vm.output_content
}