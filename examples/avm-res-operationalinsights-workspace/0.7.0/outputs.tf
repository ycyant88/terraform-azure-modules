output "name" {
  value       = module.avm-res-operationalinsights-workspace.name
  description = "The name of the Log Analytics Workspace."
}

output "private_endpoints" {
  value       = module.avm-res-operationalinsights-workspace.private_endpoints
  description = "A map of the private endpoints created, with the attribute names of the azurerm_private_endpoint resource that earlier versions of this module returned, so that existing references keep working.\nprivate_service_connection[0].private_ip_address is the first IP address in custom_dns_configs.\n"
}

output "resource" {
  value       = module.avm-res-operationalinsights-workspace.resource
  description = "The Log Analytics Workspace, with the attribute names of the azurerm_log_analytics_workspace resource that earlier versions of this module returned, so that existing references keep working. Prefer resource_id and name.\nprimary_shared_key and secondary_shared_key are read when the workspace is created, and when it is upgraded from version 0.5.x or earlier.\nExamples:\n- module.log_analytics.resource.id\n- module.log_analytics.resource.name\n"
}

output "resource_id" {
  value       = module.avm-res-operationalinsights-workspace.resource_id
  description = "This is the full output for the Log Analytics resource ID. This is the default output for the module following AVM standards. Review the examples below for the correct output to use in your module."
}
