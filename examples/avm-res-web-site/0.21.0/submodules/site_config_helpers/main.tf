module "avm-res-web-site" {
  source             = "Azure/avm-res-web-site/azurerm"
  version            = "0.21.0"
  is_logic_app       = var.is_logic_app
  managed_identities = var.managed_identities
  os_type            = var.os_type
  site_config        = var.site_config
}
