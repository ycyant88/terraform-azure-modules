module "avm-res-avs-privatecloud" {
  source                  = "Azure/avm-res-avs-privatecloud/azurerm"
  version                 = "0.12.0"
  anf_account_name        = var.anf_account_name
  anf_nfs_allowed_clients = var.anf_nfs_allowed_clients
  anf_pool_name           = var.anf_pool_name
  anf_pool_size           = var.anf_pool_size
  anf_subnet_resource_id  = var.anf_subnet_resource_id
  anf_volume_name         = var.anf_volume_name
  anf_volume_size         = var.anf_volume_size
  anf_zone_number         = var.anf_zone_number
  resource_group_location = var.resource_group_location
  resource_group_name     = var.resource_group_name
  tags                    = var.tags
}
