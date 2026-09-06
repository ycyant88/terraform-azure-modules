output "private_endpoints" {
  value       = module.avm-res-search-searchservice.private_endpoints
  description = "A map of private endpoints. The map key is the supplied input to var.private_endpoints. The map value is the entire azurerm_private_endpoint resource."
}

output "resource" {
  value       = module.avm-res-search-searchservice.resource
  description = "This is the full output for the resource."
}

output "resource_id" {
  value       = module.avm-res-search-searchservice.resource_id
  description = "The ID of the machine learning workspace."
}
