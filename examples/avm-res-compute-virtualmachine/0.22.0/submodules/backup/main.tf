module "avm-res-compute-virtualmachine" {
  source                        = "Azure/avm-res-compute-virtualmachine/azurerm"
  version                       = "0.22.0"
  backup_policy_resource_id     = var.backup_policy_resource_id
  enable_telemetry              = var.enable_telemetry
  exclude_disk_luns             = var.exclude_disk_luns
  ignore_body_changes           = var.ignore_body_changes
  include_disk_luns             = var.include_disk_luns
  location                      = var.location
  recovery_vault_resource_id    = var.recovery_vault_resource_id
  resource_group_name           = var.resource_group_name
  resource_types                = var.resource_types
  retain_backup_data_on_destroy = var.retain_backup_data_on_destroy
  retry                         = var.retry
  timeouts                      = var.timeouts
  virtual_machine_name          = var.virtual_machine_name
  virtualmachine_resource_id    = var.virtualmachine_resource_id
}
