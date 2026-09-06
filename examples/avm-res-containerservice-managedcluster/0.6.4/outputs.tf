output "agentpool_resource_ids" {
  value       = module.avm-res-containerservice-managedcluster.agentpool_resource_ids
  description = "A map of nodepool keys to resource ids."
}

output "azure_portal_fqdn" {
  value       = module.avm-res-containerservice-managedcluster.azure_portal_fqdn
  description = "The special FQDN used by the Azure Portal to access the Managed Cluster. This FQDN is for use only by the Azure Portal and should not be used by other clients. The Azure Portal requires certain Cross-Origin Resource Sharing (CORS) headers to be sent in some responses, which Kubernetes APIServer doesn't handle by default. This special FQDN supports CORS, allowing the Azure Portal to function properly."
}

output "cluster_ca_certificate" {
  value       = module.avm-res-containerservice-managedcluster.cluster_ca_certificate
  description = "Base64 cluster CA certificate from user kubeconfig."
}

output "current_kubernetes_version" {
  value       = module.avm-res-containerservice-managedcluster.current_kubernetes_version
  description = "The version of Kubernetes the Managed Cluster is running. If kubernetesVersion was a fully specified version <major.minor.patch>, this field will be exactly equal to it. If kubernetesVersion was <major.minor>, this field will contain the full <major.minor.patch> version being used."
}

output "fqdn" {
  value       = module.avm-res-containerservice-managedcluster.fqdn
  description = "The FQDN of the master pool."
}

output "identity_principal_id" {
  value       = module.avm-res-containerservice-managedcluster.identity_principal_id
  description = "The principal id of the assigned identity which is used by master components."
}

output "identity_tenant_id" {
  value       = module.avm-res-containerservice-managedcluster.identity_tenant_id
  description = "The tenant id of the assigned identity which is used by master components."
}

output "ingress_profile_web_app_routing_identity" {
  value       = module.avm-res-containerservice-managedcluster.ingress_profile_web_app_routing_identity
  description = "Details about a user assigned identity."
}

output "key_vault_secrets_provider_identity" {
  value       = module.avm-res-containerservice-managedcluster.key_vault_secrets_provider_identity
  description = "The identity of the Key Vault Secrets Provider addon, including clientId, objectId, and resourceId."
}

output "kube_admin_config" {
  value       = module.avm-res-containerservice-managedcluster.kube_admin_config
  description = "Admin kubeconfig raw YAML (sensitive)."
}

output "kube_config" {
  value       = module.avm-res-containerservice-managedcluster.kube_config
  description = "User kubeconfig raw YAML (sensitive)."
}

output "kubelet_identity" {
  value       = module.avm-res-containerservice-managedcluster.kubelet_identity
  description = "The kubelet identity of the managed cluster, including clientId, objectId, and resourceId."
}

output "max_agent_pools" {
  value       = module.avm-res-containerservice-managedcluster.max_agent_pools
  description = "The max number of agent pools for the managed cluster."
}

output "name" {
  value       = module.avm-res-containerservice-managedcluster.name
  description = "The name of the created resource."
}

output "namespace_resource_ids" {
  value       = module.avm-res-containerservice-managedcluster.namespace_resource_ids
  description = "A map of namespace keys to resource ids."
}

output "network_profile_load_balancer_profile_effective_outbound_ips" {
  value       = module.avm-res-containerservice-managedcluster.network_profile_load_balancer_profile_effective_outbound_ips
  description = "The effective outbound IP resources of the cluster load balancer."
}

output "network_profile_nat_gateway_profile_effective_outbound_ips" {
  value       = module.avm-res-containerservice-managedcluster.network_profile_nat_gateway_profile_effective_outbound_ips
  description = "The effective outbound IP resources of the cluster NAT gateway."
}

output "node_resource_group_name" {
  value       = module.avm-res-containerservice-managedcluster.node_resource_group_name
  description = "The name of the auto-created node resource group."
}

output "oidc_issuer_profile_issuer_url" {
  value       = module.avm-res-containerservice-managedcluster.oidc_issuer_profile_issuer_url
  description = "The OIDC issuer url of the Managed Cluster."
}

output "private_fqdn" {
  value       = module.avm-res-containerservice-managedcluster.private_fqdn
  description = "The FQDN of private cluster."
}

output "resource_id" {
  value       = module.avm-res-containerservice-managedcluster.resource_id
  description = "The ID of the created resource."
}
