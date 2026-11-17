output "dns_name" {
  value       = module.avm-res-network-bastionhost.dns_name
  description = "The FQDN of the Azure Bastion resource"
}

output "name" {
  value       = module.avm-res-network-bastionhost.name
  description = "The name of the Azure Bastion resource"
}

output "resource" {
  value       = module.avm-res-network-bastionhost.resource
  description = "The Azure Bastion resource"
}

output "resource_id" {
  value       = module.avm-res-network-bastionhost.resource_id
  description = "The ID of the Azure Bastion resource"
}
