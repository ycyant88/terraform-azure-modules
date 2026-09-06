module "avm-res-network-networkmanager" {
  source                 = "Azure/avm-res-network-networkmanager/azurerm"
  version                = "0.3.0"
  description            = var.description
  name                   = var.name
  network_manager_id     = var.network_manager_id
  route_table_usage_mode = var.route_table_usage_mode
  rule_collections       = var.rule_collections
}
