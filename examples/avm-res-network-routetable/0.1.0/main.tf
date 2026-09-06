module "avm-res-network-routetable" {
  source                        = "Azure/avm-res-network-routetable/azurerm"
  version                       = "0.1.0"
  disable_bgp_route_propagation = var.disable_bgp_route_propagation
  enable_telemetry              = var.enable_telemetry
  lock                          = var.lock
  name                          = var.name
  resource_group_name           = var.resource_group_name
  role_assignments              = var.role_assignments
  routes                        = var.routes
  subnet_resource_ids           = var.subnet_resource_ids
  tags                          = var.tags
}
