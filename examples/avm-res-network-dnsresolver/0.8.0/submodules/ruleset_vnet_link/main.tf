module "avm-res-network-dnsresolver" {
  source                    = "Azure/avm-res-network-dnsresolver/azurerm"
  version                   = "0.8.0"
  dns_forwarding_ruleset_id = var.dns_forwarding_ruleset_id
  virtual_networks          = var.virtual_networks
}
