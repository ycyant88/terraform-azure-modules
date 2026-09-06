output "access_key_metadata_writes_enabled" {
  value       = module.avm-res-documentdb-databaseaccount.access_key_metadata_writes_enabled
  description = "Whether access key metadata writes are enabled for the CosmosDB Account."
}

output "analytical_storage" {
  value       = module.avm-res-documentdb-databaseaccount.analytical_storage
  description = "The analytical storage configuration for the CosmosDB Account."
}

output "analytical_storage_enabled" {
  value       = module.avm-res-documentdb-databaseaccount.analytical_storage_enabled
  description = "Whether analytical storage is enabled for the CosmosDB Account."
}

output "automatic_failover_enabled" {
  value       = module.avm-res-documentdb-databaseaccount.automatic_failover_enabled
  description = "Whether automatic failover is enabled for the CosmosDB Account."
}

output "backup" {
  value       = module.avm-res-documentdb-databaseaccount.backup
  description = "The backup configuration for the CosmosDB Account."
}

output "capabilities" {
  value       = module.avm-res-documentdb-databaseaccount.capabilities
  description = "The capabilities enabled for the CosmosDB Account."
}

output "capacity" {
  value       = module.avm-res-documentdb-databaseaccount.capacity
  description = "The capacity configuration for the CosmosDB Account."
}

output "consistency_policy" {
  value       = module.avm-res-documentdb-databaseaccount.consistency_policy
  description = "The consistency policy configuration for the CosmosDB Account."
}

output "cors_rule" {
  value       = module.avm-res-documentdb-databaseaccount.cors_rule
  description = "The CORS rule configuration for the CosmosDB Account."
}

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

output "default_identity_type" {
  value       = module.avm-res-documentdb-databaseaccount.default_identity_type
  description = "The default identity type for the CosmosDB Account."
}

output "endpoint" {
  value       = module.avm-res-documentdb-databaseaccount.endpoint
  description = "The endpoint for the CosmosDB Account."
}

output "free_tier_enabled" {
  value       = module.avm-res-documentdb-databaseaccount.free_tier_enabled
  description = "Whether the free tier is enabled for the CosmosDB Account."
}

output "geo_location" {
  value       = module.avm-res-documentdb-databaseaccount.geo_location
  description = "The geo-location configuration for the CosmosDB Account."
}

output "identity" {
  value       = module.avm-res-documentdb-databaseaccount.identity
  description = "The managed identity configuration for the CosmosDB Account."
}

output "ip_range_filter" {
  value       = module.avm-res-documentdb-databaseaccount.ip_range_filter
  description = "The IP range filter for the CosmosDB Account."
}

output "is_virtual_network_filter_enabled" {
  value       = module.avm-res-documentdb-databaseaccount.is_virtual_network_filter_enabled
  description = "Whether virtual network filtering is enabled for the CosmosDB Account."
}

output "key_vault_key_id" {
  value       = module.avm-res-documentdb-databaseaccount.key_vault_key_id
  description = "The Key Vault key ID used for encryption."
}

output "kind" {
  value       = module.avm-res-documentdb-databaseaccount.kind
  description = "The kind of the CosmosDB Account (GlobalDocumentDB, MongoDB, Parse)."
}

output "local_authentication_disabled" {
  value       = module.avm-res-documentdb-databaseaccount.local_authentication_disabled
  description = "Whether local authentication is disabled for the CosmosDB Account."
}

output "location" {
  value       = module.avm-res-documentdb-databaseaccount.location
  description = "The location/region where the CosmosDB Account is created."
}

output "minimal_tls_version" {
  value       = module.avm-res-documentdb-databaseaccount.minimal_tls_version
  description = "The minimal TLS version for the CosmosDB Account."
}

output "mongo_databases" {
  value       = module.avm-res-documentdb-databaseaccount.mongo_databases
  description = "A map of the MongoDB databases created, with the database name as the key and the database id and collections as the value."
}

output "mongo_server_version" {
  value       = module.avm-res-documentdb-databaseaccount.mongo_server_version
  description = "The MongoDB server version for the CosmosDB Account."
}

output "multiple_write_locations_enabled" {
  value       = module.avm-res-documentdb-databaseaccount.multiple_write_locations_enabled
  description = "Whether multiple write locations are enabled for the CosmosDB Account."
}

output "name" {
  value       = module.avm-res-documentdb-databaseaccount.name
  description = "The name of the cosmos db account created."
}

output "network_acl_bypass_for_azure_services" {
  value       = module.avm-res-documentdb-databaseaccount.network_acl_bypass_for_azure_services
  description = "Whether network ACL bypass is enabled for Azure services."
}

output "network_acl_bypass_ids" {
  value       = module.avm-res-documentdb-databaseaccount.network_acl_bypass_ids
  description = "The list of resource IDs that are allowed to bypass network ACLs."
}

output "offer_type" {
  value       = module.avm-res-documentdb-databaseaccount.offer_type
  description = "The offer type for the CosmosDB Account."
}

output "partition_merge_enabled" {
  value       = module.avm-res-documentdb-databaseaccount.partition_merge_enabled
  description = "Whether partition merge is enabled for the CosmosDB Account."
}

output "public_network_access_enabled" {
  value       = module.avm-res-documentdb-databaseaccount.public_network_access_enabled
  description = "Whether public network access is enabled for the CosmosDB Account."
}

output "read_endpoints" {
  value       = module.avm-res-documentdb-databaseaccount.read_endpoints
  description = "A list of read endpoints available for this CosmosDB account."
}

output "resource" {
  value       = module.avm-res-documentdb-databaseaccount.resource
  description = "This is the full output for the resource."
}

output "resource_diagnostic_settings" {
  value       = module.avm-res-documentdb-databaseaccount.resource_diagnostic_settings
  description = "A map of the diagnostic settings created, with the diagnostic setting name as the key and the diagnostic setting ID as the value."
}

output "resource_group_name" {
  value       = module.avm-res-documentdb-databaseaccount.resource_group_name
  description = "The name of the resource group in which the CosmosDB Account is created."
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

output "tags" {
  value       = module.avm-res-documentdb-databaseaccount.tags
  description = "The tags assigned to the CosmosDB Account."
}

output "virtual_network_rule" {
  value       = module.avm-res-documentdb-databaseaccount.virtual_network_rule
  description = "The virtual network rules configured for the CosmosDB Account."
}

output "write_endpoints" {
  value       = module.avm-res-documentdb-databaseaccount.write_endpoints
  description = "A list of write endpoints available for this CosmosDB account."
}
