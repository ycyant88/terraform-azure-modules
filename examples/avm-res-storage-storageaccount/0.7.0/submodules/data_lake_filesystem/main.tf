module "avm-res-storage-storageaccount" {
  source                   = "Azure/avm-res-storage-storageaccount/azurerm"
  version                  = "0.7.0"
  default_encryption_scope = var.default_encryption_scope
  metadata                 = var.metadata
  name                     = var.name
  resource_type            = var.resource_type
  retry                    = var.retry
  storage_account_id       = var.storage_account_id
  timeouts                 = var.timeouts
  tracing_tags_header      = var.tracing_tags_header
}
