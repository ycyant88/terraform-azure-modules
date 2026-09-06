module "avm-ptn-virtualwan" {
  source       = "Azure/avm-ptn-virtualwan/azurerm"
  version      = "0.14.0"
  vpn_gateways = var.vpn_gateways
}
