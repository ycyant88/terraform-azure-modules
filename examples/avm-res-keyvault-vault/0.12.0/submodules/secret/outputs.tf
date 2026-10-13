output "id" {
  value       = module.avm-res-keyvault-vault.id
  description = "The versioned data plane URI of the secret, in the form\nhttps://<vault-name>.vault.azure.net/secrets/<secret-name>/<secret-version>.\n\nBecause it pins a specific secret version, consumers will not pick up new versions\nautomatically; use versionless_id instead if that is required.\n"
}

output "name" {
  value       = module.avm-res-keyvault-vault.name
  description = "The name of the Key Vault Secret."
}

output "resource_id" {
  value       = module.avm-res-keyvault-vault.resource_id
  description = "The versioned Azure Resource Manager (ARM) resource ID of the secret, in the form\n/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.KeyVault/vaults/<vault-name>/secrets/<secret-name>/versions/<secret-version>.\n\nThis is an ARM resource ID, not a data plane URI. Use id when a service asks for a\nkey vault secret URI such as https://<vault-name>.vault.azure.net/secrets/....\n"
}

output "resource_versionless_id" {
  value       = module.avm-res-keyvault-vault.resource_versionless_id
  description = "The versionless Azure Resource Manager (ARM) resource ID of the secret, in the form\n/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.KeyVault/vaults/<vault-name>/secrets/<secret-name>.\n\nThis is an ARM resource ID, not a data plane URI. Because it does not pin a secret\nversion, consumers that support it will pick up new secret versions automatically.\n"
}

output "versionless_id" {
  value       = module.avm-res-keyvault-vault.versionless_id
  description = "The versionless data plane URI of the secret, in the form\nhttps://<vault-name>.vault.azure.net/secrets/<secret-name>.\n\nBecause it does not pin a secret version, consumers that support it will pick up new\nsecret versions automatically. Use id when a specific version is required.\n"
}
