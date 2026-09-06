output "key_vault_key_url" {
  value       = module.avm-res-compute-diskencryptionset.key_vault_key_url
  description = "The ID of the disk encryption set."
}

output "resource" {
  value       = module.avm-res-compute-diskencryptionset.resource
  description = "This is the full output for the resource."
}

output "resource_id" {
  value       = module.avm-res-compute-diskencryptionset.resource_id
  description = "The ID of the disk encryption set."
}
