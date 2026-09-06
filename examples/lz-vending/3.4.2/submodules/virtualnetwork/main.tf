module "lz-vending" {
  source           = "Azure/lz-vending/azurerm"
  version          = "3.4.2"
  location         = var.location
  subscription_id  = var.subscription_id
  virtual_networks = var.virtual_networks
}
