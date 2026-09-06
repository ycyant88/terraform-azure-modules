module "lz-vending" {
  source                            = "Azure/lz-vending/azurerm"
  version                           = "4.1.3"
  role_assignment_condition         = var.role_assignment_condition
  role_assignment_condition_version = var.role_assignment_condition_version
  role_assignment_definition        = var.role_assignment_definition
  role_assignment_principal_id      = var.role_assignment_principal_id
  role_assignment_scope             = var.role_assignment_scope
}
