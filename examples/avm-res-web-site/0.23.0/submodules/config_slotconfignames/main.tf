module "avm-res-web-site" {
  source                  = "Azure/avm-res-web-site/azurerm"
  version                 = "0.23.0"
  app_setting_names       = var.app_setting_names
  connection_string_names = var.connection_string_names
  ignore_body_changes     = var.ignore_body_changes
  parent_id               = var.parent_id
  resource_types          = var.resource_types
  retry                   = var.retry
  timeouts                = var.timeouts
}
