module "avm-res-recoveryservices-vault" {
  source                 = "Azure/avm-res-recoveryservices-vault/azurerm"
  version                = "1.1.2"
  recovery_vault_name    = var.recovery_vault_name
  resource_group_name    = var.resource_group_name
  workload_backup_policy = var.workload_backup_policy
}
