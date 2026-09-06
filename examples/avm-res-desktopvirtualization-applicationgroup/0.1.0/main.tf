module "avm-res-desktopvirtualization-applicationgroup" {
  source               = "Azure/avm-res-desktopvirtualization-applicationgroup/azurerm"
  version              = "0.1.0"
  description          = var.description
  diagnostic_settings  = var.diagnostic_settings
  enable_telemetry     = var.enable_telemetry
  hostpool             = var.hostpool
  lock                 = var.lock
  name                 = var.name
  resource_group_name  = var.resource_group_name
  role_assignments     = var.role_assignments
  tags                 = var.tags
  tracing_tags_enabled = var.tracing_tags_enabled
  tracing_tags_prefix  = var.tracing_tags_prefix
  type                 = var.type
  user_group_name      = var.user_group_name
}
