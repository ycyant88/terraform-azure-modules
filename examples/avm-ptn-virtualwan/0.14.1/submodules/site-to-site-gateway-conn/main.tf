module "avm-ptn-virtualwan" {
  source              = "Azure/avm-ptn-virtualwan/azurerm"
  version             = "0.14.1"
  vpn_site_connection = var.vpn_site_connection
}
