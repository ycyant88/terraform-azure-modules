output "automation_account" {
  value       = module.avm-ptn-alz-management.automation_account
  description = "A curated output of the Azure Automation Account."
}

output "log_analytics_workspace" {
  value       = module.avm-ptn-alz-management.log_analytics_workspace
  description = "A curated output of the Log Analytics Workspace."
}

output "resource_group" {
  value       = module.avm-ptn-alz-management.resource_group
  description = "A curated output of the Azure Resource Group."
}
