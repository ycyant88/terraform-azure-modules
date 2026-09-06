output "resource" {
  value       = module.avm-res-avs-privatecloud.resource
  description = "The jump vm resource output required by the spec."
}

output "resource_id" {
  value       = module.avm-res-avs-privatecloud.resource_id
  description = "The jump vm resource id output required by the spec."
}
