module "avm-ptn-virtualwan" {
  source       = "Azure/avm-ptn-virtualwan/azurerm"
  version      = "0.8.0"
  virtual_hubs = var.virtual_hubs
}
