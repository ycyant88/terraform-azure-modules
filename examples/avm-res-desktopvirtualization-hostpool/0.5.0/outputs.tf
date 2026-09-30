output "private_endpoints" {
  value       = module.avm-res-desktopvirtualization-hostpool.private_endpoints
  description = "A map of private endpoints. The map key is the supplied input to var.private_endpoints. The map value is the entire azurerm_private_endpoint resource."
}

output "registrationinfo_token" {
  value       = module.avm-res-desktopvirtualization-hostpool.registrationinfo_token
  description = "The token for the host pool registration."
}

output "resource" {
  value       = module.avm-res-desktopvirtualization-hostpool.resource
  description = "This output is the full output for the resource to allow flexibility to reference all possible values for the resource. Example usage: module.<modulename>.resource.id"
}

output "resource_id" {
  value       = module.avm-res-desktopvirtualization-hostpool.resource_id
  description = "Resource ID of azurerm_virtual_desktop_host_pool resource created by this module."
}
