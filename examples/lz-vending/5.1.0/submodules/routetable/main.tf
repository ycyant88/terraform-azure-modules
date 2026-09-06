module "lz-vending" {
  source                        = "Azure/lz-vending/azurerm"
  version                       = "5.1.0"
  bgp_route_propagation_enabled = var.bgp_route_propagation_enabled
  location                      = var.location
  name                          = var.name
  resource_group_name           = var.resource_group_name
  routes                        = var.routes
  subscription_id               = var.subscription_id
  tags                          = var.tags
}
