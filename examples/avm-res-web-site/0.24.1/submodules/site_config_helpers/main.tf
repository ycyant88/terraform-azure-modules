module "avm-res-web-site" {
  source             = "Azure/avm-res-web-site/azurerm"
  version            = "0.24.1"
  is_function_app    = var.is_function_app
  managed_identities = var.managed_identities
  os_type            = var.os_type
  site_config        = var.site_config
}
