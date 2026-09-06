output "client_id" {
  value       = module.lz-vending.client_id
  description = "The client id of the user managed identity"
}

output "principal_id" {
  value       = module.lz-vending.principal_id
  description = "The object id of the user managed identity"
}

output "resource_id" {
  value       = module.lz-vending.resource_id
  description = "The resource id of the user managed identity"
}

output "tenant_id" {
  value       = module.lz-vending.tenant_id
  description = "The tenant id of the user managed identity"
}
