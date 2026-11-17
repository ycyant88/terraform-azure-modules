output "name" {
  value       = module.avm-res-network-routetable.name
  description = "The route table name"
}

output "resource" {
  value       = module.avm-res-network-routetable.resource
  description = "The route table, with the attribute names and empty values of the azurerm_route_table resource that earlier versions of this module returned, so that existing references keep working. Prefer resource_id and name.\nroute and subnets list what Azure returned when the route table was last read, so they do not include routes created in the same apply until the next refresh.\nExamples:\n- module.route_table.resource.id\n- module.route_table.resource.name\n"
}

output "resource_id" {
  value       = module.avm-res-network-routetable.resource_id
  description = "The ID of the route table"
}

output "routes" {
  value       = module.avm-res-network-routetable.routes
  description = "The routes. While routes_legacy_mode is false, a map of the route submodule's outputs (name and resource_id), keyed like routes.\nWhile routes_legacy_mode is true, a map keyed by route name, with the attribute names of the azurerm_route resource that earlier versions of this module returned.\n"
}
