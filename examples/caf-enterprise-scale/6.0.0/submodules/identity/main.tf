module "caf-enterprise-scale" {
  source   = "Azure/caf-enterprise-scale/azurerm"
  version  = "6.0.0"
  enabled  = var.enabled
  root_id  = var.root_id
  settings = var.settings
}
