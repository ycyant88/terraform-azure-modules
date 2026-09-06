output "azurerm_management_group" {
  value       = module.caf-enterprise-scale.azurerm_management_group
  description = "Returns the configuration data for all Management Groups created by this module."
}

output "azurerm_policy_assignment" {
  value       = module.caf-enterprise-scale.azurerm_policy_assignment
  description = "Returns the configuration data for all Policy Assignments created by this module."
}

output "azurerm_policy_definition" {
  value       = module.caf-enterprise-scale.azurerm_policy_definition
  description = "Returns the configuration data for all Policy Definitions created by this module."
}

output "azurerm_policy_set_definition" {
  value       = module.caf-enterprise-scale.azurerm_policy_set_definition
  description = "Returns the configuration data for all Policy Set Definitions created by this module."
}

output "azurerm_role_assignment" {
  value       = module.caf-enterprise-scale.azurerm_role_assignment
  description = "Returns the configuration data for all Role Assignments created by this module."
}

output "azurerm_role_definition" {
  value       = module.caf-enterprise-scale.azurerm_role_definition
  description = "Returns the configuration data for all Role Definitions created by this module."
}
