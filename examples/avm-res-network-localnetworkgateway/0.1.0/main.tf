module "avm-res-network-localnetworkgateway" {
  source               = "Azure/avm-res-network-localnetworkgateway/azurerm"
  version              = "0.1.0"
  address_space        = var.address_space
  bgp_settings         = var.bgp_settings
  customer_managed_key = var.customer_managed_key
  enable_telemetry     = var.enable_telemetry
  gateway_address      = var.gateway_address
  location             = var.location
  lock                 = var.lock
  managed_identities   = var.managed_identities
  name                 = var.name
  resource_group_name  = var.resource_group_name
  role_assignments     = var.role_assignments
  tags                 = var.tags
}
