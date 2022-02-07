output "id" {
  description = "The ID of the Resource Group Template Deployment."
  value       = module.data_connector_jira_audit.id
}

output "output_content" {
  description = "The JSON Content of the Outputs of the ARM Template Deployment."
  value       = module.data_connector_jira_audit.output_content
}
