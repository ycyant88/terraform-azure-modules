output "name" {
  value       = module.avm-res-containerservice-managedcluster.name
  description = "Name of the Kubernetes cluster."
}

output "resource_id" {
  value       = module.avm-res-containerservice-managedcluster.resource_id
  description = "Resource ID of the Kubernetes cluster."
}
