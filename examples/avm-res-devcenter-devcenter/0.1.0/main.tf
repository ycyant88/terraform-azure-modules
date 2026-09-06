module "avm-res-devcenter-devcenter" {
  source              = "Azure/avm-res-devcenter-devcenter/azurerm"
  version             = "0.1.0"
  dev_center_identity = var.dev_center_identity
  dev_center_name     = var.dev_center_name
  dev_center_timeouts = var.dev_center_timeouts
  diagnostic_settings = var.diagnostic_settings
  enable_telemetry    = var.enable_telemetry
  location            = var.location
  lock                = var.lock
  resource_group_name = var.resource_group_name
  role_assignments    = var.role_assignments
  tags                = var.tags
}
