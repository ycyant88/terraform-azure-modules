output "name" {
  value       = module.avm-res-insights-component.name
  description = "Name of the Application Insights"
}

output "resource" {
  value       = module.avm-res-insights-component.resource
  description = "This is the full output for the resource."
}
