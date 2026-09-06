module "avm-ptn-virtualwan" {
  source              = "Azure/avm-ptn-virtualwan/azurerm"
  version             = "0.14.0"
  diagnostic_settings = var.diagnostic_settings
  firewalls           = var.firewalls
}
