output "administrator_login_password_key_vault_secret" {
  value       = module.avm-res-sql-server.administrator_login_password_key_vault_secret
  description = "The Key Vault secret resource that stores the administrator login password. Only populated when administrator_login_password_key_vault_configuration is set."
}

output "generated_administrator_login_password" {
  value       = module.avm-res-sql-server.generated_administrator_login_password
  description = "The auto-generated administrator login password. Only populated when generate_administrator_login_password = true; null in all other cases (including when the password was supplied via administrator_login_password or administrator_login_password_wo). Sensitive."
}

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
