output "fqdn" {
  value       = module.avm-res-app-managedenvironment.fqdn
  description = "FQDN of the route resource."
}

output "name" {
  value       = module.avm-res-app-managedenvironment.name
  description = "The name of the created resource."
}

output "provisioning_errors" {
  value       = module.avm-res-app-managedenvironment.provisioning_errors
  description = "List of errors when trying to reconcile http routes"
}

output "resource_id" {
  value       = module.avm-res-app-managedenvironment.resource_id
  description = "The ID of the created resource."
}
