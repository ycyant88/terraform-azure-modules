module "avm-res-recoveryservices-vault" {
  source                   = "Azure/avm-res-recoveryservices-vault/azurerm"
  version                  = "1.1.10"
  file_share_backup_policy = var.file_share_backup_policy
  recovery_vault_name      = var.recovery_vault_name
  resource_group_name      = var.resource_group_name
}
