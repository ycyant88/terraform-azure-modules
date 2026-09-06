output "containers" {
  value       = module.avm-res-storage-storageaccount.containers
  description = "Map of storage containers that are created."
}

output "fqdn" {
  value       = module.avm-res-storage-storageaccount.fqdn
  description = "Fqdns for storage services."
}

output "name" {
  value       = module.avm-res-storage-storageaccount.name
  description = "The name of the storage account"
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

output "shares" {
  value       = module.avm-res-storage-storageaccount.shares
  description = "Map of storage storage shares that are created."
}

output "tables" {
  value       = module.avm-res-storage-storageaccount.tables
  description = "Map of storage tables that are created."
}
