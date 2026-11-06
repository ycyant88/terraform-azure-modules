module "avm-ptn-odaa" {
  source                        = "Azure/avm-ptn-odaa/azurerm"
  version                       = "0.2.0"
  enable_telemetry              = var.enable_telemetry
  location                      = var.location
  primary_vnet_name             = var.primary_vnet_name
  primary_vnet_resource_group   = var.primary_vnet_resource_group
  secondary_vnet_name           = var.secondary_vnet_name
  secondary_vnet_resource_group = var.secondary_vnet_resource_group
}
