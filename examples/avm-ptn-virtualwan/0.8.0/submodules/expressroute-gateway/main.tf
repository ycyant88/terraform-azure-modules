module "avm-ptn-virtualwan" {
  source                = "Azure/avm-ptn-virtualwan/azurerm"
  version               = "0.8.0"
  expressroute_gateways = var.expressroute_gateways
}
