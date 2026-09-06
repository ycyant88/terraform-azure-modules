module "avm-res-network-privatednszone" {
  source    = "Azure/avm-res-network-privatednszone/azurerm"
  version   = "0.4.1"
  cname     = var.cname
  name      = var.name
  parent_id = var.parent_id
  retry     = var.retry
  timeouts  = var.timeouts
  ttl       = var.ttl
}
