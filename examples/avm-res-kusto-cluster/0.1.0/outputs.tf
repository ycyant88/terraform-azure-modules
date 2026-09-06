output "data_ingestion_uri" {
  value       = module.avm-res-kusto-cluster.data_ingestion_uri
  description = "The Kusto Cluster URI to be used for data ingestion."
}

output "id" {
  value       = module.avm-res-kusto-cluster.id
  description = "The Kusto Cluster ID."
}

output "identity" {
  value       = module.avm-res-kusto-cluster.identity
  description = "An identity block exports the following:\n\nprincipal_id - The Principal ID associated with this System Assigned Managed Service Identity.\n\ntenant_id - The Tenant ID associated with this System Assigned Managed Service Identity.\n"
}

output "private_endpoints" {
  value       = module.avm-res-kusto-cluster.private_endpoints
  description = "A map of private endpoints. The map key is the supplied input to var.private_endpoints. The map value is the entire azurerm_private_endpoint resource."
}

output "resource" {
  value       = module.avm-res-kusto-cluster.resource
  description = "This is the full output for the resource."
}

output "uri" {
  value       = module.avm-res-kusto-cluster.uri
  description = "The FQDN of the Azure Kusto Cluster."
}
