module "avm-ptn-virtualwan" {
  source                = "Azure/avm-ptn-virtualwan/azurerm"
  version               = "0.11.1"
  expressroute_gateways = var.expressroute_gateways
}
