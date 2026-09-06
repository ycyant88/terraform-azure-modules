module "avm-res-storage-storageaccount" {
  source              = "Azure/avm-res-storage-storageaccount/azurerm"
  version             = "0.8.1"
  diagnostic_settings = var.diagnostic_settings
  enable_telemetry    = var.enable_telemetry
  parent_id           = var.parent_id
  retry               = var.retry
  timeouts            = var.timeouts
  tracing_tags_header = var.tracing_tags_header
}
