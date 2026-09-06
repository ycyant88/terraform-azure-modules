output "ai_services" {
  value       = module.avm-res-machinelearningservices-workspace.ai_services
  description = "The AI Services resource, if created."
}

output "ai_services_service_connection" {
  value       = module.avm-res-machinelearningservices-workspace.ai_services_service_connection
  description = "The service connection between the AIServices and the workspace, if created."
}

output "private_endpoints" {
  value       = module.avm-res-machinelearningservices-workspace.private_endpoints
  description = "A map of the private endpoints created."
}

output "resource" {
  value       = module.avm-res-machinelearningservices-workspace.resource
  description = "The machine learning workspace."
}

output "resource_id" {
  value       = module.avm-res-machinelearningservices-workspace.resource_id
  description = "The ID of the machine learning workspace."
}

output "workspace" {
  value       = module.avm-res-machinelearningservices-workspace.workspace
  description = "The machine learning workspace created."
}

output "workspace_identity" {
  value       = module.avm-res-machinelearningservices-workspace.workspace_identity
  description = "The identity for the created workspace."
}
