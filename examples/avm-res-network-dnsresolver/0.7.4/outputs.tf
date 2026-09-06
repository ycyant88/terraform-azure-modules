output "forwarding_rulesets" {
  value       = module.avm-res-network-dnsresolver.forwarding_rulesets
  description = "The forwarding rulesets of the DNS resolver."
}

output "inbound_endpoint_ips" {
  value       = module.avm-res-network-dnsresolver.inbound_endpoint_ips
  description = "The IP addresses of the inbound endpoints."
}

output "inbound_endpoints" {
  value       = module.avm-res-network-dnsresolver.inbound_endpoints
  description = "The inbound endpoints of the DNS resolver."
}

output "name" {
  value       = module.avm-res-network-dnsresolver.name
  description = "The name of the DNS resolver."
}

output "outbound_endpoints" {
  value       = module.avm-res-network-dnsresolver.outbound_endpoints
  description = "The outbound endpoints of the DNS resolver."
}

output "resource" {
  value       = module.avm-res-network-dnsresolver.resource
  description = "This is the full output for the resource."
}

output "resource_id" {
  value       = module.avm-res-network-dnsresolver.resource_id
  description = "The ID of the DNS resolver."
}
