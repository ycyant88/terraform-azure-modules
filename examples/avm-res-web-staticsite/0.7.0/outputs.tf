output "api_key" {
  value       = module.avm-res-web-staticsite.api_key
  description = "The API key of this static web app."
}

output "domains" {
  value       = module.avm-res-web-staticsite.domains
  description = "The domains of this static web app."
}

output "name" {
  value       = module.avm-res-web-staticsite.name
  description = "The name of the static web app."
}

output "resource" {
  value       = module.avm-res-web-staticsite.resource
  description = "This is the full output for the resource."
}

output "resource_id" {
  value       = module.avm-res-web-staticsite.resource_id
  description = "The ID of the static web app."
}

output "resource_private_endpoints" {
  value       = module.avm-res-web-staticsite.resource_private_endpoints
  description = "A map of private endpoints. The map key is the supplied input to var.private_endpoints. The map value is the entire azurerm_private_endpoint resource."
}

output "resource_uri" {
  value       = module.avm-res-web-staticsite.resource_uri
  description = "The default hostname of the static web app."
}
