module "avm-res-network-privatednszone" {
  source       = "Azure/avm-res-network-privatednszone/azurerm"
  version      = "0.4.4"
  ip_addresses = var.ip_addresses
  name         = var.name
  parent_id    = var.parent_id
  retry        = var.retry
  timeouts     = var.timeouts
  ttl          = var.ttl
}
