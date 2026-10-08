output "body" {
  value       = module.avm-res-recoveryservices-vault.body
  description = "The configured AzAPI request body sent to Azure for the workload backup policy, or null when no policy is created."
}

output "name" {
  value       = module.avm-res-recoveryservices-vault.name
  description = "The name of the workload backup policy, or null when no policy is created."
}

output "output_protection_policy" {
  value       = module.avm-res-recoveryservices-vault.output_protection_policy
  description = "The output protection policy"
}

output "resource_id" {
  value       = module.avm-res-recoveryservices-vault.resource_id
  description = "The resource ID of the workload backup policy, or null when no policy is created."
}
