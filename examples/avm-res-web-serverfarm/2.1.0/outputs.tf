output "name" {
  value       = module.avm-res-web-serverfarm.name
  description = "Name of the app service plan"
}

output "resource_id" {
  value       = module.avm-res-web-serverfarm.resource_id
  description = "Resource id of the app service plan"
}
