output "name" {
  value       = module.avm-res-dbforpostgresql-flexibleserver.name
  description = "The resource ID for the resource."
}

output "private_endpoints" {
  value       = module.avm-res-dbforpostgresql-flexibleserver.private_endpoints
  description = "  A map of the private endpoints created.\n"
}

output "resource" {
  value       = module.avm-res-dbforpostgresql-flexibleserver.resource
  description = "This is the full output for the resource."
}

output "resource_id" {
  value       = module.avm-res-dbforpostgresql-flexibleserver.resource_id
  description = "The resource ID for the resource."
}
