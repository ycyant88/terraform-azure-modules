module "avm-res-app-managedenvironment" {
  source           = "Azure/avm-res-app-managedenvironment/azurerm"
  version          = "0.5.0"
  component_type   = var.component_type
  configurations   = var.configurations
  enable_telemetry = var.enable_telemetry
  name             = var.name
  parent_id        = var.parent_id
  service_binds    = var.service_binds
}
