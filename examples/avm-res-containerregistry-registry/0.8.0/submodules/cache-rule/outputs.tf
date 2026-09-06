output "name" {
  value       = module.avm-res-containerregistry-registry.name
  description = "The name of the Container Registry cache rule."
}

output "resource_id" {
  value       = module.avm-res-containerregistry-registry.resource_id
  description = "The resource ID of the Container Registry cache rule."
}
