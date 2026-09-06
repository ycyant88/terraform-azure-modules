module "avm-res-network-ddosprotectionplan" {
  source              = "Azure/avm-res-network-ddosprotectionplan/azurerm"
  version             = "0.1.0"
  diagnostic_settings = var.diagnostic_settings
  enable_telemetry    = var.enable_telemetry
  location            = var.location
  lock                = var.lock
  name                = var.name
  resource_group_name = var.resource_group_name
  role_assignments    = var.role_assignments
  tags                = var.tags
}
