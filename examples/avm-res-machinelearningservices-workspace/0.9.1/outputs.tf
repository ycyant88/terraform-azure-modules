output "ai_services" {
  value       = module.avm-res-machinelearningservices-workspace.ai_services
  description = "DEPRECATED. Will always be null."
}

output "ai_services_service_connection" {
  value       = module.avm-res-machinelearningservices-workspace.ai_services_service_connection
  description = "DEPRECATED. Will always be null."
}

output "private_endpoints" {
  value       = module.avm-res-machinelearningservices-workspace.private_endpoints
  description = "A map of the private endpoints created."
}

output "resource" {
  value       = module.avm-res-machinelearningservices-workspace.resource
  description = "DEPRECATED. Use workspace or other outputs instead. If additional fields are required, open a bug. Note: the only input value that should be output too is name"
}

output "resource_id" {
  value       = module.avm-res-machinelearningservices-workspace.resource_id
  description = "The ID of the machine learning workspace."
}

output "system_assigned_mi_principal_id" {
  value       = module.avm-res-machinelearningservices-workspace.system_assigned_mi_principal_id
  description = "The system-assigned managed identity for the created workspace, if applicable."
}

output "workspace" {
  value       = module.avm-res-machinelearningservices-workspace.workspace
  description = "The machine learning workspace created."
}

output "workspace_identity" {
  value       = module.avm-res-machinelearningservices-workspace.workspace_identity
  description = "DEPRECATED. Use system_assigned_mi_principal_id instead, if the workspace was configured for system-assigned managed identity."
}
