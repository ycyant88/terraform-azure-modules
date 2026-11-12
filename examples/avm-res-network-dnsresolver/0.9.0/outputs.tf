output "forwarding_rulesets" {
  value       = module.avm-res-network-dnsresolver.forwarding_rulesets
  description = "Discrete forwarding ruleset objects, keyed by \"<outbound endpoint key>-<ruleset name>\", rather than complete provider resource objects."
}

output "inbound_endpoint_ips" {
  value       = module.avm-res-network-dnsresolver.inbound_endpoint_ips
  description = "The IP addresses of the inbound endpoints."
}

output "inbound_endpoints" {
  value       = module.avm-res-network-dnsresolver.inbound_endpoints
  description = "Discrete inbound endpoint objects, keyed by endpoint key, with the original ip_configurations list and flattened subnet_id, private_ip_address and private_ip_allocation_method fields."
}

output "name" {
  value       = module.avm-res-network-dnsresolver.name
  description = "The name of the DNS resolver."
}

output "outbound_endpoints" {
  value       = module.avm-res-network-dnsresolver.outbound_endpoints
  description = "Discrete outbound endpoint objects, keyed by endpoint key, rather than complete provider resource objects."
}

output "resource" {
  value       = module.avm-res-network-dnsresolver.resource
  description = "A discrete DNS resolver object containing id, name, location, resource_group_name, tags, virtual_network_id and exported state fields, rather than the complete provider resource object."
}

output "resource_id" {
  value       = module.avm-res-network-dnsresolver.resource_id
  description = "The ID of the DNS resolver."
}
