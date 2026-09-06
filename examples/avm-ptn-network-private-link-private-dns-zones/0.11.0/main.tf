module "avm-ptn-network-private-link-private-dns-zones" {
  source                                  = "Azure/avm-ptn-network-private-link-private-dns-zones/azurerm"
  version                                 = "0.11.0"
  enable_telemetry                        = var.enable_telemetry
  location                                = var.location
  lock                                    = var.lock
  private_link_private_dns_zones          = var.private_link_private_dns_zones
  resource_group_creation_enabled         = var.resource_group_creation_enabled
  resource_group_name                     = var.resource_group_name
  resource_group_role_assignments         = var.resource_group_role_assignments
  tags                                    = var.tags
  timeouts                                = var.timeouts
  virtual_network_resource_ids_to_link_to = var.virtual_network_resource_ids_to_link_to
}
