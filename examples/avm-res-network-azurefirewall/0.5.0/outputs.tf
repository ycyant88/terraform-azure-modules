output "name" {
  value       = module.avm-res-network-azurefirewall.name
  description = "The name of the Firewall."
}

output "private_ip_address" {
  value       = module.avm-res-network-azurefirewall.private_ip_address
  description = "The private IP address of the Firewall: the address of the IP configuration in AzureFirewallSubnet, or the private hub IP address of a Firewall in a Virtual Hub."
}

output "resource" {
  value       = module.avm-res-network-azurefirewall.resource
  description = "The Firewall, with the attribute names and empty values of the azurerm_firewall resource that earlier versions of this module returned, so that existing references keep working. Prefer resource_id, name and private_ip_address.\nExamples:\n- module.firewall.resource.id\n- module.firewall.resource.name\n- module.firewall.resource.ip_configuration[0].private_ip_address\n- module.firewall.resource.virtual_hub[0].private_ip_address\n"
}

output "resource_id" {
  value       = module.avm-res-network-azurefirewall.resource_id
  description = "This is the resource id for the firewall resource."
}
