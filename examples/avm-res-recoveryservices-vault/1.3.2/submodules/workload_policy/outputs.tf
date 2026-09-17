output "output_protection_policy" {
  value       = module.avm-res-recoveryservices-vault.output_protection_policy
  description = "The output protection policy"
}

output "resource" {
  value       = module.avm-res-recoveryservices-vault.resource
  description = "resource Id output"
}

output "resource_id" {
  value       = module.avm-res-recoveryservices-vault.resource_id
  description = "resource Id output"
}
