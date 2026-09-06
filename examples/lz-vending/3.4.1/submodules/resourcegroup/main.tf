module "lz-vending" {
  source              = "Azure/lz-vending/azurerm"
  version             = "3.4.1"
  location            = var.location
  resource_group_name = var.resource_group_name
  subscription_id     = var.subscription_id
  tags                = var.tags
}
