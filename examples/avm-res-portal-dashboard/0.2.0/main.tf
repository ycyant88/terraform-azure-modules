module "avm-res-portal-dashboard" {
  source                                    = "Azure/avm-res-portal-dashboard/azurerm"
  version                                   = "0.2.0"
  enable_telemetry                          = var.enable_telemetry
  ignore_body_changes                       = var.ignore_body_changes
  location                                  = var.location
  lock                                      = var.lock
  name                                      = var.name
  parent_id                                 = var.parent_id
  resource_types                            = var.resource_types
  retry                                     = var.retry
  role_assignment_definition_lookup_enabled = var.role_assignment_definition_lookup_enabled
  role_assignments                          = var.role_assignments
  tags                                      = var.tags
  template_file_path                        = var.template_file_path
  template_file_variables                   = var.template_file_variables
  timeouts                                  = var.timeouts
}
