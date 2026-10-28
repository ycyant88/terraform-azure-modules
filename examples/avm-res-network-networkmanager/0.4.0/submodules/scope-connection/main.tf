module "avm-res-network-networkmanager" {
  source             = "Azure/avm-res-network-networkmanager/azurerm"
  version            = "0.4.0"
  description        = var.description
  enable_telemetry   = var.enable_telemetry
  location           = var.location
  name               = var.name
  network_manager_id = var.network_manager_id
  resource_id        = var.resource_id
  tenant_id          = var.tenant_id
}
