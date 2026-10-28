module "avm-res-recoveryservices-vault" {
  source              = "Azure/avm-res-recoveryservices-vault/azurerm"
  version             = "1.4.0"
  enable_telemetry    = var.enable_telemetry
  ignore_body_changes = var.ignore_body_changes
  location            = var.location
  recovery_vault_name = var.recovery_vault_name
  resource_group_name = var.resource_group_name
  resource_types      = var.resource_types
  retry               = var.retry
  tags                = var.tags
  timeouts            = var.timeouts
  vm_backup_policy    = var.vm_backup_policy
}
