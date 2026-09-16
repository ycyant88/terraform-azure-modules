module "avm-res-web-site" {
  source              = "Azure/avm-res-web-site/azurerm"
  version             = "0.23.0"
  allow               = var.allow
  ignore_body_changes = var.ignore_body_changes
  is_slot             = var.is_slot
  name                = var.name
  parent_id           = var.parent_id
  resource_types      = var.resource_types
  retry               = var.retry
  timeouts            = var.timeouts
}
