module "avm-res-web-site" {
  source    = "Azure/avm-res-web-site/azurerm"
  version   = "0.22.0"
  is_slot   = var.is_slot
  metadata  = var.metadata
  parent_id = var.parent_id
  retry     = var.retry
}
