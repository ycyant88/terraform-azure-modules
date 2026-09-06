module "avm-res-storage-storageaccount" {
  source              = "Azure/avm-res-storage-storageaccount/azurerm"
  version             = "0.8.1"
  error_404_document  = var.error_404_document
  index_document      = var.index_document
  resource_type       = var.resource_type
  retry               = var.retry
  storage_account_id  = var.storage_account_id
  timeouts            = var.timeouts
  tracing_tags_header = var.tracing_tags_header
}
