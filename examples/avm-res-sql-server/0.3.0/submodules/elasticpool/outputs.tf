output "name" {
  value       = module.avm-res-sql-server.name
  description = "The name of the elastic pool."
}

output "resource" {
  value       = module.avm-res-sql-server.resource
  description = "The elastic pool."
}

output "resource_id" {
  value       = module.avm-res-sql-server.resource_id
  description = "The ID of the elastic pool."
}
