output "resource_id" {
  value       = module.avm-ptn-odaa.resource_id
  description = "Resource ID of the first peering resource"
}

output "vnet_peerings_resource_ids" {
  value       = module.avm-ptn-odaa.vnet_peerings_resource_ids
  description = "Resource IDs of the Virtual network peerings created"
}
