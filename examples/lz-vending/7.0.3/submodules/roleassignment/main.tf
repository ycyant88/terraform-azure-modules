module "lz-vending" {
  source                                    = "Azure/lz-vending/azurerm"
  version                                   = "7.0.3"
  enable_telemetry                          = var.enable_telemetry
  retry                                     = var.retry
  role_assignment_condition                 = var.role_assignment_condition
  role_assignment_condition_version         = var.role_assignment_condition_version
  role_assignment_definition                = var.role_assignment_definition
  role_assignment_definition_lookup_enabled = var.role_assignment_definition_lookup_enabled
  role_assignment_principal_id              = var.role_assignment_principal_id
  role_assignment_principal_type            = var.role_assignment_principal_type
  role_assignment_scope                     = var.role_assignment_scope
  role_assignment_use_random_uuid           = var.role_assignment_use_random_uuid
}
