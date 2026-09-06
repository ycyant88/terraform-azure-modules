module "avm-ptn-virtualwan" {
  source                = "Azure/avm-ptn-virtualwan/azurerm"
  version               = "0.14.0"
  expressroute_gateways = var.expressroute_gateways
}
