output "fqdn_url" {
  value       = module.avm-res-app-containerapp.fqdn_url
  description = "https url that contains ingress's fqdn, could be used to access the deployed app."
}

output "resource" {
  value       = module.avm-res-app-containerapp.resource
  description = "azurerm_container_app resource created by this module."
}

output "resource_id" {
  value       = module.avm-res-app-containerapp.resource_id
  description = "Resource ID of azurerm_container_app resource created by this module."
}
