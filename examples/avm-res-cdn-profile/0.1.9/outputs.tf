output "cdn_endpoint_custom_domains" {
  value       = module.avm-res-cdn-profile.cdn_endpoint_custom_domains
  description = "CDN endpoint custom domains output object"
}

output "cdn_endpoints" {
  value       = module.avm-res-cdn-profile.cdn_endpoints
  description = "CDN endpoint output object"
}

output "frontdoor_custom_domains" {
  value       = module.avm-res-cdn-profile.frontdoor_custom_domains
  description = "Azure front door custom domains output object"
}

output "frontdoor_endpoints" {
  value       = module.avm-res-cdn-profile.frontdoor_endpoints
  description = "Azure front door endpoint output object"
}

output "frontdoor_firewall_policies" {
  value       = module.avm-res-cdn-profile.frontdoor_firewall_policies
  description = "Azure front door firewall policies output object"
}

output "frontdoor_origin_groups" {
  value       = module.avm-res-cdn-profile.frontdoor_origin_groups
  description = "Azure front door origin groups output object"
}

output "frontdoor_origins" {
  value       = module.avm-res-cdn-profile.frontdoor_origins
  description = "Azure front door origins output object"
}

output "frontdoor_rule_sets" {
  value       = module.avm-res-cdn-profile.frontdoor_rule_sets
  description = "Azure front door rule sets output object"
}

output "frontdoor_rules" {
  value       = module.avm-res-cdn-profile.frontdoor_rules
  description = "Azure front door rules output object"
}

output "frontdoor_security_policies" {
  value       = module.avm-res-cdn-profile.frontdoor_security_policies
  description = "Azure front door security policies output object"
}

output "resource" {
  value       = module.avm-res-cdn-profile.resource
  description = "Full resource output object"
}

output "resource_id" {
  value       = module.avm-res-cdn-profile.resource_id
  description = "The resource id of the Front door profile"
}

output "resource_name" {
  value       = module.avm-res-cdn-profile.resource_name
  description = "The resource name of the Front door profile"
}

output "system_assigned_mi_principal_id" {
  value       = module.avm-res-cdn-profile.system_assigned_mi_principal_id
  description = "The system assigned managed identity of the front door profile"
}
