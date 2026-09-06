module "avm-res-recoveryservices-vault" {
  source              = "Azure/avm-res-recoveryservices-vault/azurerm"
  version             = "1.1.11"
  backup_protected_vm = var.backup_protected_vm
}
