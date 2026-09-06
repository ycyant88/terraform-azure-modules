module "lz-vending" {
  source                                                   = "Azure/lz-vending/azurerm"
  version                                                  = "0.1.0"
  hub_network_resource_id                                  = var.hub_network_resource_id
  subscription_id                                          = var.subscription_id
  virtual_network_address_space                            = var.virtual_network_address_space
  virtual_network_location                                 = var.virtual_network_location
  virtual_network_name                                     = var.virtual_network_name
  virtual_network_peering_enabled                          = var.virtual_network_peering_enabled
  virtual_network_resource_group_name                      = var.virtual_network_resource_group_name
  virtual_network_use_remote_gateways                      = var.virtual_network_use_remote_gateways
  virtual_network_vwan_connection_enabled                  = var.virtual_network_vwan_connection_enabled
  virtual_network_vwan_propagated_routetables_labels       = var.virtual_network_vwan_propagated_routetables_labels
  virtual_network_vwan_propagated_routetables_resource_ids = var.virtual_network_vwan_propagated_routetables_resource_ids
  virtual_network_vwan_routetable_resource_id              = var.virtual_network_vwan_routetable_resource_id
  vwan_hub_resource_id                                     = var.vwan_hub_resource_id
}
