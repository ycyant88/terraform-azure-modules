module "avm-ptn-virtualwan" {
  source                = "Azure/avm-ptn-virtualwan/azurerm"
  version               = "0.14.1"
  expressroute_gateways = var.expressroute_gateways
}
