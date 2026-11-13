output "aks_cluster" {
  value       = module.avm-res-hybridcontainerservice-provisionedclusterinstance.aks_cluster
  description = "AKS Arc Cluster instance"
}

output "resource_id" {
  value       = module.avm-res-hybridcontainerservice-provisionedclusterinstance.resource_id
  description = "AKS Arc Provisioned Cluster instance"
}

output "rsa_private_key" {
  value       = module.avm-res-hybridcontainerservice-provisionedclusterinstance.rsa_private_key
  description = "The RSA private key"
}
