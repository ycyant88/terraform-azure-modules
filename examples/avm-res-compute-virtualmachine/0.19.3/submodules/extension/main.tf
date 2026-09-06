module "avm-res-compute-virtualmachine" {
  source                            = "Azure/avm-res-compute-virtualmachine/azurerm"
  version                           = "0.19.3"
  auto_upgrade_minor_version        = var.auto_upgrade_minor_version
  automatic_upgrade_enabled         = var.automatic_upgrade_enabled
  failure_suppression_enabled       = var.failure_suppression_enabled
  name                              = var.name
  protected_settings                = var.protected_settings
  protected_settings_from_key_vault = var.protected_settings_from_key_vault
  provision_after_extensions        = var.provision_after_extensions
  publisher                         = var.publisher
  settings                          = var.settings
  tags                              = var.tags
  timeouts                          = var.timeouts
  type                              = var.type
  type_handler_version              = var.type_handler_version
  virtualmachine_resource_id        = var.virtualmachine_resource_id
}
