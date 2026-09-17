output "protected_item_ids" {
  value       = module.avm-res-recoveryservices-vault.protected_item_ids
  description = "A map of the protected item resource IDs, keyed by the protected_databases map key."
}

output "protected_item_names" {
  value       = module.avm-res-recoveryservices-vault.protected_item_names
  description = "A map of the protected item names, keyed by the protected_databases map key."
}

output "protected_items" {
  value       = module.avm-res-recoveryservices-vault.protected_items
  description = "A map of the protected item resources, keyed by the protected_databases map key."
}

output "resource" {
  value       = module.avm-res-recoveryservices-vault.resource
  description = "The registered workload protection container resource"
}

output "resource_id" {
  value       = module.avm-res-recoveryservices-vault.resource_id
  description = "The resource ID of the registered workload protection container"
}
