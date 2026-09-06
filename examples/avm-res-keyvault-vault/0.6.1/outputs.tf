output "keys_resource_ids" {
  value       = module.avm-res-keyvault-vault.keys_resource_ids
  description = "A map of key keys to resource ids."
}

output "private_endpoints" {
  value       = module.avm-res-keyvault-vault.private_endpoints
  description = "A map of private endpoints. The map key is the supplied input to var.private_endpoints. The map value is the entire azurerm_private_endpoint resource."
}

output "resource_id" {
  value       = module.avm-res-keyvault-vault.resource_id
  description = "The Azure resource id of the key vault."
}

output "secrets_resource_ids" {
  value       = module.avm-res-keyvault-vault.secrets_resource_ids
  description = "A map of secret keys to resource ids."
}
