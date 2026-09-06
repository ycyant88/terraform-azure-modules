module "avm-res-storage-storageaccount" {
  source               = "Azure/avm-res-storage-storageaccount/azurerm"
  version              = "0.7.2"
  home_directory       = var.home_directory
  name                 = var.name
  permission_scope     = var.permission_scope
  resource_type        = var.resource_type
  retry                = var.retry
  ssh_authorized_key   = var.ssh_authorized_key
  ssh_key_enabled      = var.ssh_key_enabled
  ssh_password_enabled = var.ssh_password_enabled
  storage_account_id   = var.storage_account_id
  timeouts             = var.timeouts
  tracing_tags_header  = var.tracing_tags_header
}
