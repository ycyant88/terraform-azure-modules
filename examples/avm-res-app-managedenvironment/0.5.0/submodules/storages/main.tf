module "avm-res-app-managedenvironment" {
  source              = "Azure/avm-res-app-managedenvironment/azurerm"
  version             = "0.5.0"
  account_key         = var.account_key
  account_key_version = var.account_key_version
  azure_file          = var.azure_file
  enable_telemetry    = var.enable_telemetry
  name                = var.name
  nfs_azure_file      = var.nfs_azure_file
  parent_id           = var.parent_id
}
