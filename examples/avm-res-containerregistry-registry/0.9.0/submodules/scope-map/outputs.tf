output "id" {
  value       = module.avm-res-containerregistry-registry.id
  description = "The ID of the Container Registry Scope Map."
}

output "registry_token_passwords" {
  value       = module.avm-res-containerregistry-registry.registry_token_passwords
  description = "The registry token password object."
}

output "registry_tokens" {
  value       = module.avm-res-containerregistry-registry.registry_tokens
  description = "The registry token object."
}

output "resource_id" {
  value       = module.avm-res-containerregistry-registry.resource_id
  description = "The resource ID of the Container Registry Scope Map."
}
