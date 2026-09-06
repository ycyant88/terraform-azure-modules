output "database_name" {
  value       = module.avm-res-dbforpostgresql-flexibleserver.database_name
  description = "A map of database keys to database name."
}

output "database_resource_ids" {
  value       = module.avm-res-dbforpostgresql-flexibleserver.database_resource_ids
  description = "A map of database keys to resource ids."
}

output "fqdn" {
  value       = module.avm-res-dbforpostgresql-flexibleserver.fqdn
  description = "The fully qualified domain name of the PostgreSQL Flexible Server."
}

output "name" {
  value       = module.avm-res-dbforpostgresql-flexibleserver.name
  description = "The resource ID for the resource."
}

output "private_endpoints" {
  value       = module.avm-res-dbforpostgresql-flexibleserver.private_endpoints
  description = "  A map of the private endpoints created.\n"
}

output "resource_id" {
  value       = module.avm-res-dbforpostgresql-flexibleserver.resource_id
  description = "The resource ID for the resource."
}
