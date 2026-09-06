output "name" {
  value       = module.avm-res-web-site.name
  description = "The hostname binding name."
}

output "resource" {
  value       = module.avm-res-web-site.resource
  description = "The full resource object."
}

output "resource_id" {
  value       = module.avm-res-web-site.resource_id
  description = "The resource ID of the hostname binding."
}
