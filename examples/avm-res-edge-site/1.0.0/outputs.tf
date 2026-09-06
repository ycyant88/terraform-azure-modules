output "resource" {
  value       = module.avm-res-edge-site.resource
  description = "This is the full output for the resource."
}

output "resource_id" {
  value       = module.avm-res-edge-site.resource_id
  description = "This is the resource id for the site resource."
}
