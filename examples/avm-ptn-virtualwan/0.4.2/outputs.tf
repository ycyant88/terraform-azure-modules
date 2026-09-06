output "er_gw_id" {
  value       = module.avm-ptn-virtualwan.er_gw_id
  description = "ExpressRoute Gateway ID"
}

output "fw" {
  value       = module.avm-ptn-virtualwan.fw
  description = "Firewall Name"
}

output "p2s_vpn_gw_id" {
  value       = module.avm-ptn-virtualwan.p2s_vpn_gw_id
  description = "P2S VPN Gateway ID"
}

output "resource_group_name" {
  value       = module.avm-ptn-virtualwan.resource_group_name
  description = "Resource Group Name"
}

output "s2s_vpn_gw" {
  value       = module.avm-ptn-virtualwan.s2s_vpn_gw
  description = "S2S VPN Gateway Objects"
}

output "s2s_vpn_gw_id" {
  value       = module.avm-ptn-virtualwan.s2s_vpn_gw_id
  description = "S2S VPN Gateway ID"
}

output "virtual_hub_id" {
  value       = module.avm-ptn-virtualwan.virtual_hub_id
  description = "Virtual Hub ID"
}

output "virtual_wan_id" {
  value       = module.avm-ptn-virtualwan.virtual_wan_id
  description = "Virtual WAN ID"
}
