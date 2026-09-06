module "avm-res-network-routetable" {
  source              = "Azure/avm-res-network-routetable/azurerm"
  version             = "0.5.0"
  address_prefix      = var.address_prefix
  name                = var.name
  next_hop_ip_address = var.next_hop_ip_address
  next_hop_type       = var.next_hop_type
  parent_id           = var.parent_id
}
