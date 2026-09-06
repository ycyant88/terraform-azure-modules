module "avm-res-network-networkmanager" {
  source                         = "Azure/avm-res-network-networkmanager/azurerm"
  version                        = "0.2.0"
  diagnostic_settings            = var.diagnostic_settings
  enable_telemetry               = var.enable_telemetry
  location                       = var.location
  lock                           = var.lock
  name                           = var.name
  network_manager_description    = var.network_manager_description
  network_manager_network_groups = var.network_manager_network_groups
  network_manager_scope          = var.network_manager_scope
  network_manager_scope_accesses = var.network_manager_scope_accesses
  network_manager_timeouts       = var.network_manager_timeouts
  resource_group_name            = var.resource_group_name
  role_assignments               = var.role_assignments
  tags                           = var.tags
}
