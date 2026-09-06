module "lz-vending" {
  source           = "Azure/lz-vending/azurerm"
  version          = "7.0.1"
  enable_telemetry = var.enable_telemetry
  location         = var.location
  subscription_id  = var.subscription_id
  virtual_networks = var.virtual_networks
}
