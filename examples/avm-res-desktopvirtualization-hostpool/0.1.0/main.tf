module "avm-res-desktopvirtualization-hostpool" {
  source              = "Azure/avm-res-desktopvirtualization-hostpool/azurerm"
  version             = "0.1.0"
  enable_telemetry    = var.enable_telemetry
  resource_group_name = var.resource_group_name
}
