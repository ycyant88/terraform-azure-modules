module "avm-ptn-azuremonitorwindowsagent" {
  source                                                = "Azure/avm-ptn-azuremonitorwindowsagent/azurerm"
  version                                               = "0.2.0"
  arc_setting_id                                        = var.arc_setting_id
  azurerm_monitor_data_collection_rule_association_name = var.azurerm_monitor_data_collection_rule_association_name
  create_data_collection_resources                      = var.create_data_collection_resources
  data_collection_endpoint_name                         = var.data_collection_endpoint_name
  data_collection_rule_name                             = var.data_collection_rule_name
  data_collection_rule_resource_id                      = var.data_collection_rule_resource_id
  enable_telemetry                                      = var.enable_telemetry
  lock                                                  = var.lock
  name                                                  = var.name
  resource_group_name                                   = var.resource_group_name
  role_assignments                                      = var.role_assignments
  server_names                                          = var.server_names
  workspace_name                                        = var.workspace_name
}
