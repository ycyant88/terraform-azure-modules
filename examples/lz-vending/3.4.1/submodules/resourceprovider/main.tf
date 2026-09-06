module "lz-vending" {
  source            = "Azure/lz-vending/azurerm"
  version           = "3.4.1"
  features          = var.features
  resource_provider = var.resource_provider
  subscription_id   = var.subscription_id
}
