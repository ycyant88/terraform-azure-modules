output "query_pack_resource_ids" {
  value       = module.avm-res-operationalinsights-workspace.query_pack_resource_ids
  description = "A map of resource IDs for the created Query Packs."
}

output "query_resource_ids" {
  value       = module.avm-res-operationalinsights-workspace.query_resource_ids
  description = "A map of resource IDs for the created Queries."
}

output "resource_id" {
  value       = module.avm-res-operationalinsights-workspace.resource_id
  description = "The resource ID of the primary resource. In this case, it returns null as this module creates multiple resources."
}
