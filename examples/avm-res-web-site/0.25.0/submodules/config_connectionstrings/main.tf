module "avm-res-web-site" {
  source              = "Azure/avm-res-web-site/azurerm"
  version             = "0.25.0"
  connection_strings  = var.connection_strings
  enable_telemetry    = var.enable_telemetry
  ignore_body_changes = var.ignore_body_changes
  is_slot             = var.is_slot
  location            = var.location
  parent_id           = var.parent_id
  resource_types      = var.resource_types
  retry               = var.retry
  timeouts            = var.timeouts
}
