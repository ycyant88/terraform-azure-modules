output "application_gateway_id" {
  value       = module.avm-res-network-applicationgateway.application_gateway_id
  description = "The ID of the Azure Application Gateway."
}

output "application_gateway_name" {
  value       = module.avm-res-network-applicationgateway.application_gateway_name
  description = "The name of the Azure Application Gateway."
}

output "backend_address_pools" {
  value       = module.avm-res-network-applicationgateway.backend_address_pools
  description = "Information about the backend address pools configured for the Application Gateway, including their names."
}

output "backend_http_settings" {
  value       = module.avm-res-network-applicationgateway.backend_http_settings
  description = "Information about the backend HTTP settings for the Application Gateway, including settings like port and protocol."
}

output "frontend_port" {
  value       = module.avm-res-network-applicationgateway.frontend_port
  description = "Information about the frontend ports used by the Application Gateway, including their names and port numbers."
}

output "http_listeners" {
  value       = module.avm-res-network-applicationgateway.http_listeners
  description = "Information about the HTTP listeners configured for the Application Gateway, including their names and settings."
}

output "probes" {
  value       = module.avm-res-network-applicationgateway.probes
  description = "Information about health probes configured for the Application Gateway, including their settings."
}

output "public_ip_address" {
  value       = module.avm-res-network-applicationgateway.public_ip_address
  description = "The actual public IP address associated with the Public IP resource."
}

output "public_ip_id" {
  value       = module.avm-res-network-applicationgateway.public_ip_id
  description = "The ID of the Azure Public IP address associated with the Application Gateway."
}

output "request_routing_rules" {
  value       = module.avm-res-network-applicationgateway.request_routing_rules
  description = "Information about request routing rules defined for the Application Gateway, including their names and configurations."
}

output "resource_id" {
  value       = module.avm-res-network-applicationgateway.resource_id
  description = "Resource ID of Container Group Instance"
}

output "ssl_certificates" {
  value       = module.avm-res-network-applicationgateway.ssl_certificates
  description = "Information about SSL certificates used by the Application Gateway, including their names and other details."
}

output "tags" {
  value       = module.avm-res-network-applicationgateway.tags
  description = "The tags applied to the Application Gateway."
}

output "waf_configuration" {
  value       = module.avm-res-network-applicationgateway.waf_configuration
  description = "Information about the Web Application Firewall (WAF) configuration, if applicable."
}
