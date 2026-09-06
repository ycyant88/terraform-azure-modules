module "avm-ptn-alz" {
  source                              = "Azure/avm-ptn-alz/azurerm"
  version                             = "0.9.0-beta"
  architecture_name                   = var.architecture_name
  delays                              = var.delays
  enable_telemetry                    = var.enable_telemetry
  location                            = var.location
  management_group_hierarchy_settings = var.management_group_hierarchy_settings
  parent_resource_id                  = var.parent_resource_id
  partner_id                          = var.partner_id
  policy_assignments_to_modify        = var.policy_assignments_to_modify
  policy_default_values               = var.policy_default_values
  retries                             = var.retries
  subscription_placement              = var.subscription_placement
  timeouts                            = var.timeouts
}
