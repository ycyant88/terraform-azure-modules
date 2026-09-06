module "avm-res-web-site" {
  source             = "Azure/avm-res-web-site/azurerm"
  version            = "0.22.0"
  managed_identities = var.managed_identities
  os_type            = var.os_type
  site_config        = var.site_config
}
