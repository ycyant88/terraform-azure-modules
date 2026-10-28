output "body" {
  value       = module.avm-res-recoveryservices-vault.body
  description = "The configured AzAPI request body sent to Azure for the virtual machine backup policy."
}

output "name" {
  value       = module.avm-res-recoveryservices-vault.name
  description = "The name of the virtual machine backup policy."
}

output "resource_id" {
  value       = module.avm-res-recoveryservices-vault.resource_id
  description = "The resource ID of the virtual machine backup policy."
}
