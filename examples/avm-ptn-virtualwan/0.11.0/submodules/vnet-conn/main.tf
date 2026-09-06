module "avm-ptn-virtualwan" {
  source                      = "Azure/avm-ptn-virtualwan/azurerm"
  version                     = "0.11.0"
  virtual_network_connections = var.virtual_network_connections
}
