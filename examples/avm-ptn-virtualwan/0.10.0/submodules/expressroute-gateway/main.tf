module "avm-ptn-virtualwan" {
  source                = "Azure/avm-ptn-virtualwan/azurerm"
  version               = "0.10.0"
  expressroute_gateways = var.expressroute_gateways
}
