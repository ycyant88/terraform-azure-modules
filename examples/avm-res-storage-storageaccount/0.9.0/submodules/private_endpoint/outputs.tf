output "extended_location" {
  value       = module.avm-res-storage-storageaccount.extended_location
  description = "The extended location sent in the private endpoint request as { name, type }, or null when the private endpoint is regional. Consumed by the root module's private_endpoints output."
}

output "name" {
  value       = module.avm-res-storage-storageaccount.name
  description = "The name of the private endpoint."
}

output "private_dns_zone_group_id" {
  value       = module.avm-res-storage-storageaccount.private_dns_zone_group_id
  description = "The resource ID of the private DNS zone group (if managed by this module), otherwise null."
}

output "resource_id" {
  value       = module.avm-res-storage-storageaccount.resource_id
  description = "The resource ID of the private endpoint."
}

output "role_assignments" {
  value       = module.avm-res-storage-storageaccount.role_assignments
  description = "Map of role assignment resources created at the private endpoint scope, keyed by the input map key."
}
