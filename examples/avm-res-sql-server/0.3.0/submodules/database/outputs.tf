output "name" {
  value       = module.avm-res-sql-server.name
  description = "The name of the SQL database."
}

output "resource" {
  value       = module.avm-res-sql-server.resource
  description = "The full resource object of the SQL database."
}

output "resource_id" {
  value       = module.avm-res-sql-server.resource_id
  description = "The resource ID of the SQL database."
}
