output "name" {
  value       = module.avm-res-network-networksecuritygroup.name
  description = "The name of the Network Security Group resource"
}

output "resource_id" {
  value       = module.avm-res-network-networksecuritygroup.resource_id
  description = "The id of the Network Security Group resource"
}

output "security_rules" {
  value       = module.avm-res-network-networksecuritygroup.security_rules
  description = "The Network Security Group Rules"
}
