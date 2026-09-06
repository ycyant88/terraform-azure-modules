output "key_vault_secrets_provider_object_id" {
  value       = module.avm-res-containerservice-managedcluster.key_vault_secrets_provider_object_id
  description = "The object ID of the key vault secrets provider."
}

output "kube_admin_config" {
  value       = module.avm-res-containerservice-managedcluster.kube_admin_config
  description = "The kube_admin_config block of the AKS cluster, only available when Local Accounts & Role-Based Access Control (RBAC) with AAD are enabled."
}

output "kubelet_identity_id" {
  value       = module.avm-res-containerservice-managedcluster.kubelet_identity_id
  description = "The identity ID of the kubelet identity."
}

output "name" {
  value       = module.avm-res-containerservice-managedcluster.name
  description = "Name of the Kubernetes cluster."
}

output "node_resource_group_id" {
  value       = module.avm-res-containerservice-managedcluster.node_resource_group_id
  description = "The resource group ID of the node resource group."
}

output "nodepool_resource_ids" {
  value       = module.avm-res-containerservice-managedcluster.nodepool_resource_ids
  description = "A map of nodepool keys to resource ids."
}

output "oidc_issuer_url" {
  value       = module.avm-res-containerservice-managedcluster.oidc_issuer_url
  description = "The OIDC issuer URL of the Kubernetes cluster."
}

output "private_endpoints" {
  value       = module.avm-res-containerservice-managedcluster.private_endpoints
  description = "  A map of the private endpoints created.\n"
}

output "resource_id" {
  value       = module.avm-res-containerservice-managedcluster.resource_id
  description = "Resource ID of the Kubernetes cluster."
}
