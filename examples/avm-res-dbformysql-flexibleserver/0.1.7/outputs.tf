output "resource_fqdn" {
  value       = module.avm-res-dbformysql-flexibleserver.resource_fqdn
  description = "The fully qualified domain name of the MySQL Flexible Server."
}

output "resource_id" {
  value       = module.avm-res-dbformysql-flexibleserver.resource_id
  description = "The ID of the resoure"
}

output "resource_name" {
  value       = module.avm-res-dbformysql-flexibleserver.resource_name
  description = "The name of the resource"
}
