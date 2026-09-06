module "avm-res-web-site" {
  source                  = "Azure/avm-res-web-site/azurerm"
  version                 = "0.21.7"
  is_slot                 = var.is_slot
  parent_id               = var.parent_id
  storage_shares_to_mount = var.storage_shares_to_mount
}
