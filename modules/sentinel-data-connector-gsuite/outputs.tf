output "id" {
  value = module.data_connector_gsuite.id
}

output "output_content" {
  description = "returns a string, use jsondecode() to parse"
  value       = module.data_connector_gsuite.output_content
}

output "parameters_content" {
  description = "returns a string, use jsondecode() to parse"
  value       = module.data_connector_gsuite.parameters_content
}

output "template_content" {
  description = "returns a string, use jsondecode() to parse"
  value       = module.data_connector_gsuite.template_content
}

output "data_connector_gsuite" {
  value = module.data_connector_gsuite
}