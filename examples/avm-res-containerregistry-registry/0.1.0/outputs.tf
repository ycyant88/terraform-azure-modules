output "name" {
  value       = module.avm-res-containerregistry-registry.name
  description = "The name of the parent resource."
}

output "private_endpoints" {
  value       = module.avm-res-containerregistry-registry.private_endpoints
  description = "A map of private endpoints. The map key is the supplied input to var.private_endpoints. The map value is the entire azurerm_private_endpoint resource."
}

output "resource" {
  value       = module.avm-res-containerregistry-registry.resource
  description = "This is the full output for the resource."
}

output "resource_id" {
  value       = module.avm-res-containerregistry-registry.resource_id
  description = "The resource id for the parent resource."
}

output "system_assigned_mi_principal_id" {
  value       = module.avm-res-containerregistry-registry.system_assigned_mi_principal_id
  description = "The system assigned managed identity principal ID of the parent resource."
}
