module "avm-res-compute-gallery" {
  source                                  = "Azure/avm-res-compute-gallery/azurerm"
  version                                 = "0.1.0"
  customer_managed_key                    = var.customer_managed_key
  diagnostic_settings                     = var.diagnostic_settings
  enable_telemetry                        = var.enable_telemetry
  location                                = var.location
  lock                                    = var.lock
  managed_identities                      = var.managed_identities
  name                                    = var.name
  private_endpoints                       = var.private_endpoints
  private_endpoints_manage_dns_zone_group = var.private_endpoints_manage_dns_zone_group
  resource_group_name                     = var.resource_group_name
  role_assignments                        = var.role_assignments
  tags                                    = var.tags
}
