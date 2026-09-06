module "avm-res-network-networkmanager" {
  source                                         = "Azure/avm-res-network-networkmanager/azurerm"
  version                                        = "0.3.0"
  apply_on_network_intent_policy_based_services  = var.apply_on_network_intent_policy_based_services
  description                                    = var.description
  name                                           = var.name
  network_group_address_space_aggregation_option = var.network_group_address_space_aggregation_option
  network_manager_id                             = var.network_manager_id
  rule_collections                               = var.rule_collections
}
