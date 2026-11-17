output "dns_suffix" {
  value       = module.avm-res-web-hostingenvironment.dns_suffix
  description = "The DNS suffix of the App Service Environment (ASE)."
}

output "external_inbound_ip_addresses" {
  value       = module.avm-res-web-hostingenvironment.external_inbound_ip_addresses
  description = "The external inbound IP addresses of the App Service Environment (ASE)."
}

output "internal_inbound_ip_addresses" {
  value       = module.avm-res-web-hostingenvironment.internal_inbound_ip_addresses
  description = "The internal inbound IP addresses of the App Service Environment (ASE)."
}

output "linux_outbound_ip_addresses" {
  value       = module.avm-res-web-hostingenvironment.linux_outbound_ip_addresses
  description = "The Linux outbound IP addresses of the App Service Environment (ASE)."
}

output "name" {
  value       = module.avm-res-web-hostingenvironment.name
  description = "The name of the App Service Environment (ASE)."
}

output "resource_id" {
  value       = module.avm-res-web-hostingenvironment.resource_id
  description = "The resource ID of the App Service Environment (ASE)."
}

output "system_assigned_managed_identity_principal_id" {
  value       = module.avm-res-web-hostingenvironment.system_assigned_managed_identity_principal_id
  description = "The principal ID of the system-assigned managed identity."
}

output "windows_outbound_ip_addresses" {
  value       = module.avm-res-web-hostingenvironment.windows_outbound_ip_addresses
  description = "The Windows outbound IP addresses of the App Service Environment (ASE)."
}
