output "application_security_group" {
  value       = module.avm-res-network-applicationsecuritygroup.application_security_group
  description = "The Azure resource of the application security group."
}

output "resource_id" {
  value       = module.avm-res-network-applicationsecuritygroup.resource_id
  description = "The Azure resource id of the application security group."
}
