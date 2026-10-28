module "avm-res-recoveryservices-vault" {
  source              = "Azure/avm-res-recoveryservices-vault/azurerm"
  version             = "1.4.0"
  backup_protected_vm = var.backup_protected_vm
  enable_telemetry    = var.enable_telemetry
  ignore_body_changes = var.ignore_body_changes
  location            = var.location
  parent_id           = var.parent_id
  resource_types      = var.resource_types
  retry               = var.retry
  timeouts            = var.timeouts
}
