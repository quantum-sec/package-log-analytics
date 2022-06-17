output "name" {
  description = "The name of the Log Analytics workspace."
  value       = azurerm_log_analytics_workspace.workspace.name
}

output "id" {
  description = "The ID of the Log Analytics workspace."
  value       = azurerm_log_analytics_workspace.workspace.id
}

output "workspace_id" {
  description = "The workspace or customer ID of the Log Analytics workspace."
  value       = azurerm_log_analytics_workspace.workspace.workspace_id
}

output "primary_shared_key" {
  description = "The primary shared key for accessing and managing the Log Analytics workspace."
  value       = azurerm_log_analytics_workspace.workspace.primary_shared_key
  sensitive   = true
}

output "secondary_shared_key" {
  description = "The secondary shared key for accessing and managing the Log Analytics workspace."
  value       = azurerm_log_analytics_workspace.workspace.secondary_shared_key
  sensitive   = true
}
