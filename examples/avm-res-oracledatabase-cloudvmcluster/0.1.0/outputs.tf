output "resource" {
  value       = module.avm-res-oracledatabase-cloudvmcluster.resource
  description = "This is the full output for the resource."
}

output "resource_id" {
  value       = module.avm-res-oracledatabase-cloudvmcluster.resource_id
  description = "Resource ID of the ODAA VM Cluster"
}
