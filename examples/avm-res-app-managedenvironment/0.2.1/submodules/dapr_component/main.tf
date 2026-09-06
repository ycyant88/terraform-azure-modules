module "avm-res-app-managedenvironment" {
  source                 = "Azure/avm-res-app-managedenvironment/azurerm"
  version                = "0.2.1"
  component_type         = var.component_type
  dapr_component_version = var.dapr_component_version
  ignore_errors          = var.ignore_errors
  init_timeout           = var.init_timeout
  managed_environment    = var.managed_environment
  metadata               = var.metadata
  name                   = var.name
  scopes                 = var.scopes
  secret                 = var.secret
  secret_store_component = var.secret_store_component
  timeouts               = var.timeouts
}
