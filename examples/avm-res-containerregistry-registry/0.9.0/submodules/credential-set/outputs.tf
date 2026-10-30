output "name" {
  value       = module.avm-res-containerregistry-registry.name
  description = "The name of the Container Registry credential set."
}

output "principal_id" {
  value       = module.avm-res-containerregistry-registry.principal_id
  description = "The principal ID of the credential set's system-assigned managed identity. Grant this identity read access to the Key Vault secrets referenced by auth_credentials."
}

output "resource_id" {
  value       = module.avm-res-containerregistry-registry.resource_id
  description = "The resource ID of the Container Registry credential set."
}

output "tenant_id" {
  value       = module.avm-res-containerregistry-registry.tenant_id
  description = "The tenant ID of the credential set's system-assigned managed identity."
}
