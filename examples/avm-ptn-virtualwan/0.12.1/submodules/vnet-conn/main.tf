module "avm-ptn-virtualwan" {
  source                      = "Azure/avm-ptn-virtualwan/azurerm"
  version                     = "0.12.1"
  virtual_network_connections = var.virtual_network_connections
}
