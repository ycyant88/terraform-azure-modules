output "resource" {
  value       = module.avm-res-network-frontdoorwebapplicationfirewallpolicy.resource
  description = "This is the full output for the resource."
}

output "resource_id" {
  value       = module.avm-res-network-frontdoorwebapplicationfirewallpolicy.resource_id
  description = "The ID of the WAF Policy."
}
