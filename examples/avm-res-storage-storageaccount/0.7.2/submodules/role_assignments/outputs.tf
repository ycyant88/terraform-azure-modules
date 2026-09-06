output "resource_id" {
  value       = module.avm-res-storage-storageaccount.resource_id
  description = "The scope at which the role assignments were created. Provided to satisfy the AVM resource_id output requirement; this submodule does not own a single backing ARM resource."
}

output "role_assignments" {
  value       = module.avm-res-storage-storageaccount.role_assignments
  description = "Map of role assignment resources keyed by the input map key."
}
