output "inbound_endpoint_ips" {
  value       = module.avm-res-network-dnsresolver.inbound_endpoint_ips
  description = "The IP addresses of the inbound endpoints."
}

output "name" {
  value       = module.avm-res-network-dnsresolver.name
  description = "The name of the DNS resolver."
}

output "resource" {
  value       = module.avm-res-network-dnsresolver.resource
  description = "This is the full output for the resource."
}

output "resource_id" {
  value       = module.avm-res-network-dnsresolver.resource_id
  description = "The ID of the DNS resolver."
}
