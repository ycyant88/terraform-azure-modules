module "avm-res-web-site" {
  source     = "Azure/avm-res-web-site/azurerm"
  version    = "0.21.8"
  hostname   = var.hostname
  parent_id  = var.parent_id
  retry      = var.retry
  ssl_state  = var.ssl_state
  thumbprint = var.thumbprint
}
