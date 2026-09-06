output "name" {
  value       = module.avm-res-operationalinsights-workspace.name
  description = "The Name of the Log Analytics Workspace."
}

output "resource" {
  value       = module.avm-res-operationalinsights-workspace.resource
  description = "The Log Analytics Workspace resource"
}

output "workspace_id" {
  value       = module.avm-res-operationalinsights-workspace.workspace_id
  description = "The Resource ID of the Log Analytics Workspace."
}
