module "lz-vending" {
  source              = "Azure/lz-vending/azurerm"
  version             = "7.0.0"
  location            = var.location
  lock_enabled        = var.lock_enabled
  lock_name           = var.lock_name
  resource_group_name = var.resource_group_name
  subscription_id     = var.subscription_id
  tags                = var.tags
}
