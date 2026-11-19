output "resource" {
  value       = module.avm-res-operationalinsights-workspace.resource
  description = "The Log Analytics solution, with the attribute names of the azurerm_log_analytics_solution resource that earlier versions of this module returned, so that existing references keep working. Prefer resource_id."
}

output "resource_id" {
  value       = module.avm-res-operationalinsights-workspace.resource_id
  description = "The resource ID of the Log Analytics solution."
}
