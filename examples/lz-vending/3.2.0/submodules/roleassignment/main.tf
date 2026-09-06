module "lz-vending" {
  source                       = "Azure/lz-vending/azurerm"
  version                      = "3.2.0"
  role_assignment_definition   = var.role_assignment_definition
  role_assignment_principal_id = var.role_assignment_principal_id
  role_assignment_scope        = var.role_assignment_scope
}
