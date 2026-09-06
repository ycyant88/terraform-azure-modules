module "avm-res-network-dnsresolver" {
  source                    = "Azure/avm-res-network-dnsresolver/azurerm"
  version                   = "0.7.1"
  dns_forwarding_ruleset_id = var.dns_forwarding_ruleset_id
  virtual_networks          = var.virtual_networks
}
