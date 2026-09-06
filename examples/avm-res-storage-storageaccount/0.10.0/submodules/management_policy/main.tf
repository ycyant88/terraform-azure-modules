module "avm-res-storage-storageaccount" {
  source              = "Azure/avm-res-storage-storageaccount/azurerm"
  version             = "0.10.0"
  resource_type       = var.resource_type
  retry               = var.retry
  rules               = var.rules
  storage_account_id  = var.storage_account_id
  timeouts            = var.timeouts
  tracing_tags_header = var.tracing_tags_header
}
