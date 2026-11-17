module "avm-res-web-site" {
  source                  = "Azure/avm-res-web-site/azurerm"
  version                 = "0.25.0"
  app_setting_names       = var.app_setting_names
  connection_string_names = var.connection_string_names
  enable_telemetry        = var.enable_telemetry
  ignore_body_changes     = var.ignore_body_changes
  location                = var.location
  parent_id               = var.parent_id
  resource_types          = var.resource_types
  retry                   = var.retry
  timeouts                = var.timeouts
}
