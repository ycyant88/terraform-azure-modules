output "identity_principal_id" {
  value       = module.avm-res-web-site.identity_principal_id
  description = "The principal ID of the system-assigned managed identity (if enabled)."
}

output "lock" {
  value       = module.avm-res-web-site.lock
  description = "The lock resource for this slot."
}

output "name" {
  value       = module.avm-res-web-site.name
  description = "The name of the deployment slot."
}

output "private_endpoints" {
  value       = module.avm-res-web-site.private_endpoints
  description = "The private endpoints created for this slot."
}

output "resource" {
  value       = module.avm-res-web-site.resource
  description = "The full slot resource object."
}

output "resource_id" {
  value       = module.avm-res-web-site.resource_id
  description = "The resource ID of the deployment slot."
}
