module "avm-res-network-dnsresolver" {
  source                      = "Azure/avm-res-network-dnsresolver/azurerm"
  version                     = "0.1.2"
  enable_telemetry            = var.enable_telemetry
  inbound_endpoints           = var.inbound_endpoints
  location                    = var.location
  lock                        = var.lock
  name                        = var.name
  outbound_endpoints          = var.outbound_endpoints
  resource_group_name         = var.resource_group_name
  role_assignments            = var.role_assignments
  tags                        = var.tags
  virtual_network_resource_id = var.virtual_network_resource_id
}
