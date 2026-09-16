module "avm-res-web-site" {
  source              = "Azure/avm-res-web-site/azurerm"
  version             = "0.23.0"
  backup_name         = var.backup_name
  enabled             = var.enabled
  ignore_body_changes = var.ignore_body_changes
  parent_id           = var.parent_id
  resource_types      = var.resource_types
  retry               = var.retry
  schedule            = var.schedule
  storage_account_url = var.storage_account_url
  timeouts            = var.timeouts
}
