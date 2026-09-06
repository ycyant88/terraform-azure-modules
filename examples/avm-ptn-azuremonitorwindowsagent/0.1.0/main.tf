module "avm-ptn-azuremonitorwindowsagent" {
  source                                                = "Azure/avm-ptn-azuremonitorwindowsagent/azurerm"
  version                                               = "0.1.0"
  arc_setting_id                                        = var.arc_setting_id
  azurerm_monitor_data_collection_rule_association_name = var.azurerm_monitor_data_collection_rule_association_name
  data_collection_rule_resource_id                      = var.data_collection_rule_resource_id
  enable_telemetry                                      = var.enable_telemetry
  lock                                                  = var.lock
  name                                                  = var.name
  resource_group_name                                   = var.resource_group_name
  role_assignments                                      = var.role_assignments
  server_names                                          = var.server_names
}
