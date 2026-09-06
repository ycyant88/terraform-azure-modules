module "avm-ptn-virtualwan" {
  source       = "Azure/avm-ptn-virtualwan/azurerm"
  version      = "0.14.1"
  vpn_gateways = var.vpn_gateways
}
