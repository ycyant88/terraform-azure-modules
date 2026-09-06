output "cosmosdb_keys" {
  value       = module.avm-res-documentdb-databaseaccount.cosmosdb_keys
  description = "The keys for the CosmosDB Account."
}

output "cosmosdb_mongodb_connection_strings" {
  value       = module.avm-res-documentdb-databaseaccount.cosmosdb_mongodb_connection_strings
  description = "The MongoDB connection strings for the CosmosDB Account."
}

output "cosmosdb_sql_connection_strings" {
  value       = module.avm-res-documentdb-databaseaccount.cosmosdb_sql_connection_strings
  description = "The SQL connection strings for the CosmosDB Account."
}

output "mongo_databases" {
  value       = module.avm-res-documentdb-databaseaccount.mongo_databases
  description = "A map of the MongoDB databases created, with the database name as the key and the database id and collections as the value."
}

output "name" {
  value       = module.avm-res-documentdb-databaseaccount.name
  description = "The name of the cosmos db account created."
}

output "resource_diagnostic_settings" {
  value       = module.avm-res-documentdb-databaseaccount.resource_diagnostic_settings
  description = "A map of the diagnostic settings created, with the diagnostic setting name as the key and the diagnostic setting ID as the value."
}

output "resource_id" {
  value       = module.avm-res-documentdb-databaseaccount.resource_id
  description = "The resource ID of the cosmos db account created."
}

output "resource_locks" {
  value       = module.avm-res-documentdb-databaseaccount.resource_locks
  description = "A map of the management locks created, with the lock name as the key and the lock ID as the value."
}

output "resource_private_endpoints" {
  value       = module.avm-res-documentdb-databaseaccount.resource_private_endpoints
  description = "A map of the management locks created, with the lock name as the key and the lock ID as the value."
}

output "resource_private_endpoints_application_security_group_association" {
  value       = module.avm-res-documentdb-databaseaccount.resource_private_endpoints_application_security_group_association
  description = "The IDs of the private endpoint application security group associations created."
}

output "resource_role_assignments" {
  value       = module.avm-res-documentdb-databaseaccount.resource_role_assignments
  description = "A map of the role assignments created, with the assignment key as the map key and the assignment value as the map value."
}

output "sql_databases" {
  value       = module.avm-res-documentdb-databaseaccount.sql_databases
  description = "A map of the SQL databases created, with the database name as the key and the database ID, containers, functions, stored_procedures and triggers as the value."
}

output "sql_dedicated_gateway" {
  value       = module.avm-res-documentdb-databaseaccount.sql_dedicated_gateway
  description = "The IDs of the SQL dedicated gateways created."
}
