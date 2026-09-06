module "lz-vending" {
  source         = "Azure/lz-vending/azurerm"
  version        = "6.0.1"
  location       = var.location
  name           = var.name
  parent_id      = var.parent_id
  security_rules = var.security_rules
  tags           = var.tags
}
