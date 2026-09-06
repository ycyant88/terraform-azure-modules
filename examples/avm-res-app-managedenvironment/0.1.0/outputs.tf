output "dapr_components" {
  value       = module.avm-res-app-managedenvironment.dapr_components
  description = "A map of dapr components connected to this environment. The map key is the supplied input to var.storages. The map value is the azurerm-formatted version of the entire dapr_components resource."
}

output "id" {
  value       = module.avm-res-app-managedenvironment.id
  description = "The ID of the resource."
}

output "name" {
  value       = module.avm-res-app-managedenvironment.name
  description = "The name of the resource"
}

output "resource" {
  value       = module.avm-res-app-managedenvironment.resource
  description = "The Container Apps Managed Environment resource."
}

output "storages" {
  value       = module.avm-res-app-managedenvironment.storages
  description = "A map of storage shares connected to this environment. The map key is the supplied input to var.storages. The map value is the azurerm-formatted version of the entire storage shares resource."
}
