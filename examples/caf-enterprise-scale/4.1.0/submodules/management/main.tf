module "caf-enterprise-scale" {
  source                                       = "Azure/caf-enterprise-scale/azurerm"
  version                                      = "4.1.0"
  asc_export_resource_group_name               = var.asc_export_resource_group_name
  custom_settings_by_resource_type             = var.custom_settings_by_resource_type
  enabled                                      = var.enabled
  existing_automation_account_resource_id      = var.existing_automation_account_resource_id
  existing_log_analytics_workspace_resource_id = var.existing_log_analytics_workspace_resource_id
  existing_resource_group_name                 = var.existing_resource_group_name
  link_log_analytics_to_automation_account     = var.link_log_analytics_to_automation_account
  location                                     = var.location
  resource_prefix                              = var.resource_prefix
  resource_suffix                              = var.resource_suffix
  root_id                                      = var.root_id
  settings                                     = var.settings
  subscription_id                              = var.subscription_id
  tags                                         = var.tags
}
