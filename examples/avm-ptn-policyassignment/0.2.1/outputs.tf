output "policy_assignment_id" {
  value       = module.avm-ptn-policyassignment.policy_assignment_id
  description = "This is the id of the policy assignment"
}

output "policy_assignment_name" {
  value       = module.avm-ptn-policyassignment.policy_assignment_name
  description = "This is the name of the policy assignment"
}

output "resource" {
  value       = module.avm-ptn-policyassignment.resource
  description = "Deprecated"
}

output "resource_id" {
  value       = module.avm-ptn-policyassignment.resource_id
  description = "This is the resource id of the policy assignment."
}

output "role_assignments" {
  value       = module.avm-ptn-policyassignment.role_assignments
  description = "This is the full output for the role assignments."
}
