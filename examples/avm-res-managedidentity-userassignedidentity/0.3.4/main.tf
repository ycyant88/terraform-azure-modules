module "avm-res-managedidentity-userassignedidentity" {
  source              = "Azure/avm-res-managedidentity-userassignedidentity/azurerm"
  version             = "0.3.4"
  enable_telemetry    = var.enable_telemetry
  location            = var.location
  lock                = var.lock
  name                = var.name
  resource_group_name = var.resource_group_name
  tags                = var.tags
}
