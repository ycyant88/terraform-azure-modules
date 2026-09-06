module "lz-vending" {
  source                     = "Azure/lz-vending/azurerm"
  version                    = "5.1.1"
  location                   = var.location
  name                       = var.name
  resource_group_resource_id = var.resource_group_resource_id
  security_rules             = var.security_rules
  tags                       = var.tags
}
