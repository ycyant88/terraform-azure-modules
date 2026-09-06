output "active_slot" {
  value       = module.avm-res-web-site.active_slot
  description = "The active slot resource ID."
}

output "custom_domain_verification_id" {
  value       = module.avm-res-web-site.custom_domain_verification_id
  description = "The custom domain verification ID for the App Service. Use this value to create\nan asuid.<custom-hostname> TXT record in your DNS zone before binding a custom\ndomain via var.custom_domains. See the custom_domains variable documentation\nfor details on the DNS prerequisites that Azure enforces.\n"
}

output "deployment_slot_locks" {
  value       = module.avm-res-web-site.deployment_slot_locks
  description = "The locks of the deployment slots."
}

output "deployment_slots" {
  value       = module.avm-res-web-site.deployment_slots
  description = "The deployment slots."
}

output "identity_principal_id" {
  value       = module.avm-res-web-site.identity_principal_id
  description = "The system-assigned managed identity principal ID of the resource."
}

output "kind" {
  value       = module.avm-res-web-site.kind
  description = "The kind of app service."
}

output "location" {
  value       = module.avm-res-web-site.location
  description = "The location of the resource."
}

output "name" {
  value       = module.avm-res-web-site.name
  description = "The name of the resource."
}

output "os_type" {
  value       = module.avm-res-web-site.os_type
  description = "The operating system type of the resource."
}

output "private_endpoints" {
  value       = module.avm-res-web-site.private_endpoints
  description = "A map of private endpoints. The map key is the supplied input to var.private_endpoints."
}

output "resource" {
  value       = module.avm-res-web-site.resource
  description = "This is the full output for the resource."
}

output "resource_id" {
  value       = module.avm-res-web-site.resource_id
  description = "The resource ID of the App Service."
}

output "resource_lock" {
  value       = module.avm-res-web-site.resource_lock
  description = "The locks of the resources."
}

output "resource_private_endpoints" {
  value       = module.avm-res-web-site.resource_private_endpoints
  description = "A map of private endpoints. The map key is the supplied input to var.private_endpoints. The map value is the entire azapi_resource."
}

output "resource_uri" {
  value       = module.avm-res-web-site.resource_uri
  description = "The default hostname of the resource."
}

output "system_assigned_mi_principal_id" {
  value       = module.avm-res-web-site.system_assigned_mi_principal_id
  description = "The system-assigned managed identity principal ID."
}

output "system_assigned_mi_principal_id_slots" {
  value       = module.avm-res-web-site.system_assigned_mi_principal_id_slots
  description = "Map of system-assigned managed identity principal IDs for deployment slots."
}
