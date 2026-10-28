module "avm-res-network-networkmanager" {
  source                 = "Azure/avm-res-network-networkmanager/azurerm"
  version                = "0.4.0"
  description            = var.description
  enable_telemetry       = var.enable_telemetry
  location               = var.location
  name                   = var.name
  network_manager_id     = var.network_manager_id
  route_table_usage_mode = var.route_table_usage_mode
  rule_collections       = var.rule_collections
}
