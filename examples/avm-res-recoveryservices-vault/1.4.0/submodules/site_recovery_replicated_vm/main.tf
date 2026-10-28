module "avm-res-recoveryservices-vault" {
  source                      = "Azure/avm-res-recoveryservices-vault/azurerm"
  version                     = "1.4.0"
  enable_telemetry            = var.enable_telemetry
  ignore_body_changes         = var.ignore_body_changes
  location                    = var.location
  parent_id                   = var.parent_id
  resource_types              = var.resource_types
  retry                       = var.retry
  site_recovery_replicated_vm = var.site_recovery_replicated_vm
  timeouts                    = var.timeouts
}
