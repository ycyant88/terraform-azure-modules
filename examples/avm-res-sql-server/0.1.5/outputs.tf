output "private_endpoints" {
  value       = module.avm-res-sql-server.private_endpoints
  description = "  A map of the private endpoints created.\n"
}

output "resource" {
  value       = module.avm-res-sql-server.resource
  description = "This is the full output for the resource."
}

output "resource_databases" {
  value       = module.avm-res-sql-server.resource_databases
  description = "A map of databases. The map key is the supplied input to var.databases. The map value is the entire azurerm_mssql_database resource."
}

output "resource_elasticpools" {
  value       = module.avm-res-sql-server.resource_elasticpools
  description = "A map of elastic pools. The map key is the supplied input to var.elastic_pools. The map value is the entire azurerm_mssql_elasticpool resource."
}

output "resource_id" {
  value       = module.avm-res-sql-server.resource_id
  description = "This is the id of the resource."
}

output "resource_name" {
  value       = module.avm-res-sql-server.resource_name
  description = "This is the name of the resource."
}
