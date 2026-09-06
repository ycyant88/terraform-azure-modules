output "resource" {
  value       = module.avm-res-network-firewallpolicy.resource
  description = "this is the resource of the rule collection group"
}

output "resource_id" {
  value       = module.avm-res-network-firewallpolicy.resource_id
  description = "the resource id of the rule_collection_group"
}
