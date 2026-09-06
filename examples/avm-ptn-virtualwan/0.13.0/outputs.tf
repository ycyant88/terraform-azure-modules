output "diagnostic_settings_azure_firewall_resource_ids" {
  value       = module.avm-ptn-virtualwan.diagnostic_settings_azure_firewall_resource_ids
  description = "A map of Azure Firewall diagnostic settings resource IDs with the map keys of the firewalls variable."
}

output "ergw" {
  value       = module.avm-ptn-virtualwan.ergw
  description = "ExpressRoute Gateway Objects"
}

output "ergw_id" {
  value       = module.avm-ptn-virtualwan.ergw_id
  description = "ExpressRoute Gateway ID"
}

output "firewall_ip_addresses" {
  value       = module.avm-ptn-virtualwan.firewall_ip_addresses
  description = "Azure Firewall IP addresses."
}

output "firewall_private_ip_address" {
  value       = module.avm-ptn-virtualwan.firewall_private_ip_address
  description = "A map of Azure Firewall private IP address with the map keys of the firewalls variable."
}

output "firewall_private_ip_address_by_hub_key" {
  value       = module.avm-ptn-virtualwan.firewall_private_ip_address_by_hub_key
  description = "A map of Azure Firewall private IP address with the map keys of the firewalls variable."
}

output "firewall_public_ip_addresses" {
  value       = module.avm-ptn-virtualwan.firewall_public_ip_addresses
  description = "A map of Azure Firewall public IP addresses with the map keys of the firewalls variable."
}

output "firewall_public_ip_addresses_by_hub_key" {
  value       = module.avm-ptn-virtualwan.firewall_public_ip_addresses_by_hub_key
  description = "A map of Azure Firewall public IP addresses with the map keys of the firewalls variable."
}

output "firewall_resource_ids" {
  value       = module.avm-ptn-virtualwan.firewall_resource_ids
  description = "A map of Azure Firewall resource IDs with the map keys of the firewalls variable."
}

output "firewall_resource_ids_by_hub_key" {
  value       = module.avm-ptn-virtualwan.firewall_resource_ids_by_hub_key
  description = "A map of Azure Firewall resource IDs with the map keys of the firewalls variable."
}

output "firewall_resource_names" {
  value       = module.avm-ptn-virtualwan.firewall_resource_names
  description = "A map of Azure Firewall resource names with the map keys of the firewalls variable."
}

output "firewall_resource_names_by_hub_key" {
  value       = module.avm-ptn-virtualwan.firewall_resource_names_by_hub_key
  description = "A map of Azure Firewall resource names with the map keys of the firewalls variable."
}

output "name" {
  value       = module.avm-ptn-virtualwan.name
  description = "Virtual WAN Name"
}

output "p2s_vpn_gw_id" {
  value       = module.avm-ptn-virtualwan.p2s_vpn_gw_id
  description = "P2S VPN Gateway ID"
}

output "p2s_vpn_gw_resource_ids" {
  value       = module.avm-ptn-virtualwan.p2s_vpn_gw_resource_ids
  description = "A map of point to site VPN gateway names with the map keys of the p2s_gateways variable."
}

output "p2s_vpn_gw_resource_names" {
  value       = module.avm-ptn-virtualwan.p2s_vpn_gw_resource_names
  description = "A map of point to site VPN gateway names with the map keys of the p2s_gateways variable."
}

output "resource" {
  value       = module.avm-ptn-virtualwan.resource
  description = "The full resource outputs."
}

output "resource_group_name" {
  value       = module.avm-ptn-virtualwan.resource_group_name
  description = "Resource Group Name"
}

output "resource_id" {
  value       = module.avm-ptn-virtualwan.resource_id
  description = "Virtual WAN ID"
}

output "s2s_vpn_gw" {
  value       = module.avm-ptn-virtualwan.s2s_vpn_gw
  description = "S2S VPN Gateway Objects"
}

output "s2s_vpn_gw_id" {
  value       = module.avm-ptn-virtualwan.s2s_vpn_gw_id
  description = "S2S VPN Gateway ID"
}

output "virtual_hub_resource_ids" {
  value       = module.avm-ptn-virtualwan.virtual_hub_resource_ids
  description = "A map of Azure Virtual Hub resource IDs with the map keys of the virtual_hubs variable."
}

output "virtual_hub_resource_names" {
  value       = module.avm-ptn-virtualwan.virtual_hub_resource_names
  description = "A map of Azure Virtual Hub resource names with the map keys of the virtual_hubs variable."
}

output "virtual_wan_id" {
  value       = module.avm-ptn-virtualwan.virtual_wan_id
  description = "Virtual WAN ID"
}

output "vpn_gateway_resource_ids" {
  value       = module.avm-ptn-virtualwan.vpn_gateway_resource_ids
  description = "A map of Azure VPN Gateway resource IDs with the map keys of the vpn_gateways variable."
}

output "vpn_gateway_resource_names" {
  value       = module.avm-ptn-virtualwan.vpn_gateway_resource_names
  description = "A map of Azure VPN Gateway resource names with the map keys of the vpn_gateways variable."
}
