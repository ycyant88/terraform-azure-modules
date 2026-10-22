output "app_id" {
  value       = module.avm-res-insights-component.app_id
  description = "App ID of the Application Insights"
}

output "connection_string" {
  value       = module.avm-res-insights-component.connection_string
  description = "Connection String of the Application Insights"
}

output "instrumentation_key" {
  value       = module.avm-res-insights-component.instrumentation_key
  description = "Instrumentation Key of the Application Insights"
}

output "name" {
  value       = module.avm-res-insights-component.name
  description = "Name of the Application Insights"
}

output "resource" {
  value       = module.avm-res-insights-component.resource
  description = "Deprecated, use the other outputs instead. This output will be removed in a future release.\n\nThe attributes of the former azurerm_application_insights resource that map to this module's inputs, plus id and app_id. It does not include connection_string or instrumentation_key; use those outputs instead.\n"
}

output "resource_id" {
  value       = module.avm-res-insights-component.resource_id
  description = "The ID of the Application Insights"
}
