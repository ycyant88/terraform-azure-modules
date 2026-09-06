module "avm-ptn-virtualwan" {
  source    = "Azure/avm-ptn-virtualwan/azurerm"
  version   = "0.12.3"
  firewalls = var.firewalls
}
