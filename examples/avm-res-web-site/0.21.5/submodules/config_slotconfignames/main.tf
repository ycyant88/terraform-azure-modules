module "avm-res-web-site" {
  source                  = "Azure/avm-res-web-site/azurerm"
  version                 = "0.21.5"
  app_setting_names       = var.app_setting_names
  connection_string_names = var.connection_string_names
  parent_id               = var.parent_id
}
