module "avm-res-network-networksecuritygroup" {
  source              = "Azure/avm-res-network-networksecuritygroup/azurerm"
  version             = "0.3.0"
  diagnostic_settings = var.diagnostic_settings
  enable_telemetry    = var.enable_telemetry
  location            = var.location
  lock                = var.lock
  name                = var.name
  resource_group_name = var.resource_group_name
  role_assignments    = var.role_assignments
  security_rules      = var.security_rules
  tags                = var.tags
  timeouts            = var.timeouts
}
