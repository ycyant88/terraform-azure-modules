output "resource" {
  value       = module.avm-res-desktopvirtualization-scalingplan.resource
  description = "This output is the full output for the resource to allow flexibility to reference all possible values for the resource. Example usage: module.<modulename>.resource.id"
}

output "resource_id" {
  value       = module.avm-res-desktopvirtualization-scalingplan.resource_id
  description = "This output is the full output for the resource to allow flexibility to reference all possible values for the resource. Example usage: module.<modulename>.resource.id"
}
