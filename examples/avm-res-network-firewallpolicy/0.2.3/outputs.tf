output "resource" {
  value       = module.avm-res-network-firewallpolicy.resource
  description = "\"This is the full output for Firewall Policy resource. This is the default output for the module following AVM standards. Review the examples below for the correct output to use in your module.\"\nExamples: \n- module.firewall_policy.resource.id\n- module.firewall_policy.resource.firewalls\n- module.firewall_policy.resource.child_policies\n- module.firewall_policy.resource.rule_collection_groups\n"
}

output "resource_id" {
  value       = module.avm-res-network-firewallpolicy.resource_id
  description = "the resource id of the firewall policy"
}
