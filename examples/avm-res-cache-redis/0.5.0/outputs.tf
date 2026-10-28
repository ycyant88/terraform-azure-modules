output "name" {
  value       = module.avm-res-cache-redis.name
  description = "The name of the redis resource"
}

output "private_endpoints" {
  value       = module.avm-res-cache-redis.private_endpoints
  description = "A map of private endpoints. The map key is the supplied input to var.private_endpoints. The map value is the entire azurerm_private_endpoint resource."
}

output "resource" {
  value       = module.avm-res-cache-redis.resource
  description = "This is the full output for the resource."
}

output "resource_id" {
  value       = module.avm-res-cache-redis.resource_id
  description = "The resource id of the redis cache resource."
}

output "system_assigned_mi_principal_id" {
  value       = module.avm-res-cache-redis.system_assigned_mi_principal_id
  description = "The resource id for the system managed identity principal id."
}
