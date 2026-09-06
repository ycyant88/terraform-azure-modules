module "lz-vending" {
  source                        = "Azure/lz-vending/azurerm"
  version                       = "6.0.1"
  bgp_route_propagation_enabled = var.bgp_route_propagation_enabled
  location                      = var.location
  name                          = var.name
  parent_id                     = var.parent_id
  routes                        = var.routes
  tags                          = var.tags
}
