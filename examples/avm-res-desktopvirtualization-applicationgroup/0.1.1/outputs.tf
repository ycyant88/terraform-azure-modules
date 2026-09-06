output "azurerm_virtual_desktop_application_group" {
  value       = module.avm-res-desktopvirtualization-applicationgroup.azurerm_virtual_desktop_application_group
  description = "Name of the Azure Virtual Desktop DAG"
}

output "azurerm_virtual_desktop_application_group_id" {
  value       = module.avm-res-desktopvirtualization-applicationgroup.azurerm_virtual_desktop_application_group_id
  description = "ID of the Azure Virtual Desktop DAG"
}
