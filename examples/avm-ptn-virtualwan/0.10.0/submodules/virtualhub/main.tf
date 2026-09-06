module "avm-ptn-virtualwan" {
  source       = "Azure/avm-ptn-virtualwan/azurerm"
  version      = "0.10.0"
  virtual_hubs = var.virtual_hubs
}
