module "avm-res-recoveryservices-vault" {
  source                    = "Azure/avm-res-recoveryservices-vault/azurerm"
  version                   = "1.4.0"
  backup_protected_workload = var.backup_protected_workload
  enable_telemetry          = var.enable_telemetry
  ignore_body_changes       = var.ignore_body_changes
  location                  = var.location
  resource_types            = var.resource_types
  retry                     = var.retry
  timeouts                  = var.timeouts
}
