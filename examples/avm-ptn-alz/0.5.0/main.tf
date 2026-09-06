module "avm-ptn-alz" {
  source                                     = "Azure/avm-ptn-alz/azurerm"
  version                                    = "0.5.0"
  base_archetype                             = var.base_archetype
  default_location                           = var.default_location
  default_log_analytics_workspace_id         = var.default_log_analytics_workspace_id
  default_private_dns_zone_resource_group_id = var.default_private_dns_zone_resource_group_id
  delays                                     = var.delays
  display_name                               = var.display_name
  enable_telemetry                           = var.enable_telemetry
  id                                         = var.id
  parent_id                                  = var.parent_id
  policy_assignments_to_modify               = var.policy_assignments_to_modify
  role_assignments                           = var.role_assignments
  subscription_ids                           = var.subscription_ids
  telemetry_resource_group_name              = var.telemetry_resource_group_name
}
