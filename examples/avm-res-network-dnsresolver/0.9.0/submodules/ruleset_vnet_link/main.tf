module "avm-res-network-dnsresolver" {
  source                    = "Azure/avm-res-network-dnsresolver/azurerm"
  version                   = "0.9.0"
  dns_forwarding_ruleset_id = var.dns_forwarding_ruleset_id
  enable_telemetry          = var.enable_telemetry
  ignore_body_changes       = var.ignore_body_changes
  location                  = var.location
  resource_types            = var.resource_types
  retry                     = var.retry
  timeouts                  = var.timeouts
  virtual_networks          = var.virtual_networks
}
