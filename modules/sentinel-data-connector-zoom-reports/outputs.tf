output "id" {
  value = module.data_connector_zoom_reports.id
}

output "output_content" {
  description = "returns a string, use jsondecode() to parse"
  value       = module.data_connector_zoom_reports.output_content
}

output "parameters_content" {
  description = "returns a string, use jsondecode() to parse"
  value       = module.data_connector_zoom_reports.parameters_content
}

output "template_content" {
  description = "returns a string, use jsondecode() to parse"
  value       = module.data_connector_zoom_reports.template_content
}

output "data_connector_zoom_reports" {
  value = module.data_connector_zoom_reports
}