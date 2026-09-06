module "avm-res-web-site" {
  source              = "Azure/avm-res-web-site/azurerm"
  version             = "0.21.8"
  backup_name         = var.backup_name
  enabled             = var.enabled
  parent_id           = var.parent_id
  retry               = var.retry
  schedule            = var.schedule
  storage_account_url = var.storage_account_url
}
