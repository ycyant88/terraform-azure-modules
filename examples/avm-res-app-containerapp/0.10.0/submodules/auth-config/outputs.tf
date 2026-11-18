output "name" {
  value       = module.avm-res-app-containerapp.name
  description = "The name of the Container App AuthConfig resource."
}

output "resource" {
  value       = module.avm-res-app-containerapp.resource
  description = "The Container App AuthConfig azapi_resource that this submodule manages."
}

output "resource_id" {
  value       = module.avm-res-app-containerapp.resource_id
  description = "The Azure resource ID of the Container App AuthConfig created by this submodule."
}
