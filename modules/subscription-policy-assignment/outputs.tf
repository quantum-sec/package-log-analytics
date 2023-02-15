output "id" {
  value = azurerm_subscription_policy_assignment.this.id
}

output "principal_ids" {
  value = azurerm_subscription_policy_assignment.this.identity.*.principal_id
}
