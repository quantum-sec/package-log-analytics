output "logic_app_id" {
  description = "The ID of the LogicApp."
  value       = local.playbooks_template_output["logicAppId"].value
}

output "output_content" {
  description = "The JSON content of the outputs of the ARM template deployment."
  value       = module.azure_sentinel_playbooks.output_content
}
