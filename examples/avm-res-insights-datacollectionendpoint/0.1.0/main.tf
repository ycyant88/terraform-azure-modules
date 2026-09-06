module "avm-res-insights-datacollectionendpoint" {
  source                        = "Azure/avm-res-insights-datacollectionendpoint/azurerm"
  version                       = "0.1.0"
  enable_telemetry              = var.enable_telemetry
  kind                          = var.kind
  location                      = var.location
  name                          = var.name
  public_network_access_enabled = var.public_network_access_enabled
  resource_group_name           = var.resource_group_name
  tags                          = var.tags
}
