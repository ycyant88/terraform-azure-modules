module "lz-vending" {
  source            = "Azure/lz-vending/azurerm"
  version           = "7.0.0"
  features          = var.features
  resource_provider = var.resource_provider
  subscription_id   = var.subscription_id
}
