module "avm-res-recoveryservices-vault" {
  source              = "Azure/avm-res-recoveryservices-vault/azurerm"
  version             = "0.2.1"
  backup_protected_vm = var.backup_protected_vm
}
