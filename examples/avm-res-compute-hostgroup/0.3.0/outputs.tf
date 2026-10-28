output "host_ids" {
  value       = module.avm-res-compute-hostgroup.host_ids
  description = "A map of the hosts in the Dedicated Host Group to the resource IDs"
}

output "name" {
  value       = module.avm-res-compute-hostgroup.name
  description = "The name of the Dedicated Host Group"
}

output "resource" {
  value       = module.avm-res-compute-hostgroup.resource
  description = "All atrributes of the Dedicated Host group"
}

output "resource_id" {
  value       = module.avm-res-compute-hostgroup.resource_id
  description = "The resource ID of the Dedicated Host Group"
}
