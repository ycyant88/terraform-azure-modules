module "avm-ptn-virtualwan" {
  source       = "Azure/avm-ptn-virtualwan/azurerm"
  version      = "0.12.4"
  vpn_gateways = var.vpn_gateways
}
