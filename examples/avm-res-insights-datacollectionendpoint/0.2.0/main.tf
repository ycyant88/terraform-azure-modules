module "avm-res-insights-datacollectionendpoint" {
  source                = "Azure/avm-res-insights-datacollectionendpoint/azurerm"
  version               = "0.2.0"
  description           = var.description
  diagnostic_settings   = var.diagnostic_settings
  enable_telemetry      = var.enable_telemetry
  kind                  = var.kind
  location              = var.location
  lock                  = var.lock
  managed_identities    = var.managed_identities
  name                  = var.name
  parent_id             = var.parent_id
  public_network_access = var.public_network_access
  role_assignments      = var.role_assignments
  sku                   = var.sku
  tags                  = var.tags
}
