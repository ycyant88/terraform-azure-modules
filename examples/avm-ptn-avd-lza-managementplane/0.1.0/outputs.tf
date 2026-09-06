output "azure_virtual_desktop_host_pool" {
  value       = module.avm-ptn-avd-lza-managementplane.azure_virtual_desktop_host_pool
  description = "Name of the Azure Virtual Desktop host pool"
}

output "azure_virtual_desktop_host_pool_id" {
  value       = module.avm-ptn-avd-lza-managementplane.azure_virtual_desktop_host_pool_id
  description = "ID of the Azure Virtual Desktop host pool"
}

output "azurerm_virtual_desktop_application_group" {
  value       = module.avm-ptn-avd-lza-managementplane.azurerm_virtual_desktop_application_group
  description = "Name of the Azure Virtual Desktop DAG"
}

output "azurerm_virtual_desktop_application_group_id" {
  value       = module.avm-ptn-avd-lza-managementplane.azurerm_virtual_desktop_application_group_id
  description = "ID of the Azure Virtual Desktop DAG"
}

output "azurerm_virtual_desktop_workspace" {
  value       = module.avm-ptn-avd-lza-managementplane.azurerm_virtual_desktop_workspace
  description = "Name of the Azure Virtual Desktop workspace"
}

output "private_endpoints" {
  value       = module.avm-ptn-avd-lza-managementplane.private_endpoints
  description = "A map of private endpoints. The map key is the supplied input to var.private_endpoints. The map value is the entire azurerm_private_endpoint resource."
}

output "resource" {
  value       = module.avm-ptn-avd-lza-managementplane.resource
  description = "This is the full output for the resource."
}

output "workspace_id" {
  value       = module.avm-ptn-avd-lza-managementplane.workspace_id
  description = "The ID of the Workspace resource."
}
