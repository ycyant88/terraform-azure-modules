output "client_certificate" {
  value       = module.aks.client_certificate
  description = ""
}

output "client_key" {
  value       = module.aks.client_key
  description = ""
}

output "cluster_ca_certificate" {
  value       = module.aks.cluster_ca_certificate
  description = ""
}

output "host" {
  value       = module.aks.host
  description = ""
}

output "location" {
  value       = module.aks.location
  description = ""
}

output "node_resource_group" {
  value       = module.aks.node_resource_group
  description = ""
}

output "password" {
  value       = module.aks.password
  description = ""
}

output "username" {
  value       = module.aks.username
  description = ""
}
