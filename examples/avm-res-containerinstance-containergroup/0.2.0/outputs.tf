output "fqdn" {
  value       = module.avm-res-containerinstance-containergroup.fqdn
  description = "The FQDN of the container group derived from dns_name_label"
}

output "ip_address" {
  value       = module.avm-res-containerinstance-containergroup.ip_address
  description = "The IP address allocated to the container group"
}

output "name" {
  value       = module.avm-res-containerinstance-containergroup.name
  description = "Name of the container group"
}

output "resource_group_name" {
  value       = module.avm-res-containerinstance-containergroup.resource_group_name
  description = "Name of the container group resource group"
}

output "resource_id" {
  value       = module.avm-res-containerinstance-containergroup.resource_id
  description = "Resource ID of Container Group Instance"
}
