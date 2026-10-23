output "application_security_group_association_ids" {
  value       = module.avm-res-network-privateendpoint.application_security_group_association_ids
  description = "The resource IDs of application security groups attached to the private endpoint."
}

output "name" {
  value       = module.avm-res-network-privateendpoint.name
  description = "Name of the resource."
}

output "network_interface_ids" {
  value       = module.avm-res-network-privateendpoint.network_interface_ids
  description = "The resource IDs of the network interfaces created for the private endpoint."
}

output "private_ip_addresses" {
  value       = module.avm-res-network-privateendpoint.private_ip_addresses
  description = "The private IP addresses assigned to the private endpoint."
}

output "resource_id" {
  value       = module.avm-res-network-privateendpoint.resource_id
  description = "ID of the resource."
}
