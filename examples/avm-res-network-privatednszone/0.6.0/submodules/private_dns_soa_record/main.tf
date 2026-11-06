module "avm-res-network-privatednszone" {
  source           = "Azure/avm-res-network-privatednszone/azurerm"
  version          = "0.6.0"
  email            = var.email
  enable_telemetry = var.enable_telemetry
  expire_time      = var.expire_time
  location         = var.location
  minimum_ttl      = var.minimum_ttl
  name             = var.name
  parent_id        = var.parent_id
  refresh_time     = var.refresh_time
  retry            = var.retry
  retry_time       = var.retry_time
  timeouts         = var.timeouts
  ttl              = var.ttl
}
