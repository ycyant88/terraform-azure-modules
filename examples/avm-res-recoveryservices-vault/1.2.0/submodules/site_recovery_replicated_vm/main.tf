module "avm-res-recoveryservices-vault" {
  source                      = "Azure/avm-res-recoveryservices-vault/azurerm"
  version                     = "1.2.0"
  site_recovery_replicated_vm = var.site_recovery_replicated_vm
}
