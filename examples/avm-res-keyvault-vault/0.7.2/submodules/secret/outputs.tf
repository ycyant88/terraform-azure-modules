output "id" {
  value       = module.avm-res-keyvault-vault.id
  description = "The Key Vault Secret ID"
}

output "resource_id" {
  value       = module.avm-res-keyvault-vault.resource_id
  description = "The Azure resource id of the secret."
}

output "resource_versionless_id" {
  value       = module.avm-res-keyvault-vault.resource_versionless_id
  description = "The versionless Azure resource id of the secret."
}

output "versionless_id" {
  value       = module.avm-res-keyvault-vault.versionless_id
  description = "The Base ID of the Key Vault Secret"
}
