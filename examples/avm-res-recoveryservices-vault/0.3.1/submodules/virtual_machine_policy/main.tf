module "avm-res-recoveryservices-vault" {
  source              = "Azure/avm-res-recoveryservices-vault/azurerm"
  version             = "0.3.1"
  recovery_vault_name = var.recovery_vault_name
  resource_group_name = var.resource_group_name
  vm_backup_policy    = var.vm_backup_policy
}
