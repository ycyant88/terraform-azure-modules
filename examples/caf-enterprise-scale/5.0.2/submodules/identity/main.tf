module "caf-enterprise-scale" {
  source   = "Azure/caf-enterprise-scale/azurerm"
  version  = "5.0.2"
  enabled  = var.enabled
  root_id  = var.root_id
  settings = var.settings
}
