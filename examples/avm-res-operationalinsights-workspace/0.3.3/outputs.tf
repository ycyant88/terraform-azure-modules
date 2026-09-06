output "private_endpoints" {
  value       = module.avm-res-operationalinsights-workspace.private_endpoints
  description = "  A map of the private endpoints created.\n"
}

output "resource" {
  value       = module.avm-res-operationalinsights-workspace.resource
  description = "\"This is the full output for the Log Analytics resource. This is the default output for the module following AVM standards. Review the examples below for the correct output to use in your module.\"\nExamples:\n- module.log_analytics.resource.id\n- module.log_analytics.resource.name\n"
}

output "resource_id" {
  value       = module.avm-res-operationalinsights-workspace.resource_id
  description = "This is the full output for the Log Analytics resource ID. This is the default output for the module following AVM standards. Review the examples below for the correct output to use in your module."
}
