module "caf-enterprise-scale" {
  source   = "Azure/caf-enterprise-scale/azurerm"
  version  = "1.1.3"
  enabled  = var.enabled
  root_id  = var.root_id
  settings = var.settings
}
