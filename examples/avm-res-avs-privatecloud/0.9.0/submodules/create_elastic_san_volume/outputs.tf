output "elastic_san" {
  value       = module.avm-res-avs-privatecloud.elastic_san
  description = "The full elastic san resource output."
}

output "resource" {
  value       = module.avm-res-avs-privatecloud.resource
  description = "The full elastic san resource output"
}

output "resource_id" {
  value       = module.avm-res-avs-privatecloud.resource_id
  description = "The resource id of the elastic san volume"
}

output "volumes" {
  value       = module.avm-res-avs-privatecloud.volumes
  description = "The full elastic san volume output"
}
