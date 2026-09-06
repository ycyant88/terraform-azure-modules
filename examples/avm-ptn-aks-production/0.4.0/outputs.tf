output "current_kubernetes_version" {
  value       = module.avm-ptn-aks-production.current_kubernetes_version
  description = "The current version running on the Azure Kubernetes Managed Cluster"
}

output "fqdn" {
  value       = module.avm-ptn-aks-production.fqdn
  description = "The FQDN of the Azure Kubernetes Managed Cluster"
}

output "http_application_routing_zone_name" {
  value       = module.avm-ptn-aks-production.http_application_routing_zone_name
  description = "The Zone Name of the HTTP Application Routing"
}

output "identity_principal_id" {
  value       = module.avm-ptn-aks-production.identity_principal_id
  description = "The Principal ID associated with this Managed Service Identity"
}

output "identity_tenant_id" {
  value       = module.avm-ptn-aks-production.identity_tenant_id
  description = "The Tenant ID associated with this Managed Service Identity"
}

output "ingress_application_gateway_identity_client_id" {
  value       = module.avm-ptn-aks-production.ingress_application_gateway_identity_client_id
  description = "The Client ID of the user-defined Managed Identity used by the Application Gateway"
}

output "ingress_application_gateway_identity_object_id" {
  value       = module.avm-ptn-aks-production.ingress_application_gateway_identity_object_id
  description = "The Object ID of the user-defined Managed Identity used by the Application Gateway"
}

output "ingress_application_gateway_identity_user_assigned_identity_id" {
  value       = module.avm-ptn-aks-production.ingress_application_gateway_identity_user_assigned_identity_id
  description = "The ID of the User Assigned Identity used by the Application Gateway"
}

output "key_vault_secrets_provider_secret_identity_client_id" {
  value       = module.avm-ptn-aks-production.key_vault_secrets_provider_secret_identity_client_id
  description = "The Client ID of the user-defined Managed Identity used by the Secret Provider"
}

output "key_vault_secrets_provider_secret_identity_object_id" {
  value       = module.avm-ptn-aks-production.key_vault_secrets_provider_secret_identity_object_id
  description = "The Object ID of the user-defined Managed Identity used by the Secret Provider"
}

output "key_vault_secrets_provider_secret_identity_user_assigned_identity_id" {
  value       = module.avm-ptn-aks-production.key_vault_secrets_provider_secret_identity_user_assigned_identity_id
  description = "The ID of the User Assigned Identity used by the Secret Provider"
}

output "kube_admin_config" {
  value       = module.avm-ptn-aks-production.kube_admin_config
  description = "The kube_admin_config block for the Azure Kubernetes Managed Cluster"
}

output "kube_admin_config_raw" {
  value       = module.avm-ptn-aks-production.kube_admin_config_raw
  description = "Raw Kubernetes config for the admin account"
}

output "kube_config" {
  value       = module.avm-ptn-aks-production.kube_config
  description = "The kube_config block for the Azure Kubernetes Managed Cluster"
}

output "kube_config_raw" {
  value       = module.avm-ptn-aks-production.kube_config_raw
  description = "Raw Kubernetes config for the user account"
}

output "kubelet_identity_client_id" {
  value       = module.avm-ptn-aks-production.kubelet_identity_client_id
  description = "The Client ID of the user-defined Managed Identity assigned to the Kubelets"
}

output "kubelet_identity_object_id" {
  value       = module.avm-ptn-aks-production.kubelet_identity_object_id
  description = "The Object ID of the user-defined Managed Identity assigned to the Kubelets"
}

output "kubelet_identity_user_assigned_identity_id" {
  value       = module.avm-ptn-aks-production.kubelet_identity_user_assigned_identity_id
  description = "The ID of the User Assigned Identity assigned to the Kubelets"
}

output "load_balancer_profile_effective_outbound_ips" {
  value       = module.avm-ptn-aks-production.load_balancer_profile_effective_outbound_ips
  description = "The effective outbound IPs for the load balancer profile"
}

output "nat_gateway_profile_effective_outbound_ips" {
  value       = module.avm-ptn-aks-production.nat_gateway_profile_effective_outbound_ips
  description = "The effective outbound IPs for the NAT Gateway profile"
}

output "network_profile" {
  value       = module.avm-ptn-aks-production.network_profile
  description = "The network profile block for the Kubernetes cluster"
}

output "node_resource_group" {
  value       = module.avm-ptn-aks-production.node_resource_group
  description = "The auto-generated Resource Group containing resources for the Managed Kubernetes Cluster"
}

output "node_resource_group_id" {
  value       = module.avm-ptn-aks-production.node_resource_group_id
  description = "The ID of the Resource Group containing resources for the Managed Kubernetes Cluster"
}

output "oidc_issuer_url" {
  value       = module.avm-ptn-aks-production.oidc_issuer_url
  description = "The OIDC issuer URL that is associated with the cluster"
}

output "oms_agent_identity_client_id" {
  value       = module.avm-ptn-aks-production.oms_agent_identity_client_id
  description = "The Client ID of the user-defined Managed Identity used by the OMS Agents"
}

output "oms_agent_identity_object_id" {
  value       = module.avm-ptn-aks-production.oms_agent_identity_object_id
  description = "The Object ID of the user-defined Managed Identity used by the OMS Agents"
}

output "oms_agent_identity_user_assigned_identity_id" {
  value       = module.avm-ptn-aks-production.oms_agent_identity_user_assigned_identity_id
  description = "The ID of the User Assigned Identity used by the OMS Agents"
}

output "portal_fqdn" {
  value       = module.avm-ptn-aks-production.portal_fqdn
  description = "The FQDN for the Azure Portal resources when private link has been enabled"
}

output "private_fqdn" {
  value       = module.avm-ptn-aks-production.private_fqdn
  description = "The FQDN for the Kubernetes Cluster when private link has been enabled"
}

output "resource_id" {
  value       = module.avm-ptn-aks-production.resource_id
  description = "The Kubernetes Managed Cluster ID."
}

output "web_app_routing_web_app_routing_identity_client_id" {
  value       = module.avm-ptn-aks-production.web_app_routing_web_app_routing_identity_client_id
  description = "The Client ID of the user-defined Managed Identity used for Web App Routing"
}

output "web_app_routing_web_app_routing_identity_object_id" {
  value       = module.avm-ptn-aks-production.web_app_routing_web_app_routing_identity_object_id
  description = "The Object ID of the user-defined Managed Identity used for Web App Routing"
}

output "web_app_routing_web_app_routing_identity_user_assigned_identity_id" {
  value       = module.avm-ptn-aks-production.web_app_routing_web_app_routing_identity_user_assigned_identity_id
  description = "The ID of the User Assigned Identity used for Web App Routing"
}
