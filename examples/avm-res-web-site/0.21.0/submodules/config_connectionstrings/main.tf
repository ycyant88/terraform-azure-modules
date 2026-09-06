module "avm-res-web-site" {
  source             = "Azure/avm-res-web-site/azurerm"
  version            = "0.21.0"
  connection_strings = var.connection_strings
  is_slot            = var.is_slot
  parent_id          = var.parent_id
}
