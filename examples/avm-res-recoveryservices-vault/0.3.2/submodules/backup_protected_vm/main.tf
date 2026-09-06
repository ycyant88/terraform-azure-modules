module "avm-res-recoveryservices-vault" {
  source              = "Azure/avm-res-recoveryservices-vault/azurerm"
  version             = "0.3.2"
  backup_protected_vm = var.backup_protected_vm
}
