output "authorisation_keys" {
  value       = module.avm-res-network-expressroutecircuit.authorisation_keys
  description = "Authorisation keys for the ExpressRoute circuit."
}

output "authorisation_used_status" {
  value       = module.avm-res-network-expressroutecircuit.authorisation_used_status
  description = "Authorisation used status."
}

output "express_route_gateway_connections" {
  value       = module.avm-res-network-expressroutecircuit.express_route_gateway_connections
  description = "ExpressRoute gateway connections."
}

output "name" {
  value       = module.avm-res-network-expressroutecircuit.name
  description = "The resource name of the ExpressRoute circuit."
}

output "peerings" {
  value       = module.avm-res-network-expressroutecircuit.peerings
  description = "ExpressRoute Circuit peering configurations."
}

output "resource_id" {
  value       = module.avm-res-network-expressroutecircuit.resource_id
  description = "The resource ID of the ExpressRoute circuit."
}

output "virtual_network_gateway_connections" {
  value       = module.avm-res-network-expressroutecircuit.virtual_network_gateway_connections
  description = "Virtual network gateway connections."
}
