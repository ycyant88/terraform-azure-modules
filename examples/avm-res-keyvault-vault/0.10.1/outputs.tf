output "keys" {
  value       = module.avm-res-keyvault-vault.keys
  description = "A map of key keys to key values. The key value is the entire azurerm_key_vault_key resource.\n\nThe key value contains the following attributes:\n- id: The Key Vault Key ID\n- resource_id: The Azure resource id of the key.\n- resource_versionless_id: The versionless Azure resource id of the key.\n- versionless_id: The Base ID of the Key Vault Key\n"
}

output "keys_resource_ids" {
  value       = module.avm-res-keyvault-vault.keys_resource_ids
  description = "A map of key keys to resource ids."
}

output "name" {
  value       = module.avm-res-keyvault-vault.name
  description = "The name of the key vault."
}

output "private_endpoints" {
  value       = module.avm-res-keyvault-vault.private_endpoints
  description = "A map of private endpoints. The map key is the supplied input to var.private_endpoints. The map value is the entire azurerm_private_endpoint resource."
}

output "resource_id" {
  value       = module.avm-res-keyvault-vault.resource_id
  description = "The Azure resource id of the key vault."
}

output "secrets" {
  value       = module.avm-res-keyvault-vault.secrets
  description = "A map of secret keys to secret values. The secret value is the entire azurerm_key_vault_secret resource.\n\nThe secret value contains the following attributes:\n- id: The Key Vault Secret ID\n- resource_id: The Azure resource id of the secret.\n- resource_versionless_id: The versionless Azure resource id of the secret.\n- versionless_id: The Base ID of the Key Vault Secret\n"
}

output "secrets_resource_ids" {
  value       = module.avm-res-keyvault-vault.secrets_resource_ids
  description = "A map of secret keys to resource ids."
}

output "uri" {
  value       = module.avm-res-keyvault-vault.uri
  description = "The URI of the vault for performing operations on keys and secrets"
}
