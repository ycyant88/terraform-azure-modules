output "firewalls" {
  value       = module.avm-ptn-hubnetworking.firewalls
  description = "A curated output of the firewalls created by this module."
}

output "hub_route_tables" {
  value       = module.avm-ptn-hubnetworking.hub_route_tables
  description = "A curated output of the route tables created by this module."
}

output "resource_groups" {
  value       = module.avm-ptn-hubnetworking.resource_groups
  description = "A curated output of the resource groups created by this module."
}

output "virtual_networks" {
  value       = module.avm-ptn-hubnetworking.virtual_networks
  description = "A curated output of the virtual networks created by this module."
}
