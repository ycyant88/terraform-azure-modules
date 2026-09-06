module "avm-res-app-managedenvironment" {
  source           = "Azure/avm-res-app-managedenvironment/azurerm"
  version          = "0.5.0"
  custom_domains   = var.custom_domains
  enable_telemetry = var.enable_telemetry
  name             = var.name
  parent_id        = var.parent_id
  rules            = var.rules
}
