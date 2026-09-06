module "avm-ptn-virtualwan" {
  source    = "Azure/avm-ptn-virtualwan/azurerm"
  version   = "0.7.0"
  vpn_sites = var.vpn_sites
}
