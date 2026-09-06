module "lz-vending" {
  source              = "Azure/lz-vending/azurerm"
  version             = "5.1.2"
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name
  security_rules      = var.security_rules
  subscription_id     = var.subscription_id
  tags                = var.tags
}
