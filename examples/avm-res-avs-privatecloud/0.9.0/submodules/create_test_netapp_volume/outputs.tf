output "resource" {
  value       = module.avm-res-avs-privatecloud.resource
  description = "the full ANF volume resource being created."
}

output "resource_id" {
  value       = module.avm-res-avs-privatecloud.resource_id
  description = "The Azure resource ID of the netapp volume being created."
}

output "volume_id" {
  value       = module.avm-res-avs-privatecloud.volume_id
  description = "The Azure resource ID of the netapp volume being created."
}
