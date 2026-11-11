output "private_dns_zone_resource_ids" {
  value       = module.avm-ptn-network-private-link-private-dns-zones.private_dns_zone_resource_ids
  description = "The map of private DNS zones to resource ids."
}

output "private_link_private_dns_zones_map" {
  value       = module.avm-ptn-network-private-link-private-dns-zones.private_link_private_dns_zones_map
  description = "The final map of private link private DNS zones to link to virtual networks including the region name replacements as required."
}

output "resource_group_resource_id" {
  value       = module.avm-ptn-network-private-link-private-dns-zones.resource_group_resource_id
  description = "The resource ID of the resource group that the private link private DNS zones are deployed into."
}
