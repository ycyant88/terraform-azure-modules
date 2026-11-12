module "avm-res-network-dnsresolver" {
  source                      = "Azure/avm-res-network-dnsresolver/azurerm"
  version                     = "0.9.0"
  enable_telemetry            = var.enable_telemetry
  ignore_body_changes         = var.ignore_body_changes
  inbound_endpoints           = var.inbound_endpoints
  location                    = var.location
  lock                        = var.lock
  name                        = var.name
  outbound_endpoints          = var.outbound_endpoints
  parent_id                   = var.parent_id
  resource_types              = var.resource_types
  retry                       = var.retry
  role_assignments            = var.role_assignments
  tags                        = var.tags
  timeouts                    = var.timeouts
  virtual_network_resource_id = var.virtual_network_resource_id
}
