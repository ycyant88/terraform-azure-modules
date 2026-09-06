output "resource" {
  value       = module.avm-res-desktopvirtualization-applicationgroup.resource
  description = "This output is the full output for the resource to allow flexibility to reference all possible values for the resource. Example usage: module.<modulename>.resource.id"
}

output "resource_id" {
  value       = module.avm-res-desktopvirtualization-applicationgroup.resource_id
  description = "The ID of the Azure Virtual Desktop application group"
}
