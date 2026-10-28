module "avm-res-network-networkmanager" {
  source             = "Azure/avm-res-network-networkmanager/azurerm"
  version            = "0.4.0"
  description        = var.description
  enable_telemetry   = var.enable_telemetry
  location           = var.location
  member_type        = var.member_type
  name               = var.name
  network_manager_id = var.network_manager_id
  static_members     = var.static_members
}
