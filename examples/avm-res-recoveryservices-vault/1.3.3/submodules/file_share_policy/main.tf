module "avm-res-recoveryservices-vault" {
  source                   = "Azure/avm-res-recoveryservices-vault/azurerm"
  version                  = "1.3.3"
  file_share_backup_policy = var.file_share_backup_policy
  ignore_body_changes      = var.ignore_body_changes
  recovery_vault_name      = var.recovery_vault_name
  resource_group_name      = var.resource_group_name
  resource_types           = var.resource_types
  retry                    = var.retry
  tags                     = var.tags
  timeouts                 = var.timeouts
}
