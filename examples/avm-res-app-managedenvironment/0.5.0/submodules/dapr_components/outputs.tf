output "deployment_errors" {
  value       = module.avm-res-app-managedenvironment.deployment_errors
  description = "Any errors that occurred during deployment or deployment validation"
}

output "name" {
  value       = module.avm-res-app-managedenvironment.name
  description = "The name of the created resource."
}

output "resource_id" {
  value       = module.avm-res-app-managedenvironment.resource_id
  description = "The ID of the created resource."
}
