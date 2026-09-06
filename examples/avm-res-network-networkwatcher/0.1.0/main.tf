module "avm-res-network-networkwatcher" {
  source                              = "Azure/avm-res-network-networkwatcher/azurerm"
  version                             = "0.1.0"
  condition_monitor                   = var.condition_monitor
  enable_telemetry                    = var.enable_telemetry
  flow_logs                           = var.flow_logs
  location                            = var.location
  lock                                = var.lock
  network_watcher_id                  = var.network_watcher_id
  network_watcher_name                = var.network_watcher_name
  network_watcher_resource_group_name = var.network_watcher_resource_group_name
  resource_group_name                 = var.resource_group_name
  role_assignments                    = var.role_assignments
  tags                                = var.tags
}
