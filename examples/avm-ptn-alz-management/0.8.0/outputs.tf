output "automation_account" {
  value       = module.avm-ptn-alz-management.automation_account
  description = "A curated output of the Azure Automation Account."
}

output "automation_account_dsc_keys" {
  value       = module.avm-ptn-alz-management.automation_account_dsc_keys
  description = "Sensitive values for the Azure Automation Account."
}

output "data_collection_rule_ids" {
  value       = module.avm-ptn-alz-management.data_collection_rule_ids
  description = "Data Collection Rule Resource Ids."
}

output "log_analytics_workspace" {
  value       = module.avm-ptn-alz-management.log_analytics_workspace
  description = "A curated output of the Log Analytics Workspace."
}

output "log_analytics_workspace_keys" {
  value       = module.avm-ptn-alz-management.log_analytics_workspace_keys
  description = "Sensitive values for the Log Analytics Workspace."
}

output "resource_group" {
  value       = module.avm-ptn-alz-management.resource_group
  description = "A curated output of the Azure Resource Group."
}

output "resource_id" {
  value       = module.avm-ptn-alz-management.resource_id
  description = "The resource ID of the Log Analytics Workspace."
}

output "user_assigned_identity_ids" {
  value       = module.avm-ptn-alz-management.user_assigned_identity_ids
  description = "User assigned identity IDs."
}
