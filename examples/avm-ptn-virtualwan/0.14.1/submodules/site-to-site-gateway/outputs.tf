output "bgp_settings" {
  value       = module.avm-ptn-virtualwan.bgp_settings
  description = "Azure VPN Gateway object"
}

output "id" {
  value       = module.avm-ptn-virtualwan.id
  description = "Azure VPN Gateway ID"
}

output "ip_configuration_ids" {
  value       = module.avm-ptn-virtualwan.ip_configuration_ids
  description = "Azure VPN Gateway BGP Peering Address IP Configuration ID"
}

output "resource" {
  value       = module.avm-ptn-virtualwan.resource
  description = "Azure VPN Gateway"
}

output "resource_id" {
  value       = module.avm-ptn-virtualwan.resource_id
  description = "Azure VPN Gateway ID"
}

output "resource_object" {
  value       = module.avm-ptn-virtualwan.resource_object
  description = "Azure VPN Gateway object"
}

output "vpn_gateway_id" {
  value       = module.avm-ptn-virtualwan.vpn_gateway_id
  description = "Azure VPN Gateway resource ID"
}

output "vpn_gateway_name" {
  value       = module.avm-ptn-virtualwan.vpn_gateway_name
  description = "Azure VPN Gateway resource name"
}
