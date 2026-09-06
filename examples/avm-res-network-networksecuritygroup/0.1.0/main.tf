module "avm-res-network-networksecuritygroup" {
  source              = "Azure/avm-res-network-networksecuritygroup/azurerm"
  version             = "0.1.0"
  diagnostic_settings = var.diagnostic_settings
  enable_telemetry    = var.enable_telemetry
  location            = var.location
  lock                = var.lock
  name                = var.name
  nsgrules            = var.nsgrules
  resource_group_name = var.resource_group_name
  role_assignments    = var.role_assignments
  tags                = var.tags
}
