module "avm-ptn-virtualwan" {
  source              = "Azure/avm-ptn-virtualwan/azurerm"
  version             = "0.12.3"
  vpn_site_connection = var.vpn_site_connection
}
