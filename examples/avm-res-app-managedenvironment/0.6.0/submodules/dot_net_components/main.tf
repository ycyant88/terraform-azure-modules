module "avm-res-app-managedenvironment" {
  source              = "Azure/avm-res-app-managedenvironment/azurerm"
  version             = "0.6.0"
  component_type      = var.component_type
  configurations      = var.configurations
  enable_telemetry    = var.enable_telemetry
  ignore_body_changes = var.ignore_body_changes
  location            = var.location
  name                = var.name
  parent_id           = var.parent_id
  resource_types      = var.resource_types
  retry               = var.retry
  service_binds       = var.service_binds
  timeouts            = var.timeouts
}
