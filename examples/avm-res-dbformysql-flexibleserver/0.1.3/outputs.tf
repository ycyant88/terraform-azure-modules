output "private_endpoints" {
  value       = module.avm-res-dbformysql-flexibleserver.private_endpoints
  description = "A map of private endpoints. The map key is the supplied input to var.private_endpoints. The map value is the entire azurerm_private_endpoint resource."
}

output "resouce_name" {
  value       = module.avm-res-dbformysql-flexibleserver.resouce_name
  description = "The name of the rresource"
}

output "resource" {
  value       = module.avm-res-dbformysql-flexibleserver.resource
  description = "This is the full output for the resource."
}

output "resource_id" {
  value       = module.avm-res-dbformysql-flexibleserver.resource_id
  description = "The ID of the resoure"
}
