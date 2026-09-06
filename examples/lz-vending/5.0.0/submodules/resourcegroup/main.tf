module "lz-vending" {
  source              = "Azure/lz-vending/azurerm"
  version             = "5.0.0"
  location            = var.location
  resource_group_name = var.resource_group_name
  subscription_id     = var.subscription_id
  tags                = var.tags
}
