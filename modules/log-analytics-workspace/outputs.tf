output "id" {
  value = azurerm_log_analytics_workspace.workspace.id
}

output "workspace_id" {
  value = azurerm_log_analytics_workspace.workspace.workspace_id
}

output "portal_url" {
  value = azurerm_log_analytics_workspace.workspace.portal_url
}

output "primary_shared_key" {
  value = azurerm_log_analytics_workspace.workspace.primary_shared_key
}

output "secondary_shared_key" {
  value = azurerm_log_analytics_workspace.workspace.secondary_shared_key
}
