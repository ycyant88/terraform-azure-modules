output "aci_connector_object_id" {
  value       = module.avm-res-containerservice-managedcluster.aci_connector_object_id
  description = "(Not directly available via azapi without extra GET)"
}

output "cluster_ca_certificate" {
  value       = module.avm-res-containerservice-managedcluster.cluster_ca_certificate
  description = "Base64 cluster CA certificate from user kubeconfig."
}

output "host" {
  value       = module.avm-res-containerservice-managedcluster.host
  description = "API server host from user kubeconfig."
}

output "ingress_app_object_id" {
  value       = module.avm-res-containerservice-managedcluster.ingress_app_object_id
  description = "Ingress Application identity object id (not currently extracted)."
}

output "key_vault_secrets_provider_object_id" {
  value       = module.avm-res-containerservice-managedcluster.key_vault_secrets_provider_object_id
  description = "Key vault secrets provider identity object id (not currently extracted)."
}

output "kube_admin_config" {
  value       = module.avm-res-containerservice-managedcluster.kube_admin_config
  description = "Admin kubeconfig raw YAML (sensitive)."
}

output "kube_config" {
  value       = module.avm-res-containerservice-managedcluster.kube_config
  description = "User kubeconfig raw YAML (sensitive)."
}

output "kubelet_identity_id" {
  value       = module.avm-res-containerservice-managedcluster.kubelet_identity_id
  description = "Kubelet identity object id (not currently extracted)."
}

output "name" {
  value       = module.avm-res-containerservice-managedcluster.name
  description = "Name of the Kubernetes cluster."
}

output "node_resource_group_id" {
  value       = module.avm-res-containerservice-managedcluster.node_resource_group_id
  description = "Node resource group name not exported; manual lookup required."
}

output "node_resource_group_name" {
  value       = module.avm-res-containerservice-managedcluster.node_resource_group_name
  description = "Name of the automatically created node resource group."
}

output "nodepool_resource_ids" {
  value       = module.avm-res-containerservice-managedcluster.nodepool_resource_ids
  description = "A map of nodepool keys to resource ids."
}

output "oidc_issuer_url" {
  value       = module.avm-res-containerservice-managedcluster.oidc_issuer_url
  description = "OIDC issuer URL from GET export values."
}

output "private_endpoints" {
  value       = module.avm-res-containerservice-managedcluster.private_endpoints
  description = "  A map of the private endpoints created.\n"
}

output "public_fqdn" {
  value       = module.avm-res-containerservice-managedcluster.public_fqdn
  description = "Returns .fqdn when both private_cluster_enabled and private_cluster_public_fqdn_enabled are true, otherwise null"
}

output "resource_id" {
  value       = module.avm-res-containerservice-managedcluster.resource_id
  description = "Resource ID of the Kubernetes cluster."
}

output "user_assigned_identity_client_ids" {
  value       = module.avm-res-containerservice-managedcluster.user_assigned_identity_client_ids
  description = "Map of identity profile keys to clientIds."
}

output "user_assigned_identity_object_ids" {
  value       = module.avm-res-containerservice-managedcluster.user_assigned_identity_object_ids
  description = "Map of identity profile keys to principalIds."
}

output "web_app_routing_client_id" {
  value       = module.avm-res-containerservice-managedcluster.web_app_routing_client_id
  description = "The object ID of the web app routing identity"
}

output "web_app_routing_object_id" {
  value       = module.avm-res-containerservice-managedcluster.web_app_routing_object_id
  description = "Web app routing identity object id (not currently extracted)."
}
