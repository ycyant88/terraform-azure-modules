module "avm-ptn-virtualwan" {
  source       = "Azure/avm-ptn-virtualwan/azurerm"
  version      = "0.13.0"
  vpn_gateways = var.vpn_gateways
}
