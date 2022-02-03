output "id" {
  value = module.data_connector_qualys_vm.id
}

output "output_content" {
  description = "returns a string, use jsondecode() to parse"
  value       = module.data_connector_qualys_vm.output_content
}

output "parameters_content" {
  description = "returns a string, use jsondecode() to parse"
  value       = module.data_connector_qualys_vm.parameters_content
}

output "template_content" {
  description = "returns a string, use jsondecode() to parse"
  value       = module.data_connector_qualys_vm.template_content
}

output "data_connector_qualys_vm" {
  value = module.data_connector_qualys_vm
}