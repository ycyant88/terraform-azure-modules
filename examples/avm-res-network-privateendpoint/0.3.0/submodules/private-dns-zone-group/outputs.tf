output "name" {
  value       = module.avm-res-network-privateendpoint.name
  description = "Name of the private DNS zone group."
}

output "private_dns_zone_configs" {
  value       = module.avm-res-network-privateendpoint.private_dns_zone_configs
  description = "Private DNS zone configurations and record sets returned for the private endpoint."
}

output "resource_id" {
  value       = module.avm-res-network-privateendpoint.resource_id
  description = "ID of the private DNS zone group."
}
