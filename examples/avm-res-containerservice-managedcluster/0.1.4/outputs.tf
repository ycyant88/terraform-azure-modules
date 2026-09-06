output "kubelet_identity_id" {
  value       = module.avm-res-containerservice-managedcluster.kubelet_identity_id
  description = "The identity ID of the kubelet identity."
}

output "name" {
  value       = module.avm-res-containerservice-managedcluster.name
  description = "Name of the Kubernetes cluster."
}

output "nodepool_resource_ids" {
  value       = module.avm-res-containerservice-managedcluster.nodepool_resource_ids
  description = "A map of nodepool keys to resource ids."
}

output "private_endpoints" {
  value       = module.avm-res-containerservice-managedcluster.private_endpoints
  description = "  A map of the private endpoints created.\n"
}

output "resource_id" {
  value       = module.avm-res-containerservice-managedcluster.resource_id
  description = "Resource ID of the Kubernetes cluster."
}
