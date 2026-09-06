module "avm-res-app-managedenvironment" {
  source                      = "Azure/avm-res-app-managedenvironment/azurerm"
  version                     = "0.5.0"
  component_type              = var.component_type
  configurations              = var.configurations
  enable_telemetry            = var.enable_telemetry
  ingress                     = var.ingress
  name                        = var.name
  parent_id                   = var.parent_id
  scale                       = var.scale
  service_binds               = var.service_binds
  spring_cloud_gateway_routes = var.spring_cloud_gateway_routes
}
