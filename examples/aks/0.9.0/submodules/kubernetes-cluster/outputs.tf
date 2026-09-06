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

output "cluster_id" {
  value       = module.aks.cluster_id
  description = ""
}

output "host" {
  value       = module.aks.host
  description = ""
}

output "password" {
  value       = module.aks.password
  description = ""
}

output "raw_kube_config" {
  value       = module.aks.raw_kube_config
  description = ""
}

output "username" {
  value       = module.aks.username
  description = ""
}
