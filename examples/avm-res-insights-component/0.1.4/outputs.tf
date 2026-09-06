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
  description = "This is the full output for the resource."
}

output "resource_id" {
  value       = module.avm-res-insights-component.resource_id
  description = "The ID of the Application Insights"
}
