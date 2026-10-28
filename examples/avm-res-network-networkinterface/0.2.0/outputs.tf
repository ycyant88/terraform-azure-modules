output "location" {
  value       = module.avm-res-network-networkinterface.location
  description = "The Azure deployment region."
}

output "resource" {
  value       = module.avm-res-network-networkinterface.resource
  description = "This is the full output for the resource."
}

output "resource_group_name" {
  value       = module.avm-res-network-networkinterface.resource_group_name
  description = "The name of the resource group."
}

output "resource_id" {
  value       = module.avm-res-network-networkinterface.resource_id
  description = "This id of the resource."
}
