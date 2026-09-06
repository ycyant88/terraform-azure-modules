output "containers" {
  value       = module.avm-res-storage-storageaccount.containers
  description = "Map of storage containers that are created."
}

output "data_lake_gen2_filesystems" {
  value       = module.avm-res-storage-storageaccount.data_lake_gen2_filesystems
  description = "Map of Data Lake Gen2 filesystems that are created."
}

output "fqdn" {
  value       = module.avm-res-storage-storageaccount.fqdn
  description = "Fqdns for storage services."
}

output "local_users" {
  value       = module.avm-res-storage-storageaccount.local_users
  description = "A map of Storage Account Local Users. The map key is the supplied input to var.local_user. Contains sensitive information including passwords when ssh_password_enabled is true.\n\nThe map value contains the following attributes:\n- id - The ID of the Storage Account Local User.\n- name - The name of the Storage Account Local User.\n- home_directory - The home directory of the Storage Account Local User.\n- password - The password of the Storage Account Local User (sensitive).\n- sid - The unique Security Identifier (SID) of the Storage Account Local User.\n- ssh_key_enabled - Specifies whether SSH Key authentication is enabled.\n- ssh_password_enabled - Specifies whether SSH password authentication is enabled.\n"
}

output "name" {
  value       = module.avm-res-storage-storageaccount.name
  description = "The name of the storage account"
}

output "primary_access_key" {
  value       = module.avm-res-storage-storageaccount.primary_access_key
  description = "The primary access key for the Storage Account."
}

output "private_endpoints" {
  value       = module.avm-res-storage-storageaccount.private_endpoints
  description = "A map of private endpoints. The map key is the supplied input to var.private_endpoints. The map value is the entire azurerm_private_endpoint resource."
}

output "queues" {
  value       = module.avm-res-storage-storageaccount.queues
  description = "Map of storage queues that are created."
}

output "resource" {
  value       = module.avm-res-storage-storageaccount.resource
  description = "This is the full resource output for the Storage Account resource."
}

output "resource_id" {
  value       = module.avm-res-storage-storageaccount.resource_id
  description = "The ID of the Storage Account."
}

output "secondary_access_key" {
  value       = module.avm-res-storage-storageaccount.secondary_access_key
  description = "The secondary access key for the Storage Account."
}

output "shares" {
  value       = module.avm-res-storage-storageaccount.shares
  description = "Map of storage storage shares that are created."
}

output "tables" {
  value       = module.avm-res-storage-storageaccount.tables
  description = "Map of storage tables that are created."
}
