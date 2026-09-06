module "avm-ptn-odaa" {
  source                        = "Azure/avm-ptn-odaa/azurerm"
  version                       = "0.1.0"
  primary_vnet_name             = var.primary_vnet_name
  primary_vnet_resource_group   = var.primary_vnet_resource_group
  secondary_vnet_name           = var.secondary_vnet_name
  secondary_vnet_resource_group = var.secondary_vnet_resource_group
}
