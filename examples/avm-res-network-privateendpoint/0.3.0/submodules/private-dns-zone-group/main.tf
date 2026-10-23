module "avm-res-network-privateendpoint" {
  source                        = "Azure/avm-res-network-privateendpoint/azurerm"
  version                       = "0.3.0"
  enable_telemetry              = var.enable_telemetry
  ignore_body_changes           = var.ignore_body_changes
  location                      = var.location
  name                          = var.name
  parent_id                     = var.parent_id
  private_dns_zone_resource_ids = var.private_dns_zone_resource_ids
  resource_types                = var.resource_types
  retry                         = var.retry
  timeouts                      = var.timeouts
}
