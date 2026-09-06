output "e" {
  value       = module.avm-res-keyvault-vault.e
  description = "The RSA public exponent of the Key Vault Key. Use together with n, which carries the modulus. Empty for EC keys."
}

output "id" {
  value       = module.avm-res-keyvault-vault.id
  description = "The versioned data plane URI of the key, in the form\nhttps://<vault-name>.vault.azure.net/keys/<key-name>/<key-version>.\n\nThis is the value most Azure services expect when configuring a customer managed key,\nfor example the transparent_data_encryption_key_vault_key_id input of the\nAzure/avm-res-sql-server/azurerm module. It pins a specific key version. Note that\nsupporting key rotation does not imply accepting a versionless URI \u2014 Azure SQL, for\nexample, requires this versioned form and is told to follow rotation by a separate\nsetting. Use versionless_id only where the consuming API documents that it accepts a\nversionless URI.\n"
}

output "n" {
  value       = module.avm-res-keyvault-vault.n
  description = "The RSA modulus of the Key Vault Key. Use together with e, which carries the public exponent. Empty for EC keys."
}

output "name" {
  value       = module.avm-res-keyvault-vault.name
  description = "The name of the Key Vault Key."
}

output "public_key_openssh" {
  value       = module.avm-res-keyvault-vault.public_key_openssh
  description = "The OpenSSH encoded public key of the Key Vault Key. Empty for P-256K keys, which the provider does not derive a public key for."
}

output "public_key_pem" {
  value       = module.avm-res-keyvault-vault.public_key_pem
  description = "The PEM encoded public key of the Key Vault Key. Empty for P-256K keys, which the provider does not derive a public key for."
}

output "resource_id" {
  value       = module.avm-res-keyvault-vault.resource_id
  description = "The versioned Azure Resource Manager (ARM) resource ID of the key, in the form\n/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.KeyVault/vaults/<vault-name>/keys/<key-name>/versions/<key-version>.\n\nThis is an ARM resource ID, not a data plane URI. Use id when a service asks for a\nkey vault key URI or identifier such as https://<vault-name>.vault.azure.net/keys/....\n"
}

output "resource_versionless_id" {
  value       = module.avm-res-keyvault-vault.resource_versionless_id
  description = "The versionless Azure Resource Manager (ARM) resource ID of the key, in the form\n/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.KeyVault/vaults/<vault-name>/keys/<key-name>.\n\nThis is an ARM resource ID, not a data plane URI. Because it does not pin a key version,\nservices that support it will pick up new key versions automatically.\n"
}

output "versionless_id" {
  value       = module.avm-res-keyvault-vault.versionless_id
  description = "The versionless data plane URI of the key, in the form\nhttps://<vault-name>.vault.azure.net/keys/<key-name>.\n\nBecause it does not pin a key version, services that support it will pick up new key\nversions automatically. Use id when a service requires a specific key version.\n"
}

output "x" {
  value       = module.avm-res-keyvault-vault.x
  description = "The EC X component of the Key Vault Key. Use together with y, which carries the Y component. Empty for RSA keys."
}

output "y" {
  value       = module.avm-res-keyvault-vault.y
  description = "The EC Y component of the Key Vault Key. Use together with x, which carries the X component. Empty for RSA keys."
}
