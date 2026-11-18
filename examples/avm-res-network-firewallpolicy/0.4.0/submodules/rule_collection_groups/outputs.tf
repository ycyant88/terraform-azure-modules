output "name" {
  value       = module.avm-res-network-firewallpolicy.name
  description = "The name of the firewall policy rule collection group."
}

output "resource" {
  value       = module.avm-res-network-firewallpolicy.resource
  description = "The firewall policy rule collection group resource. Built explicitly from azapi_resource.this rather than exported wholesale, so that the write-only ignore_body_changes argument is never read.\n\nExamples:\n- module.<x>.resource.id\n- module.<x>.resource.name\n- module.<x>.resource.body.properties.priority\n- module.<x>.resource.body.properties.ruleCollections\n"
}

output "resource_id" {
  value       = module.avm-res-network-firewallpolicy.resource_id
  description = "the resource id of the rule_collection_group"
}
