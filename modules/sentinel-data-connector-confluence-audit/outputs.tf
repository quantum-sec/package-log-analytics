output "id" {
  value = module.data_connector_confluence_audit.id
}

output "output_content" {
  description = "returns a string, use jsondecode() to parse"
  value       = module.data_connector_confluence_audit.output_content
}

output "parameters_content" {
  description = "returns a string, use jsondecode() to parse"
  value       = module.data_connector_confluence_audit.parameters_content
}

output "template_content" {
  description = "returns a string, use jsondecode() to parse"
  value       = module.data_connector_confluence_audit.template_content
}

output "data_connector_confluence_audit" {
  value = module.data_connector_confluence_audit
}