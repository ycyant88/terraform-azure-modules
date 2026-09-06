output "links" {
  value       = module.avm-ptn-virtualwan.links
  description = "Azure VPN Site links"
}

output "resource" {
  value       = module.avm-ptn-virtualwan.resource
  description = "Azure VPN Site resource"
}

output "resource_id" {
  value       = module.avm-ptn-virtualwan.resource_id
  description = "Azure VPN Site ID"
}

output "resource_object" {
  value       = module.avm-ptn-virtualwan.resource_object
  description = "Azure VPN Site object"
}

output "vpn_site_name" {
  value       = module.avm-ptn-virtualwan.vpn_site_name
  description = "Azure VPN Site names"
}
