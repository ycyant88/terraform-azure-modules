module "avm-res-app-managedenvironment" {
  source              = "Azure/avm-res-app-managedenvironment/azurerm"
  version             = "0.6.0"
  custom_domains      = var.custom_domains
  enable_telemetry    = var.enable_telemetry
  ignore_body_changes = var.ignore_body_changes
  location            = var.location
  name                = var.name
  parent_id           = var.parent_id
  resource_types      = var.resource_types
  retry               = var.retry
  rules               = var.rules
  timeouts            = var.timeouts
}
