module "avm-res-compute-hostgroup" {
  source                      = "Azure/avm-res-compute-hostgroup/azurerm"
  version                     = "0.1.0"
  automatic_placement_enabled = var.automatic_placement_enabled
  dedicated_host_group_name   = var.dedicated_host_group_name
  dedicated_hosts             = var.dedicated_hosts
  enable_telemetry            = var.enable_telemetry
  location                    = var.location
  platform_fault_domain_count = var.platform_fault_domain_count
  resource_group_name         = var.resource_group_name
  tags                        = var.tags
  zone                        = var.zone
}
