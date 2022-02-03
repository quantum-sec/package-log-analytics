output "id" {
  value = module.data_connector_okta_sso.id
}

output "output_content" {
  description = "returns a string, use jsondecode() to parse"
  value       = module.data_connector_okta_sso.output_content
}

output "parameters_content" {
  description = "returns a string, use jsondecode() to parse"
  value       = module.data_connector_okta_sso.parameters_content
}

output "template_content" {
  description = "returns a string, use jsondecode() to parse"
  value       = module.data_connector_okta_sso.template_content
}

output "data_connector_okta_sso" {
  value = module.data_connector_okta_sso
}