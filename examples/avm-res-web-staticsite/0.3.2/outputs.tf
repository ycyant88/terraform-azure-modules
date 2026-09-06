output "name" {
  value       = module.avm-res-web-staticsite.name
  description = "The name of the static site."
}

output "resource" {
  value       = module.avm-res-web-staticsite.resource
  description = "This is the full output for the resource."
}

output "resource_id" {
  value       = module.avm-res-web-staticsite.resource_id
  description = "The ID of the static site."
}

output "resource_private_endpoints" {
  value       = module.avm-res-web-staticsite.resource_private_endpoints
  description = "A map of private endpoints. The map key is the supplied input to var.private_endpoints. The map value is the entire azurerm_private_endpoint resource."
}

output "resource_uri" {
  value       = module.avm-res-web-staticsite.resource_uri
  description = "The default hostname of the static web app."
}
