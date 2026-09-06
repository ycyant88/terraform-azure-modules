module "avm-ptn-alz" {
  source                             = "Azure/avm-ptn-alz/azurerm"
  version                            = "0.1.1"
  base_archetype                     = var.base_archetype
  default_location                   = var.default_location
  default_log_analytics_workspace_id = var.default_log_analytics_workspace_id
  display_name                       = var.display_name
  id                                 = var.id
  parent_id                          = var.parent_id
  role_assignments                   = var.role_assignments
}
