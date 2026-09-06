output "allow_new_private_endpoint_connections" {
  value       = module.avm-res-web-hostingenvironment.allow_new_private_endpoint_connections
  description = "Whether new private endpoint connections are allowed."
}

output "external_inbound_ip_addresses" {
  value       = module.avm-res-web-hostingenvironment.external_inbound_ip_addresses
  description = "The external inbound IP addresses of the App Service Environment (ASE)."
}

output "ftp_enabled" {
  value       = module.avm-res-web-hostingenvironment.ftp_enabled
  description = "Whether FTP is enabled."
}

output "internal_inbound_ip_addresses" {
  value       = module.avm-res-web-hostingenvironment.internal_inbound_ip_addresses
  description = "The internal inbound IP addresses of the App Service Environment (ASE)."
}

output "linux_outbound_ip_addresses" {
  value       = module.avm-res-web-hostingenvironment.linux_outbound_ip_addresses
  description = "The Linux outbound IP addresses of the App Service Environment (ASE)."
}

output "remote_debug_enabled" {
  value       = module.avm-res-web-hostingenvironment.remote_debug_enabled
  description = "Whether remote debug is enabled."
}

output "resource_id" {
  value       = module.avm-res-web-hostingenvironment.resource_id
  description = "The resource ID of the networking configuration."
}

output "windows_outbound_ip_addresses" {
  value       = module.avm-res-web-hostingenvironment.windows_outbound_ip_addresses
  description = "The Windows outbound IP addresses of the App Service Environment (ASE)."
}
