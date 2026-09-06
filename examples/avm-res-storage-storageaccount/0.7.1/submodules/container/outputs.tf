output "name" {
  value       = module.avm-res-storage-storageaccount.name
  description = "The name of the container."
}

output "resource" {
  value       = module.avm-res-storage-storageaccount.resource
  description = "The full container azapi_resource."
}

output "resource_id" {
  value       = module.avm-res-storage-storageaccount.resource_id
  description = "The resource ID of the container."
}

output "role_assignments" {
  value       = module.avm-res-storage-storageaccount.role_assignments
  description = "Map of role assignment resources created at the container scope, keyed by the input map key."
}
