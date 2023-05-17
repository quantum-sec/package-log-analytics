output "id" {
  description = "The ID of the Azure resource."
  value       = [for table in azapi_resource.workspace_table : table.id]
}

output "output" {
  description = "The output from the response body."
  value       = [for table in azapi_resource.workspace_table : jsondecode(table.output).id]
}
