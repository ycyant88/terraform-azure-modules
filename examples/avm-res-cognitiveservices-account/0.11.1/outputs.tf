output "endpoint" {
  value       = module.avm-res-cognitiveservices-account.endpoint
  description = "The endpoint used to connect to the Cognitive Service Account."
}

output "name" {
  value       = module.avm-res-cognitiveservices-account.name
  description = "The name of cognitive account created."
}

output "primary_access_key" {
  value       = module.avm-res-cognitiveservices-account.primary_access_key
  description = "A primary access key which can be used to connect to the Cognitive Service Account. This will be null when var.local_auth_enabled is set to false."
}

output "private_endpoints" {
  value       = module.avm-res-cognitiveservices-account.private_endpoints
  description = "  A map of the private endpoints created.\n"
}

output "rai_policy_id" {
  value       = module.avm-res-cognitiveservices-account.rai_policy_id
  description = "The ID of the RAI policy created."
}

output "resource" {
  value       = module.avm-res-cognitiveservices-account.resource
  description = "The cognitive account resource created in AzureRM schema."
}

output "resource_cognitive_deployment" {
  value       = module.avm-res-cognitiveservices-account.resource_cognitive_deployment
  description = "The map of cognitive deployments created in AzureRM schema."
}

output "resource_id" {
  value       = module.avm-res-cognitiveservices-account.resource_id
  description = "The resource ID of cognitive account created."
}

output "resource_sensitive" {
  value       = module.avm-res-cognitiveservices-account.resource_sensitive
  description = "The cognitive account resource created, sensitive data only."
}

output "secondary_access_key" {
  value       = module.avm-res-cognitiveservices-account.secondary_access_key
  description = "A secondary access key which can be used to connect to the Cognitive Service Account. This will be null when local_auth_enabled is set to false."
}

output "system_assigned_mi_principal_id" {
  value       = module.avm-res-cognitiveservices-account.system_assigned_mi_principal_id
  description = "The principal ID of system assigned managed identity on the Cognitive/AI Service account created, when var.managed_identities is null or var.managed_identities.system_assigned is false this output is null."
}
