module "avm-res-app-containerapp" {
  source                    = "Azure/avm-res-app-containerapp/azurerm"
  version                   = "0.10.0"
  container_app_resource_id = var.container_app_resource_id
  enable_telemetry          = var.enable_telemetry
  encryption_settings       = var.encryption_settings
  global_validation         = var.global_validation
  http_settings             = var.http_settings
  identity_providers        = var.identity_providers
  location                  = var.location
  login                     = var.login
  name                      = var.name
  platform                  = var.platform
  retry                     = var.retry
  timeouts                  = var.timeouts
}
