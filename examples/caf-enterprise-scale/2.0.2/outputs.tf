output "azurerm_automation_account" {
  value       = module.caf-enterprise-scale.azurerm_automation_account
  description = "Returns the configuration data for all Automation Accounts created by this module."
}

output "azurerm_dns_zone" {
  value       = module.caf-enterprise-scale.azurerm_dns_zone
  description = "Returns the configuration data for all DNS Zones created by this module."
}

output "azurerm_express_route_gateway" {
  value       = module.caf-enterprise-scale.azurerm_express_route_gateway
  description = "Returns the configuration data for all (Virtual WAN) ExpressRoute Gateways created by this module."
}

output "azurerm_firewall" {
  value       = module.caf-enterprise-scale.azurerm_firewall
  description = "Returns the configuration data for all Azure Firewalls created by this module."
}

output "azurerm_firewall_policy" {
  value       = module.caf-enterprise-scale.azurerm_firewall_policy
  description = "Returns the configuration data for all Azure Firewall Policies created by this module."
}

output "azurerm_log_analytics_linked_service" {
  value       = module.caf-enterprise-scale.azurerm_log_analytics_linked_service
  description = "Returns the configuration data for all Log Analytics linked services created by this module."
}

output "azurerm_log_analytics_solution" {
  value       = module.caf-enterprise-scale.azurerm_log_analytics_solution
  description = "Returns the configuration data for all Log Analytics solutions created by this module."
}

output "azurerm_log_analytics_workspace" {
  value       = module.caf-enterprise-scale.azurerm_log_analytics_workspace
  description = "Returns the configuration data for all Log Analytics workspaces created by this module. Excludes sensitive values."
}

output "azurerm_management_group" {
  value       = module.caf-enterprise-scale.azurerm_management_group
  description = "Returns the configuration data for all Management Groups created by this module."
}

output "azurerm_management_group_policy_assignment" {
  value       = module.caf-enterprise-scale.azurerm_management_group_policy_assignment
  description = "Returns the configuration data for all Management Group Policy Assignments created by this module."
}

output "azurerm_network_ddos_protection_plan" {
  value       = module.caf-enterprise-scale.azurerm_network_ddos_protection_plan
  description = "Returns the configuration data for all DDoS Protection Plans created by this module."
}

output "azurerm_policy_definition" {
  value       = module.caf-enterprise-scale.azurerm_policy_definition
  description = "Returns the configuration data for all Policy Definitions created by this module."
}

output "azurerm_policy_set_definition" {
  value       = module.caf-enterprise-scale.azurerm_policy_set_definition
  description = "Returns the configuration data for all Policy Set Definitions created by this module."
}

output "azurerm_private_dns_zone" {
  value       = module.caf-enterprise-scale.azurerm_private_dns_zone
  description = "Returns the configuration data for all Private DNS Zones created by this module."
}

output "azurerm_private_dns_zone_virtual_network_link" {
  value       = module.caf-enterprise-scale.azurerm_private_dns_zone_virtual_network_link
  description = "Returns the configuration data for all Private DNS Zone network links created by this module."
}

output "azurerm_public_ip" {
  value       = module.caf-enterprise-scale.azurerm_public_ip
  description = "Returns the configuration data for all Public IPs created by this module."
}

output "azurerm_resource_group" {
  value       = module.caf-enterprise-scale.azurerm_resource_group
  description = "Returns the configuration data for all Resource Groups created by this module."
}

output "azurerm_role_assignment" {
  value       = module.caf-enterprise-scale.azurerm_role_assignment
  description = "Returns the configuration data for all Role Assignments created by this module."
}

output "azurerm_role_definition" {
  value       = module.caf-enterprise-scale.azurerm_role_definition
  description = "Returns the configuration data for all Role Definitions created by this module."
}

output "azurerm_subnet" {
  value       = module.caf-enterprise-scale.azurerm_subnet
  description = "Returns the configuration data for all Subnets created by this module."
}

output "azurerm_virtual_hub" {
  value       = module.caf-enterprise-scale.azurerm_virtual_hub
  description = "Returns the configuration data for all Virtual Hubs created by this module."
}

output "azurerm_virtual_hub_connection" {
  value       = module.caf-enterprise-scale.azurerm_virtual_hub_connection
  description = "Returns the configuration data for all Virtual Hub Connections created by this module."
}

output "azurerm_virtual_network" {
  value       = module.caf-enterprise-scale.azurerm_virtual_network
  description = "Returns the configuration data for all Virtual Networks created by this module."
}

output "azurerm_virtual_network_gateway" {
  value       = module.caf-enterprise-scale.azurerm_virtual_network_gateway
  description = "Returns the configuration data for all Virtual Network Gateways created by this module."
}

output "azurerm_virtual_network_peering" {
  value       = module.caf-enterprise-scale.azurerm_virtual_network_peering
  description = "Returns the configuration data for all Virtual Network Peerings created by this module."
}

output "azurerm_virtual_wan" {
  value       = module.caf-enterprise-scale.azurerm_virtual_wan
  description = "Returns the configuration data for all Virtual WANs created by this module."
}

output "azurerm_vpn_gateway" {
  value       = module.caf-enterprise-scale.azurerm_vpn_gateway
  description = "Returns the configuration data for all (Virtual WAN) VPN Gateways created by this module."
}
