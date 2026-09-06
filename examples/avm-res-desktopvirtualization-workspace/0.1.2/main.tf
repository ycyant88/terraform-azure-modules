module "avm-res-desktopvirtualization-workspace" {
  source                        = "Azure/avm-res-desktopvirtualization-workspace/azurerm"
  version                       = "0.1.2"
  description                   = var.description
  diagnostic_settings           = var.diagnostic_settings
  enable_telemetry              = var.enable_telemetry
  location                      = var.location
  lock                          = var.lock
  name                          = var.name
  private_endpoints             = var.private_endpoints
  public_network_access_enabled = var.public_network_access_enabled
  resource_group_name           = var.resource_group_name
  role_assignments              = var.role_assignments
  subresource_names             = var.subresource_names
  tags                          = var.tags
  tracing_tags_enabled          = var.tracing_tags_enabled
  tracing_tags_prefix           = var.tracing_tags_prefix
}
