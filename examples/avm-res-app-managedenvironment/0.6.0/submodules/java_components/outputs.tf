output "ingress_fqdn" {
  value       = module.avm-res-app-managedenvironment.ingress_fqdn
  description = "Hostname of the Java Component endpoint"
}

output "name" {
  value       = module.avm-res-app-managedenvironment.name
  description = "The name of the created resource."
}

output "resource_id" {
  value       = module.avm-res-app-managedenvironment.resource_id
  description = "The ID of the created resource."
}
