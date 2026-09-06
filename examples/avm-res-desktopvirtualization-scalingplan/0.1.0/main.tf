module "avm-res-desktopvirtualization-scalingplan" {
  source               = "Azure/avm-res-desktopvirtualization-scalingplan/azurerm"
  version              = "0.1.0"
  diagnostic_settings  = var.diagnostic_settings
  enable_telemetry     = var.enable_telemetry
  hostpool             = var.hostpool
  location             = var.location
  lock                 = var.lock
  resource_group_name  = var.resource_group_name
  role_assignments     = var.role_assignments
  scalingplan          = var.scalingplan
  schedules            = var.schedules
  tags                 = var.tags
  time_zone            = var.time_zone
  tracing_tags_enabled = var.tracing_tags_enabled
  tracing_tags_prefix  = var.tracing_tags_prefix
}
