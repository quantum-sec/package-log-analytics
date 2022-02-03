output "id" {
  value = module.data_connector_jira_audit.id
}

output "output_content" {
  description = "returns a string, use jsondecode() to parse"
  value       = module.data_connector_jira_audit.output_content
}

output "parameters_content" {
  description = "returns a string, use jsondecode() to parse"
  value       = module.data_connector_jira_audit.parameters_content
}

output "template_content" {
  description = "returns a string, use jsondecode() to parse"
  value       = module.data_connector_jira_audit.template_content
}

output "data_connector_jira_audit" {
  value = module.data_connector_jira_audit
}