output "resource_id" {
  value       = module.avm-res-keyvault-vault.resource_id
  description = "The Azure resource id of the secret."
}

output "resource_versionless_id" {
  value       = module.avm-res-keyvault-vault.resource_versionless_id
  description = "The versionless Azure resource id of the secret."
}
