output "application_insights" {
  value       = module.avm-res-web-site.application_insights
  description = "The application insights resource."
}

output "deployment_slot_locks" {
  value       = module.avm-res-web-site.deployment_slot_locks
  description = "The locks of the deployment slots."
}

output "function_app_active_slot" {
  value       = module.avm-res-web-site.function_app_active_slot
  description = "The active slot."
}

output "function_app_deployment_slots" {
  value       = module.avm-res-web-site.function_app_deployment_slots
  description = "The deployment slots."
}

output "identity_principal_id" {
  value       = module.avm-res-web-site.identity_principal_id
  description = "The object principal id of the resource."
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

output "private_endpoint_locks" {
  value       = module.avm-res-web-site.private_endpoint_locks
  description = "The locks of the deployment slots."
}

output "resource" {
  value       = module.avm-res-web-site.resource
  description = "This is the full output for the resource."
}

output "resource_id" {
  value       = module.avm-res-web-site.resource_id
  description = "This is the full output for the resource."
}

output "resource_lock" {
  value       = module.avm-res-web-site.resource_lock
  description = "The locks of the resources."
}

output "resource_private_endpoints" {
  value       = module.avm-res-web-site.resource_private_endpoints
  description = "A map of private endpoints. The map key is the supplied input to var.private_endpoints. The map value is the entire azurerm_private_endpoint resource."
}

output "resource_uri" {
  value       = module.avm-res-web-site.resource_uri
  description = "The default hostname of the resource."
}

output "system_assigned_mi_principal_id" {
  value       = module.avm-res-web-site.system_assigned_mi_principal_id
  description = "value"
}

output "thumbprints" {
  value       = module.avm-res-web-site.thumbprints
  description = "The thumbprint of the certificate."
}

output "web_app_active_slot" {
  value       = module.avm-res-web-site.web_app_active_slot
  description = "The active slot."
}

output "web_app_deployment_slots" {
  value       = module.avm-res-web-site.web_app_deployment_slots
  description = "The deployment slots."
}
