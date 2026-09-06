output "name" {
  value       = module.avm-res-cognitiveservices-account.name
  description = "The name of cognitive account created."
}

output "private_endpoints" {
  value       = module.avm-res-cognitiveservices-account.private_endpoints
  description = "  A map of the private endpoints created.\r\n"
}

output "resource" {
  value       = module.avm-res-cognitiveservices-account.resource
  description = "The cognitive account resource created."
}

output "resource_cognitive_deployment" {
  value       = module.avm-res-cognitiveservices-account.resource_cognitive_deployment
  description = "The map of cognitive deployments created."
}

output "resource_id" {
  value       = module.avm-res-cognitiveservices-account.resource_id
  description = "The resource ID of cognitive account created."
}

output "system_assigned_mi_principal_id" {
  value       = module.avm-res-cognitiveservices-account.system_assigned_mi_principal_id
  description = "The principal ID of system assigned managed identity on the cognitive account created, when var.managed_identities is null or var.managed_identities.system_assigned is false this output is null."
}
