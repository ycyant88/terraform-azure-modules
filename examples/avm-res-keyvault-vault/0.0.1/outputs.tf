output "resource" {
  value       = module.avm-res-keyvault-vault.resource
  description = "The Key Vault resource."
}

output "resource_keys" {
  value       = module.avm-res-keyvault-vault.resource_keys
  description = "A map of key objects. The map key is the supplied input to var.keys. The map value is the entire azurerm_key_vault_key resource."
}

output "resource_secrets" {
  value       = module.avm-res-keyvault-vault.resource_secrets
  description = "A map of secret objects. The map key is the supplied input to var.secrets. The map value is the entire azurerm_key_vault_secret resource."
}
