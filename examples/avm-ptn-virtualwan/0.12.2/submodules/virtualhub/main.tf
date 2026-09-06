module "avm-ptn-virtualwan" {
  source       = "Azure/avm-ptn-virtualwan/azurerm"
  version      = "0.12.2"
  virtual_hubs = var.virtual_hubs
}
