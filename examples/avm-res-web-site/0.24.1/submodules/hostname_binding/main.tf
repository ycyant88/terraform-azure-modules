module "avm-res-web-site" {
  source              = "Azure/avm-res-web-site/azurerm"
  version             = "0.24.1"
  hostname            = var.hostname
  ignore_body_changes = var.ignore_body_changes
  parent_id           = var.parent_id
  resource_types      = var.resource_types
  retry               = var.retry
  ssl_state           = var.ssl_state
  thumbprint          = var.thumbprint
  timeouts            = var.timeouts
}
