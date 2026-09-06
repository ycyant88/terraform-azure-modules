module "avm-res-operationalinsights-workspace" {
  source              = "Azure/avm-res-operationalinsights-workspace/azurerm"
  version             = "0.5.0"
  location            = var.location
  monitor_queries     = var.monitor_queries
  monitor_query_packs = var.monitor_query_packs
  resource_group_id   = var.resource_group_id
  tags                = var.tags
}
