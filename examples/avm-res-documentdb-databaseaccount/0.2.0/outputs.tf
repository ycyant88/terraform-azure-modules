output "name" {
  value       = module.avm-res-documentdb-databaseaccount.name
  description = "The name of the cosmos db account created."
}

output "resource" {
  value       = module.avm-res-documentdb-databaseaccount.resource
  description = "The cosmos db account created. More info: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account#attributes-reference"
}

output "resource_diagnostic_settings" {
  value       = module.avm-res-documentdb-databaseaccount.resource_diagnostic_settings
  description = "The diagnostic settings created. More info: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting#attributes-reference"
}

output "resource_id" {
  value       = module.avm-res-documentdb-databaseaccount.resource_id
  description = "The resource ID of the cosmos db account created."
}

output "resource_locks" {
  value       = module.avm-res-documentdb-databaseaccount.resource_locks
  description = "The management locks created. More info: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_lock#attributes-reference"
}

output "resource_private_endpoints" {
  value       = module.avm-res-documentdb-databaseaccount.resource_private_endpoints
  description = "A map of the private endpoints created. More info: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint#attributes-reference"
}

output "resource_private_endpoints_application_security_group_association" {
  value       = module.avm-res-documentdb-databaseaccount.resource_private_endpoints_application_security_group_association
  description = "The private endpoint application security group associations created"
}

output "resource_role_assignments" {
  value       = module.avm-res-documentdb-databaseaccount.resource_role_assignments
  description = "The role assignments created. More info: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment#attributes-reference"
}

output "sql_containers" {
  value       = module.avm-res-documentdb-databaseaccount.sql_containers
  description = "The value of the sql containers created. More info: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_sql_container#attributes-reference"
}

output "sql_databases" {
  value       = module.avm-res-documentdb-databaseaccount.sql_databases
  description = "The value of the sql databases created. More info: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_sql_database#attributes-reference"
}

output "sql_dedicated_gateway" {
  value       = module.avm-res-documentdb-databaseaccount.sql_dedicated_gateway
  description = "The value of the sql dedicated gateway created. More info: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_sql_dedicated_gateway#attributes-reference"
}

output "sql_functions" {
  value       = module.avm-res-documentdb-databaseaccount.sql_functions
  description = "The value of the sql functions created. More info: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_sql_function#attributes-reference"
}

output "sql_stored_procedures" {
  value       = module.avm-res-documentdb-databaseaccount.sql_stored_procedures
  description = "The value of the sql stored procedures created. More info: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_sql_stored_procedure#attributes-reference"
}

output "sql_triggers" {
  value       = module.avm-res-documentdb-databaseaccount.sql_triggers
  description = "The value of the sql triggers created. More info: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_sql_trigger#attributes-reference"
}
