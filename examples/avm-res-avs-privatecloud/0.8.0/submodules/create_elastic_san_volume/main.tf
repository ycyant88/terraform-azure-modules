module "avm-res-avs-privatecloud" {
  source                    = "Azure/avm-res-avs-privatecloud/azurerm"
  version                   = "0.8.0"
  base_size_in_tib          = var.base_size_in_tib
  elastic_san_name          = var.elastic_san_name
  elastic_san_volume_groups = var.elastic_san_volume_groups
  extended_size_in_tib      = var.extended_size_in_tib
  location                  = var.location
  public_network_access     = var.public_network_access
  resource_group_id         = var.resource_group_id
  sku                       = var.sku
  tags                      = var.tags
  zones                     = var.zones
}
