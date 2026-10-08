output "protection_container_id" {
  value       = module.avm-res-recoveryservices-vault.protection_container_id
  description = "The resource ID of the storage protection container."
}

output "protection_state" {
  value       = module.avm-res-recoveryservices-vault.protection_state
  description = "The protection state returned by Azure Backup."
}

output "resource" {
  value       = module.avm-res-recoveryservices-vault.resource
  description = "The protected file share resource."
}

output "resource_id" {
  value       = module.avm-res-recoveryservices-vault.resource_id
  description = "The resource ID of the protected file share."
}
