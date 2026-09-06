module "avm-res-oracledatabase-cloudexadatainfrastructure" {
  source                               = "Azure/avm-res-oracledatabase-cloudexadatainfrastructure/azurerm"
  version                              = "0.1.0"
  compute_count                        = var.compute_count
  display_name                         = var.display_name
  enable_telemetry                     = var.enable_telemetry
  location                             = var.location
  maintenance_window_leadtime_in_weeks = var.maintenance_window_leadtime_in_weeks
  maintenance_window_patching_mode     = var.maintenance_window_patching_mode
  maintenance_window_preference        = var.maintenance_window_preference
  name                                 = var.name
  resource_group_id                    = var.resource_group_id
  role_assignments                     = var.role_assignments
  shape                                = var.shape
  storage_count                        = var.storage_count
  tags                                 = var.tags
  zone                                 = var.zone
}
