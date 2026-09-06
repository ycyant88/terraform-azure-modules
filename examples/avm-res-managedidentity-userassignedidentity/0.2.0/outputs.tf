output "principal_id" {
  value       = module.avm-res-managedidentity-userassignedidentity.principal_id
  description = "This is the principal id for the user assigned identity."
}

output "resource_id" {
  value       = module.avm-res-managedidentity-userassignedidentity.resource_id
  description = "This is the full output for the resource."
}

output "resource_name" {
  value       = module.avm-res-managedidentity-userassignedidentity.resource_name
  description = "The name of the User Assigned Identity that was created."
}

output "resource_object" {
  value       = module.avm-res-managedidentity-userassignedidentity.resource_object
  description = "The object of type User Assigned Identity that was created."
}
