output "custom_domain_verification_id" {
  value       = module.avm-res-app-containerapp.custom_domain_verification_id
  description = "The custom domain verification ID for the Container App."
}

output "custom_domains" {
  value       = module.avm-res-app-containerapp.custom_domains
  description = "The custom domains configured for the Container App."
}

output "environment_id" {
  value       = module.avm-res-app-containerapp.environment_id
  description = "The ID of the Container App Environment."
}

output "fqdn_url" {
  value       = module.avm-res-app-containerapp.fqdn_url
  description = "https url that contains ingress's fqdn, could be used to access the deployed app."
}

output "identity" {
  value       = module.avm-res-app-containerapp.identity
  description = "The identities assigned to the Container App."
}

output "latest_ready_revision_name" {
  value       = module.avm-res-app-containerapp.latest_ready_revision_name
  description = "The name of the latest ready revision of the Container App."
}

output "latest_revision_fqdn" {
  value       = module.avm-res-app-containerapp.latest_revision_fqdn
  description = "The FQDN of the latest revision of the Container App."
}

output "latest_revision_name" {
  value       = module.avm-res-app-containerapp.latest_revision_name
  description = "The name of the latest revision of the Container App."
}

output "location" {
  value       = module.avm-res-app-containerapp.location
  description = "The Azure Region where the Container App is located."
}

output "name" {
  value       = module.avm-res-app-containerapp.name
  description = "The name of the Container App."
}

output "outbound_ip_addresses" {
  value       = module.avm-res-app-containerapp.outbound_ip_addresses
  description = "The outbound IP addresses of the Container App."
}

output "resource_id" {
  value       = module.avm-res-app-containerapp.resource_id
  description = "Resource ID of container app resource created by this module."
}
