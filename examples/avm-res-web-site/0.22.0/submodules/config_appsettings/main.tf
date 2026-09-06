module "avm-res-web-site" {
  source       = "Azure/avm-res-web-site/azurerm"
  version      = "0.22.0"
  app_settings = var.app_settings
  is_slot      = var.is_slot
  parent_id    = var.parent_id
  retry        = var.retry
}
