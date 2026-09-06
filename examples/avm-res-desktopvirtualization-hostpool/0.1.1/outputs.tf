output "azure_virtual_desktop_host_pool" {
  value       = module.avm-res-desktopvirtualization-hostpool.azure_virtual_desktop_host_pool
  description = "Name of the Azure Virtual Desktop host pool"
}

output "azure_virtual_desktop_host_pool_id" {
  value       = module.avm-res-desktopvirtualization-hostpool.azure_virtual_desktop_host_pool_id
  description = "ID of the Azure Virtual Desktop host pool"
}

output "private_endpoints" {
  value       = module.avm-res-desktopvirtualization-hostpool.private_endpoints
  description = "A map of private endpoints. The map key is the supplied input to var.private_endpoints. The map value is the entire azurerm_private_endpoint resource."
}
