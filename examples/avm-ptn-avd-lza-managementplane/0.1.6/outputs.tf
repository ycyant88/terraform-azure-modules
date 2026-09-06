output "application_group_id" {
  value       = module.avm-ptn-avd-lza-managementplane.application_group_id
  description = "The ID of the application group."
}

output "dcr_resource_id" {
  value       = module.avm-ptn-avd-lza-managementplane.dcr_resource_id
  description = "The ID of the Monitor Data Collection Rule."
}

output "hostpool_id" {
  value       = module.avm-ptn-avd-lza-managementplane.hostpool_id
  description = "The ID of the host pool."
}

output "log_analytics_workspace_id" {
  value       = module.avm-ptn-avd-lza-managementplane.log_analytics_workspace_id
  description = "The ID of the Log Analytics workspace."
}

output "private_endpoints_hostpool" {
  value       = module.avm-ptn-avd-lza-managementplane.private_endpoints_hostpool
  description = "A map of private endpoints. The map key is the supplied input to var.private_endpoints. The map value is the entire azurerm_private_endpoint resource."
}

output "registrationinfo_token" {
  value       = module.avm-ptn-avd-lza-managementplane.registrationinfo_token
  description = "The token for the host pool registration."
}

output "resource" {
  value       = module.avm-ptn-avd-lza-managementplane.resource
  description = "This output is the full output for the resource to allow flexibility to reference all possible values for the resource. Example usage: module.<modulename>.resource.id"
}

output "resource_id" {
  value       = module.avm-ptn-avd-lza-managementplane.resource_id
  description = "This output is the full output for the resource to allow flexibility to reference all possible values for the resource. Example usage: module.<modulename>.resource.id"
}

output "scaling_plan_id" {
  value       = module.avm-ptn-avd-lza-managementplane.scaling_plan_id
  description = "The ID of the scaling plan."
}

output "virtual_desktop_host_pool_name" {
  value       = module.avm-ptn-avd-lza-managementplane.virtual_desktop_host_pool_name
  description = "The name of the host pool."
}

output "workspace_id" {
  value       = module.avm-ptn-avd-lza-managementplane.workspace_id
  description = "The ID of the workspace."
}
