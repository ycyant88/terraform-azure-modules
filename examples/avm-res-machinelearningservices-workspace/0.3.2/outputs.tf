output "application_insights" {
  value       = module.avm-res-machinelearningservices-workspace.application_insights
  description = "The ID of the application insights."
}

output "container_registry" {
  value       = module.avm-res-machinelearningservices-workspace.container_registry
  description = "The container registry resource."
}

output "key_vault" {
  value       = module.avm-res-machinelearningservices-workspace.key_vault
  description = "The key vault resource."
}

output "private_endpoints" {
  value       = module.avm-res-machinelearningservices-workspace.private_endpoints
  description = "  A map of the private endpoints created.\n"
}

output "resource" {
  value       = module.avm-res-machinelearningservices-workspace.resource
  description = "The machine learning workspace."
}

output "resource_id" {
  value       = module.avm-res-machinelearningservices-workspace.resource_id
  description = "The ID of the machine learning workspace."
}

output "storage_account" {
  value       = module.avm-res-machinelearningservices-workspace.storage_account
  description = "The storage account resource."
}
