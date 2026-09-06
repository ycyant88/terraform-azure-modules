module "caf-enterprise-scale" {
  source               = "Azure/caf-enterprise-scale/azurerm"
  version              = "4.0.0"
  additional_scope_ids = var.additional_scope_ids
  policy_assignment_id = var.policy_assignment_id
  principal_id         = var.principal_id
  role_definition_ids  = var.role_definition_ids
  scope_id             = var.scope_id
}
