module "avm-res-recoveryservices-vault" {
  source                      = "Azure/avm-res-recoveryservices-vault/azurerm"
  version                     = "1.2.0"
  backup_protected_file_share = var.backup_protected_file_share
}
