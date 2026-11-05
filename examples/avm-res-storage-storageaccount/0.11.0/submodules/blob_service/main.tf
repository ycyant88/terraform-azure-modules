module "avm-res-storage-storageaccount" {
  source             = "Azure/avm-res-storage-storageaccount/azurerm"
  version            = "0.11.0"
  blob_properties    = var.blob_properties
  enable_telemetry   = var.enable_telemetry
  location           = var.location
  resource_type      = var.resource_type
  retry              = var.retry
  storage_account_id = var.storage_account_id
  timeouts           = var.timeouts
}
