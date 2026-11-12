module "avm-res-network-ddosprotectionplan" {
  source              = "Azure/avm-res-network-ddosprotectionplan/azurerm"
  version             = "0.4.0"
  enable_telemetry    = var.enable_telemetry
  ignore_body_changes = var.ignore_body_changes
  location            = var.location
  lock                = var.lock
  name                = var.name
  parent_id           = var.parent_id
  resource_types      = var.resource_types
  retry               = var.retry
  role_assignments    = var.role_assignments
  tags                = var.tags
  timeouts            = var.timeouts
}
