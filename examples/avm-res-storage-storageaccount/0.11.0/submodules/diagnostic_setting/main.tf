module "avm-res-storage-storageaccount" {
  source              = "Azure/avm-res-storage-storageaccount/azurerm"
  version             = "0.11.0"
  diagnostic_settings = var.diagnostic_settings
  enable_telemetry    = var.enable_telemetry
  location            = var.location
  parent_id           = var.parent_id
  retry               = var.retry
  timeouts            = var.timeouts
}
