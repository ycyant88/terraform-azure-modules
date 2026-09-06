module "avm-res-network-privatednszone" {
  source                                 = "Azure/avm-res-network-privatednszone/azurerm"
  version                                = "0.5.0"
  name                                   = var.name
  parent_id                              = var.parent_id
  private_dns_zone_supports_private_link = var.private_dns_zone_supports_private_link
  registration_enabled                   = var.registration_enabled
  resolution_policy                      = var.resolution_policy
  retry                                  = var.retry
  tags                                   = var.tags
  timeouts                               = var.timeouts
  virtual_network_id                     = var.virtual_network_id
}
