module "avm-ptn-hubnetworking" {
  source               = "Azure/avm-ptn-hubnetworking/azurerm"
  version              = "0.1.0"
  enable_telemetry     = var.enable_telemetry
  hub_virtual_networks = var.hub_virtual_networks
}
