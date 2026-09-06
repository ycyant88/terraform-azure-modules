output "name" {
  value       = module.avm-res-storage-storageaccount.name
  description = "The name of the file share."
}

output "resource" {
  value       = module.avm-res-storage-storageaccount.resource
  description = "The full share azapi_resource."
}

output "resource_id" {
  value       = module.avm-res-storage-storageaccount.resource_id
  description = "The resource ID of the file share."
}

output "role_assignments" {
  value       = module.avm-res-storage-storageaccount.role_assignments
  description = "Map of role assignment resources created at the share scope, keyed by the input map key."
}
