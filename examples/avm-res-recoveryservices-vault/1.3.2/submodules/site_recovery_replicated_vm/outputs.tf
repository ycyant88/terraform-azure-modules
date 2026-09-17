output "replication_health" {
  value       = module.avm-res-recoveryservices-vault.replication_health
  description = "The replication health returned by Azure Site Recovery."
}

output "resource" {
  value       = module.avm-res-recoveryservices-vault.resource
  description = "The site recovery replicated VM resource"
}

output "resource_id" {
  value       = module.avm-res-recoveryservices-vault.resource_id
  description = "The resource ID of the site recovery replicated VM"
}
