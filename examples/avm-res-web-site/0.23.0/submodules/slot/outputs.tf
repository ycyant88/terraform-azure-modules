output "identity_principal_id" {
  value       = module.avm-res-web-site.identity_principal_id
  description = "The principal ID of the system-assigned managed identity (if enabled)."
}

output "name" {
  value       = module.avm-res-web-site.name
  description = "The name of the deployment slot."
}

output "resource_id" {
  value       = module.avm-res-web-site.resource_id
  description = "The resource ID of the deployment slot."
}

output "server_farm_resource_id" {
  value       = module.avm-res-web-site.server_farm_resource_id
  description = "The normalized service plan resource ID configured on the deployment slot."
}
