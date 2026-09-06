module "avm-res-app-managedenvironment" {
  source               = "Azure/avm-res-app-managedenvironment/azurerm"
  version              = "0.4.0"
  certificate_password = var.certificate_password
  certificate_value    = var.certificate_value
  key_vault_identity   = var.key_vault_identity
  key_vault_url        = var.key_vault_url
  location             = var.location
  managed_environment  = var.managed_environment
  name                 = var.name
  tags                 = var.tags
  timeouts             = var.timeouts
}
