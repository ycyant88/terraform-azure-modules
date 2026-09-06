output "resource_group_resource_ids" {
  value       = module.lz-vending.resource_group_resource_ids
  description = "The created resource group IDs, expressed as a map."
}

output "virtual_network_resource_ids" {
  value       = module.lz-vending.virtual_network_resource_ids
  description = "The created virtual network resource IDs, expressed as a map."
}
