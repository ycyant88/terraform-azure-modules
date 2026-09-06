module "avm-res-app-managedenvironment" {
  source            = "Azure/avm-res-app-managedenvironment/azurerm"
  version           = "0.5.0"
  enable_telemetry  = var.enable_telemetry
  name              = var.name
  parent_id         = var.parent_id
  scheduled_entries = var.scheduled_entries
}
