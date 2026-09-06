module "avm-res-network-natgateway" {
  source                  = "Azure/avm-res-network-natgateway/azurerm"
  version                 = "0.1.0"
  diagnostic_settings     = var.diagnostic_settings
  enable_telemetry        = var.enable_telemetry
  idle_timeout_in_minutes = var.idle_timeout_in_minutes
  location                = var.location
  lock                    = var.lock
  name                    = var.name
  resource_group_name     = var.resource_group_name
  role_assignments        = var.role_assignments
  sku_name                = var.sku_name
  tags                    = var.tags
  timeouts                = var.timeouts
  zones                   = var.zones
}
