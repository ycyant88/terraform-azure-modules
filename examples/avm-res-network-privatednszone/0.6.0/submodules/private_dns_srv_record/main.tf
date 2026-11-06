module "avm-res-network-privatednszone" {
  source           = "Azure/avm-res-network-privatednszone/azurerm"
  version          = "0.6.0"
  enable_telemetry = var.enable_telemetry
  location         = var.location
  name             = var.name
  parent_id        = var.parent_id
  records          = var.records
  retry            = var.retry
  timeouts         = var.timeouts
  ttl              = var.ttl
}
