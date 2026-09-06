output "azurerm_automation_account" {
  value       = module.caf-enterprise-scale.azurerm_automation_account
  description = "Returns the configuration data for all Automation Accounts created by this module."
}

output "azurerm_log_analytics_linked_service" {
  value       = module.caf-enterprise-scale.azurerm_log_analytics_linked_service
  description = "Returns the configuration data for all Log Analytics linked services created by this module."
}

output "azurerm_log_analytics_solution" {
  value       = module.caf-enterprise-scale.azurerm_log_analytics_solution
  description = "Returns the configuration data for all Log Analytics solutions created by this module."
}

output "azurerm_log_analytics_workspace" {
  value       = module.caf-enterprise-scale.azurerm_log_analytics_workspace
  description = "Returns the configuration data for all Log Analytics workspaces created by this module. Excludes sensitive values."
}

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

output "azurerm_resource_group" {
  value       = module.caf-enterprise-scale.azurerm_resource_group
  description = "Returns the configuration data for all Resource Groups created by this module."
}

output "azurerm_role_assignment" {
  value       = module.caf-enterprise-scale.azurerm_role_assignment
  description = "Returns the configuration data for all Role Assignments created by this module."
}

output "azurerm_role_definition" {
  value       = module.caf-enterprise-scale.azurerm_role_definition
  description = "Returns the configuration data for all Role Definitions created by this module."
}
