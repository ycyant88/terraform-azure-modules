module "avm-res-web-site" {
  source              = "Azure/avm-res-web-site/azurerm"
  version             = "0.25.0"
  enable_telemetry    = var.enable_telemetry
  hostname            = var.hostname
  ignore_body_changes = var.ignore_body_changes
  location            = var.location
  parent_id           = var.parent_id
  resource_types      = var.resource_types
  retry               = var.retry
  ssl_state           = var.ssl_state
  thumbprint          = var.thumbprint
  timeouts            = var.timeouts
}
