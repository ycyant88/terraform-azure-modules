module "avm-res-web-site" {
  source     = "Azure/avm-res-web-site/azurerm"
  version    = "0.21.7"
  hostname   = var.hostname
  parent_id  = var.parent_id
  ssl_state  = var.ssl_state
  thumbprint = var.thumbprint
}
