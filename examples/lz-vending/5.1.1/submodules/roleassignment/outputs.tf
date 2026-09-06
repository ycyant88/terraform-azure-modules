output "role_assignment_name" {
  value       = module.lz-vending.role_assignment_name
  description = "The Azure name (uuid) of the created role assignment."
}

output "role_assignment_resource_id" {
  value       = module.lz-vending.role_assignment_resource_id
  description = "The Azure resource id of the created role assignment."
}
