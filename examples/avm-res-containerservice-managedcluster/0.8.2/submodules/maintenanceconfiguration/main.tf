module "avm-res-containerservice-managedcluster" {
  source              = "Azure/avm-res-containerservice-managedcluster/azurerm"
  version             = "0.8.2"
  ignore_body_changes = var.ignore_body_changes
  maintenance_window  = var.maintenance_window
  name                = var.name
  not_allowed_time    = var.not_allowed_time
  parent_id           = var.parent_id
  resource_types      = var.resource_types
  retry               = var.retry
  time_in_week        = var.time_in_week
  timeouts            = var.timeouts
}
