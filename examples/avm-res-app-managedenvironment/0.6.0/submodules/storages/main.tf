module "avm-res-app-managedenvironment" {
  source              = "Azure/avm-res-app-managedenvironment/azurerm"
  version             = "0.6.0"
  account_key         = var.account_key
  account_key_version = var.account_key_version
  azure_file          = var.azure_file
  enable_telemetry    = var.enable_telemetry
  ignore_body_changes = var.ignore_body_changes
  location            = var.location
  name                = var.name
  nfs_azure_file      = var.nfs_azure_file
  parent_id           = var.parent_id
  resource_types      = var.resource_types
  retry               = var.retry
  timeouts            = var.timeouts
}
