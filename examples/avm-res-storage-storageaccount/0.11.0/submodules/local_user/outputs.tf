output "home_directory" {
  value       = module.avm-res-storage-storageaccount.home_directory
  description = "The home directory of the local user."
}

output "name" {
  value       = module.avm-res-storage-storageaccount.name
  description = "The name of the local user."
}

output "resource" {
  value       = module.avm-res-storage-storageaccount.resource
  description = "The full local user azapi_resource."
}

output "resource_id" {
  value       = module.avm-res-storage-storageaccount.resource_id
  description = "The resource ID of the local user."
}

output "sid" {
  value       = module.avm-res-storage-storageaccount.sid
  description = "The Security Identifier (SID) assigned to the local user."
}

output "ssh_key_enabled" {
  value       = module.avm-res-storage-storageaccount.ssh_key_enabled
  description = "Whether SSH key authentication is enabled."
}

output "ssh_password_enabled" {
  value       = module.avm-res-storage-storageaccount.ssh_password_enabled
  description = "Whether SSH password authentication is enabled."
}
