module "avm-res-recoveryservices-vault" {
  source                      = "Azure/avm-res-recoveryservices-vault/azurerm"
  version                     = "1.3.2"
  backup_protected_file_share = var.backup_protected_file_share
  ignore_body_changes         = var.ignore_body_changes
  parent_id                   = var.parent_id
  resource_types              = var.resource_types
  retry                       = var.retry
  timeouts                    = var.timeouts
}
