module "avm-res-network-privatednszone" {
  source       = "Azure/avm-res-network-privatednszone/azurerm"
  version      = "0.5.0"
  domain_names = var.domain_names
  name         = var.name
  parent_id    = var.parent_id
  retry        = var.retry
  timeouts     = var.timeouts
  ttl          = var.ttl
}
