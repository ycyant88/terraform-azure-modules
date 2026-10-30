module "avm-res-containerregistry-registry" {
  source           = "Azure/avm-res-containerregistry-registry/azurerm"
  version          = "0.9.0"
  auth_credentials = var.auth_credentials
  enable_telemetry = var.enable_telemetry
  location         = var.location
  login_server     = var.login_server
  name             = var.name
  parent_id        = var.parent_id
  resource_types   = var.resource_types
  retry            = var.retry
  timeouts         = var.timeouts
}
