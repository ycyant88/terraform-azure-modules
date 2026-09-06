module "avm-res-network-firewallpolicy" {
  source                                                            = "Azure/avm-res-network-firewallpolicy/azurerm"
  version                                                           = "0.3.0"
  firewall_policy_rule_collection_group_application_rule_collection = var.firewall_policy_rule_collection_group_application_rule_collection
  firewall_policy_rule_collection_group_firewall_policy_id          = var.firewall_policy_rule_collection_group_firewall_policy_id
  firewall_policy_rule_collection_group_name                        = var.firewall_policy_rule_collection_group_name
  firewall_policy_rule_collection_group_nat_rule_collection         = var.firewall_policy_rule_collection_group_nat_rule_collection
  firewall_policy_rule_collection_group_network_rule_collection     = var.firewall_policy_rule_collection_group_network_rule_collection
  firewall_policy_rule_collection_group_priority                    = var.firewall_policy_rule_collection_group_priority
  firewall_policy_rule_collection_group_timeouts                    = var.firewall_policy_rule_collection_group_timeouts
}
