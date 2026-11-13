output "application_security_group" {
  value       = module.avm-res-network-applicationsecuritygroup.application_security_group
  description = "Compatibility projection of the application security group: id, name, location, resource_group_name and tags. This is not a provider resource object."
}

output "name" {
  value       = module.avm-res-network-applicationsecuritygroup.name
  description = "The name of the application security group."
}

output "resource_id" {
  value       = module.avm-res-network-applicationsecuritygroup.resource_id
  description = "The Azure resource id of the application security group."
}
