module "avm-res-web-site" {
  source    = "Azure/avm-res-web-site/azurerm"
  version   = "0.21.6"
  allow     = var.allow
  is_slot   = var.is_slot
  name      = var.name
  parent_id = var.parent_id
}
