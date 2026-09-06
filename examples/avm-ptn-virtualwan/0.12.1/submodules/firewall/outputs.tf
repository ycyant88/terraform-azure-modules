output "azure_firewall_resource_names" {
  value       = module.avm-ptn-virtualwan.azure_firewall_resource_names
  description = "Azure Firewall resource name"
}

output "private_ip_address" {
  value       = module.avm-ptn-virtualwan.private_ip_address
  description = "Azure Firewall IP addresses"
}

output "public_ip_addresses" {
  value       = module.avm-ptn-virtualwan.public_ip_addresses
  description = "Azure Firewall IP addresses"
}

output "resource" {
  value       = module.avm-ptn-virtualwan.resource
  description = "Azure Firewall resource"
}

output "resource_id" {
  value       = module.avm-ptn-virtualwan.resource_id
  description = "Azure Firewall resource ID"
}

output "resource_ids" {
  value       = module.avm-ptn-virtualwan.resource_ids
  description = "Azure Firewall resource IDs"
}

output "resource_names" {
  value       = module.avm-ptn-virtualwan.resource_names
  description = "Azure Firewall resource names"
}

output "resource_object" {
  value       = module.avm-ptn-virtualwan.resource_object
  description = "Azure Firewall resource object"
}
