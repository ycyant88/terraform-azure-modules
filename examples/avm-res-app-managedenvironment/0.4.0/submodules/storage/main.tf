module "avm-res-app-managedenvironment" {
  source              = "Azure/avm-res-app-managedenvironment/azurerm"
  version             = "0.4.0"
  access_key          = var.access_key
  access_mode         = var.access_mode
  account_name        = var.account_name
  managed_environment = var.managed_environment
  name                = var.name
  share_name          = var.share_name
  timeouts            = var.timeouts
}
