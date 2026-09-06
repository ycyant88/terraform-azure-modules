output "management_group_resource_ids" {
  value       = module.avm-ptn-alz.management_group_resource_ids
  description = ""
}

output "policy_assignment_identity_ids" {
  value       = module.avm-ptn-alz.policy_assignment_identity_ids
  description = "A map of policy assignment names to their identity ids."
}

output "policy_assignment_resource_ids" {
  value       = module.avm-ptn-alz.policy_assignment_resource_ids
  description = "A map of policy assignment names to their resource ids."
}

output "policy_definition_resource_ids" {
  value       = module.avm-ptn-alz.policy_definition_resource_ids
  description = "A map of policy definition names to their resource ids."
}

output "policy_role_assignment_resource_ids" {
  value       = module.avm-ptn-alz.policy_role_assignment_resource_ids
  description = "A map of policy role assignments to their resource ids."
}

output "policy_set_definition_resource_ids" {
  value       = module.avm-ptn-alz.policy_set_definition_resource_ids
  description = "A map of policy set definition names to their resource ids."
}

output "role_definition_resource_ids" {
  value       = module.avm-ptn-alz.role_definition_resource_ids
  description = "A map of role definition names to their resource ids."
}
