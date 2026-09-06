output "combined_private_link_private_dns_zones_replaced_with_vnets_to_link" {
  value       = module.avm-ptn-network-private-link-private-dns-zones.combined_private_link_private_dns_zones_replaced_with_vnets_to_link
  description = "The final map of private link private DNS zones to link to virtual networks including the region name replacements as required."
}

output "resource_group_resource_id" {
  value       = module.avm-ptn-network-private-link-private-dns-zones.resource_group_resource_id
  description = "The resource ID of the resource group that the Private DNS Zones are deployed into."
}
