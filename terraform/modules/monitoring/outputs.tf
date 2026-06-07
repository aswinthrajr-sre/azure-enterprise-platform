output "log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.this.id
}

output "application_insights_id" {
  value = azurerm_application_insights.this.id
}

output "application_insights_key" {
  value = azurerm_application_insights.this.instrumentation_key
  sensitive = true
}