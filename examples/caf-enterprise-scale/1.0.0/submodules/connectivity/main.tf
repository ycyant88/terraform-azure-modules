module "caf-enterprise-scale" {
  source                                    = "Azure/caf-enterprise-scale/azurerm"
  version                                   = "1.0.0"
  custom_settings_by_resource_type          = var.custom_settings_by_resource_type
  enabled                                   = var.enabled
  existing_ddos_protection_plan_resource_id = var.existing_ddos_protection_plan_resource_id
  location                                  = var.location
  resource_prefix                           = var.resource_prefix
  resource_suffix                           = var.resource_suffix
  root_id                                   = var.root_id
  settings                                  = var.settings
  subscription_id                           = var.subscription_id
  tags                                      = var.tags
}
