module "avm-res-operationalinsights-workspace" {
  source              = "Azure/avm-res-operationalinsights-workspace/azurerm"
  version             = "0.6.0"
  enable_telemetry    = var.enable_telemetry
  ignore_body_changes = var.ignore_body_changes
  location            = var.location
  monitor_queries     = var.monitor_queries
  monitor_query_packs = var.monitor_query_packs
  resource_group_id   = var.resource_group_id
  resource_types      = var.resource_types
  retry               = var.retry
  tags                = var.tags
  timeouts            = var.timeouts
}
