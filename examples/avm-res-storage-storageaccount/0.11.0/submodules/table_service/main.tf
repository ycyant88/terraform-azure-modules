module "avm-res-storage-storageaccount" {
  source                = "Azure/avm-res-storage-storageaccount/azurerm"
  version               = "0.11.0"
  cors_propagation_wait = var.cors_propagation_wait
  enable_telemetry      = var.enable_telemetry
  location              = var.location
  resource_type         = var.resource_type
  retry                 = var.retry
  storage_account_id    = var.storage_account_id
  table_properties      = var.table_properties
  timeouts              = var.timeouts
}
