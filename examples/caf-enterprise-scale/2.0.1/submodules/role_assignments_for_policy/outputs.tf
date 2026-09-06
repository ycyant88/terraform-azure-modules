output "azurerm_role_assignment" {
  value       = module.caf-enterprise-scale.azurerm_role_assignment
  description = "Returns the configuration data for all Role Assignments created by this module."
}
