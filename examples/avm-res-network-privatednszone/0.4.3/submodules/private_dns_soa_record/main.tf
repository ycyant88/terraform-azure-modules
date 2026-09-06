module "avm-res-network-privatednszone" {
  source       = "Azure/avm-res-network-privatednszone/azurerm"
  version      = "0.4.3"
  email        = var.email
  expire_time  = var.expire_time
  minimum_ttl  = var.minimum_ttl
  name         = var.name
  parent_id    = var.parent_id
  refresh_time = var.refresh_time
  retry        = var.retry
  retry_time   = var.retry_time
  timeouts     = var.timeouts
  ttl          = var.ttl
}
