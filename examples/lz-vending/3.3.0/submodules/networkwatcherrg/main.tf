module "lz-vending" {
  source                  = "Azure/lz-vending/azurerm"
  version                 = "3.3.0"
  location                = var.location
  network_watcher_rg_name = var.network_watcher_rg_name
  subscription_id         = var.subscription_id
  tags                    = var.tags
}
