module "avm-res-network-networkmanager" {
  source                    = "Azure/avm-res-network-networkmanager/azurerm"
  version                   = "0.4.0"
  applies_to_groups         = var.applies_to_groups
  connectivity_capabilities = var.connectivity_capabilities
  connectivity_topology     = var.connectivity_topology
  delete_existing_peering   = var.delete_existing_peering
  description               = var.description
  enable_telemetry          = var.enable_telemetry
  hubs                      = var.hubs
  is_global                 = var.is_global
  location                  = var.location
  name                      = var.name
  network_manager_id        = var.network_manager_id
}
