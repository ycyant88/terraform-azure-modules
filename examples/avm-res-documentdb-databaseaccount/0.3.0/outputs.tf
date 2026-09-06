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

output "mongo_collections" {
  value       = module.avm-res-documentdb-databaseaccount.mongo_collections
  description = "A map of the MongoDB collections created, with the collection name as the key and the collection ID as the value."
}

output "mongo_databases" {
  value       = module.avm-res-documentdb-databaseaccount.mongo_databases
  description = "A map of the MongoDB databases created, with the database name as the key and the database ID as the value."
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

output "sql_containers" {
  value       = module.avm-res-documentdb-databaseaccount.sql_containers
  description = "A map of the SQL containers created, with the container name as the key and the container ID as the value."
}

output "sql_databases" {
  value       = module.avm-res-documentdb-databaseaccount.sql_databases
  description = "A map of the SQL databases created, with the database name as the key and the database ID as the value."
}

output "sql_dedicated_gateway" {
  value       = module.avm-res-documentdb-databaseaccount.sql_dedicated_gateway
  description = "The IDs of the SQL dedicated gateways created."
}

output "sql_functions" {
  value       = module.avm-res-documentdb-databaseaccount.sql_functions
  description = "A map of the SQL functions created, with the function name as the key and the function ID as the value."
}

output "sql_stored_procedures" {
  value       = module.avm-res-documentdb-databaseaccount.sql_stored_procedures
  description = "A map of the SQL stored procedures created, with the stored procedure name as the key and the stored procedure ID as the value."
}

output "sql_triggers" {
  value       = module.avm-res-documentdb-databaseaccount.sql_triggers
  description = "A map of the SQL triggers created, with the trigger name as the key and the trigger ID as the value."
}
