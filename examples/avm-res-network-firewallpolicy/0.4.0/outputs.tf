output "child_policies" {
  value       = module.avm-res-network-firewallpolicy.child_policies
  description = "The resource IDs of the child firewall policies of this firewall policy."
}

output "firewalls" {
  value       = module.avm-res-network-firewallpolicy.firewalls
  description = "The resource IDs of the Azure Firewalls this firewall policy is associated with."
}

output "location" {
  value       = module.avm-res-network-firewallpolicy.location
  description = "The Azure Region the firewall policy is deployed to."
}

output "name" {
  value       = module.avm-res-network-firewallpolicy.name
  description = "The name of the firewall policy."
}

output "resource" {
  value       = module.avm-res-network-firewallpolicy.resource
  description = "\"This is the full output for Firewall Policy resource. This is the default output for the module following AVM standards. Review the examples below for the correct output to use in your module.\"\nExamples:\n- module.firewall_policy.resource.id\n- module.firewall_policy.resource.firewalls\n- module.firewall_policy.resource.child_policies\n- module.firewall_policy.resource.rule_collection_groups\n"
}

output "resource_id" {
  value       = module.avm-res-network-firewallpolicy.resource_id
  description = "the resource id of the firewall policy"
}

output "rule_collection_groups" {
  value       = module.avm-res-network-firewallpolicy.rule_collection_groups
  description = "The resource IDs of the rule collection groups attached to this firewall policy. Populated from a live read, so a group created in the same apply does not appear until the next plan - see data.tf."
}
