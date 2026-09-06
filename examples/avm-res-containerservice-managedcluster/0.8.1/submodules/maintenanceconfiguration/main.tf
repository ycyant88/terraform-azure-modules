module "avm-res-containerservice-managedcluster" {
  source             = "Azure/avm-res-containerservice-managedcluster/azurerm"
  version            = "0.8.1"
  maintenance_window = var.maintenance_window
  name               = var.name
  not_allowed_time   = var.not_allowed_time
  parent_id          = var.parent_id
  time_in_week       = var.time_in_week
}
