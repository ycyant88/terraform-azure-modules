output "resource" {
  value       = module.avm-res-operationalinsights-workspace.resource
  description = "this is the resource of the rule collection group"
}

output "resource_id" {
  value       = module.avm-res-operationalinsights-workspace.resource_id
  description = "the resource id of the rule_collection_group"
}
