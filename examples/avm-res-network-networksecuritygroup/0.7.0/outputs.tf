output "name" {
  value       = module.avm-res-network-networksecuritygroup.name
  description = "The name of the Network Security Group resource"
}

output "resource_id" {
  value       = module.avm-res-network-networksecuritygroup.resource_id
  description = "The id of the Network Security Group resource"
}

output "security_rules" {
  value       = module.avm-res-network-networksecuritygroup.security_rules
  description = "The security rules managed by this module, keyed like var.security_rules. Each value keeps the attribute names of the\nazurerm_network_security_rule resource returned by earlier versions of this module. Unset list attributes are returned\nas empty lists.\n"
}
