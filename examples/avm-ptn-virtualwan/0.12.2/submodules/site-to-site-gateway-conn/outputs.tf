output "resource" {
  value       = module.avm-ptn-virtualwan.resource
  description = "Azure VPN Connection resource"
}

output "resource_id" {
  value       = module.avm-ptn-virtualwan.resource_id
  description = "Azure VPN Connection resource ID"
}

output "resource_object" {
  value       = module.avm-ptn-virtualwan.resource_object
  description = "Azure VPN Connection resource object"
}
