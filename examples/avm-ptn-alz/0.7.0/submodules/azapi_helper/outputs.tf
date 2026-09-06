output "identity" {
  value       = module.avm-ptn-alz.identity
  description = "The identity configuration of the resource."
}

output "name" {
  value       = module.avm-ptn-alz.name
  description = "The name of the resource."
}

output "output" {
  value       = module.avm-ptn-alz.output
  description = "The output values of the resource as defined by response_export_values."
}

output "resource_id" {
  value       = module.avm-ptn-alz.resource_id
  description = "The Azure resource id of the resource."
}
