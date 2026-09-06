module "lz-vending" {
  source         = "Azure/lz-vending/azurerm"
  version        = "7.0.2"
  location       = var.location
  name           = var.name
  parent_id      = var.parent_id
  security_rules = var.security_rules
  tags           = var.tags
}
