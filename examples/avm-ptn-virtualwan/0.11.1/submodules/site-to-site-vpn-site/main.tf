module "avm-ptn-virtualwan" {
  source    = "Azure/avm-ptn-virtualwan/azurerm"
  version   = "0.11.1"
  vpn_sites = var.vpn_sites
}
