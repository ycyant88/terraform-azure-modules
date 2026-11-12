output "name" {
  value       = module.avm-res-network-ddosprotectionplan.name
  description = "The name of the ddos protection plan resource."
}

output "resource" {
  value       = module.avm-res-network-ddosprotectionplan.resource
  description = "Compatibility view of the DDoS protection plan with the AzureRM resource's public attributes. Prefer resource_id, name, and virtual_network_ids."
}

output "resource_id" {
  value       = module.avm-res-network-ddosprotectionplan.resource_id
  description = "The ID of the ddos protection plan resource."
}

output "virtual_network_ids" {
  value       = module.avm-res-network-ddosprotectionplan.virtual_network_ids
  description = "The IDs of virtual networks associated with the DDoS protection plan. Associations are managed on the virtual networks, not by this module."
}
