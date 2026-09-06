module "avm-ptn-odaa" {
  source                       = "Azure/avm-ptn-odaa/azurerm"
  version                      = "0.1.0"
  cloud_exadata_infrastructure = var.cloud_exadata_infrastructure
  cloud_exadata_vm_cluster     = var.cloud_exadata_vm_cluster
  enable_telemetry             = var.enable_telemetry
  location                     = var.location
  odaa_vnet_peerings           = var.odaa_vnet_peerings
  resource_group_name          = var.resource_group_name
  tags                         = var.tags
  virtual_networks             = var.virtual_networks
}
