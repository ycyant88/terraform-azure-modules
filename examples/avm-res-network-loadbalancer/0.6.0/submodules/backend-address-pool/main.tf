module "avm-res-network-loadbalancer" {
  source                        = "Azure/avm-res-network-loadbalancer/azurerm"
  version                       = "0.6.0"
  avm_managed_migration_enabled = var.avm_managed_migration_enabled
  backend_address_type          = var.backend_address_type
  enable_telemetry              = var.enable_telemetry
  ignore_body_changes           = var.ignore_body_changes
  location                      = var.location
  name                          = var.name
  parent_id                     = var.parent_id
  properties                    = var.properties
  resource_types                = var.resource_types
  retry                         = var.retry
  sku_tier                      = var.sku_tier
  timeouts                      = var.timeouts
}
