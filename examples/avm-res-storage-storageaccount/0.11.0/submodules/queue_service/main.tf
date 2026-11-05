module "avm-res-storage-storageaccount" {
  source             = "Azure/avm-res-storage-storageaccount/azurerm"
  version            = "0.11.0"
  enable_telemetry   = var.enable_telemetry
  location           = var.location
  queue_properties   = var.queue_properties
  resource_type      = var.resource_type
  retry              = var.retry
  storage_account_id = var.storage_account_id
  timeouts           = var.timeouts
}
