output "name" {
  value       = module.avm-res-network-routetable.name
  description = "The route table name"
}

output "resource" {
  value       = module.avm-res-network-routetable.resource
  description = "This is the full output for the route table."
}

output "resource_id" {
  value       = module.avm-res-network-routetable.resource_id
  description = "The ID of the route table"
}

output "routes" {
  value       = module.avm-res-network-routetable.routes
  description = "This is the full output of the routes."
}
