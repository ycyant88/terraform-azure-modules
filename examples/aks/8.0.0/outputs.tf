output "aci_connector_linux" {
  value       = module.aks.aci_connector_linux
  description = "The aci_connector_linux block of azurerm_kubernetes_cluster resource."
}

output "aci_connector_linux_enabled" {
  value       = module.aks.aci_connector_linux_enabled
  description = "Has aci_connector_linux been enabled on the azurerm_kubernetes_cluster resource?"
}

output "admin_client_certificate" {
  value       = module.aks.admin_client_certificate
  description = "The client_certificate in the azurerm_kubernetes_cluster's kube_admin_config block.  Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster."
}

output "admin_client_key" {
  value       = module.aks.admin_client_key
  description = "The client_key in the azurerm_kubernetes_cluster's kube_admin_config block. Base64 encoded private key used by clients to authenticate to the Kubernetes cluster."
}

output "admin_cluster_ca_certificate" {
  value       = module.aks.admin_cluster_ca_certificate
  description = "The cluster_ca_certificate in the azurerm_kubernetes_cluster's kube_admin_config block. Base64 encoded public CA certificate used as the root of trust for the Kubernetes cluster."
}

output "admin_host" {
  value       = module.aks.admin_host
  description = "The host in the azurerm_kubernetes_cluster's kube_admin_config block. The Kubernetes cluster server host."
}

output "admin_password" {
  value       = module.aks.admin_password
  description = "The password in the azurerm_kubernetes_cluster's kube_admin_config block. A password or token used to authenticate to the Kubernetes cluster."
}

output "admin_username" {
  value       = module.aks.admin_username
  description = "The username in the azurerm_kubernetes_cluster's kube_admin_config block. A username used to authenticate to the Kubernetes cluster."
}

output "aks_id" {
  value       = module.aks.aks_id
  description = "The azurerm_kubernetes_cluster's id."
}

output "aks_name" {
  value       = module.aks.aks_name
  description = "The aurerm_kubernetes-cluster's name."
}

output "azure_policy_enabled" {
  value       = module.aks.azure_policy_enabled
  description = "The azurerm_kubernetes_cluster's azure_policy_enabled argument. Should the Azure Policy Add-On be enabled? For more details please visit [Understand Azure Policy for Azure Kubernetes Service](https://docs.microsoft.com/en-ie/azure/governance/policy/concepts/rego-for-aks)"
}

output "azurerm_log_analytics_workspace_id" {
  value       = module.aks.azurerm_log_analytics_workspace_id
  description = "The id of the created Log Analytics workspace"
}

output "azurerm_log_analytics_workspace_name" {
  value       = module.aks.azurerm_log_analytics_workspace_name
  description = "The name of the created Log Analytics workspace"
}

output "azurerm_log_analytics_workspace_primary_shared_key" {
  value       = module.aks.azurerm_log_analytics_workspace_primary_shared_key
  description = "Specifies the workspace key of the log analytics workspace"
}

output "client_certificate" {
  value       = module.aks.client_certificate
  description = "The client_certificate in the azurerm_kubernetes_cluster's kube_config block. Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster."
}

output "client_key" {
  value       = module.aks.client_key
  description = "The client_key in the azurerm_kubernetes_cluster's kube_config block. Base64 encoded private key used by clients to authenticate to the Kubernetes cluster."
}

output "cluster_ca_certificate" {
  value       = module.aks.cluster_ca_certificate
  description = "The cluster_ca_certificate in the azurerm_kubernetes_cluster's kube_config block. Base64 encoded public CA certificate used as the root of trust for the Kubernetes cluster."
}

output "cluster_fqdn" {
  value       = module.aks.cluster_fqdn
  description = "The FQDN of the Azure Kubernetes Managed Cluster."
}

output "cluster_identity" {
  value       = module.aks.cluster_identity
  description = "The azurerm_kubernetes_cluster's identity block."
}

output "cluster_portal_fqdn" {
  value       = module.aks.cluster_portal_fqdn
  description = "The FQDN for the Azure Portal resources when private link has been enabled, which is only resolvable inside the Virtual Network used by the Kubernetes Cluster."
}

output "cluster_private_fqdn" {
  value       = module.aks.cluster_private_fqdn
  description = "The FQDN for the Kubernetes Cluster when private link has been enabled, which is only resolvable inside the Virtual Network used by the Kubernetes Cluster."
}

output "generated_cluster_private_ssh_key" {
  value       = module.aks.generated_cluster_private_ssh_key
  description = "The cluster will use this generated private key as ssh key when var.public_ssh_key is empty or null. Private key data in [PEM (RFC 1421)](https://datatracker.ietf.org/doc/html/rfc1421) format."
}

output "generated_cluster_public_ssh_key" {
  value       = module.aks.generated_cluster_public_ssh_key
  description = "The cluster will use this generated public key as ssh key when var.public_ssh_key is empty or null. The fingerprint of the public key data in OpenSSH MD5 hash format, e.g. aa:bb:cc:.... Only available if the selected private key format is compatible, similarly to public_key_openssh and the [ECDSA P224 limitations](https://registry.terraform.io/providers/hashicorp/tls/latest/docs#limitations)."
}

output "host" {
  value       = module.aks.host
  description = "The host in the azurerm_kubernetes_cluster's kube_config block. The Kubernetes cluster server host."
}

output "http_application_routing_zone_name" {
  value       = module.aks.http_application_routing_zone_name
  description = "The azurerm_kubernetes_cluster's http_application_routing_zone_name argument. The Zone Name of the HTTP Application Routing."
}

output "ingress_application_gateway" {
  value       = module.aks.ingress_application_gateway
  description = "The azurerm_kubernetes_cluster's ingress_application_gateway block."
}

output "ingress_application_gateway_enabled" {
  value       = module.aks.ingress_application_gateway_enabled
  description = "Has the azurerm_kubernetes_cluster turned on ingress_application_gateway block?"
}

output "key_vault_secrets_provider" {
  value       = module.aks.key_vault_secrets_provider
  description = "The azurerm_kubernetes_cluster's key_vault_secrets_provider block."
}

output "key_vault_secrets_provider_enabled" {
  value       = module.aks.key_vault_secrets_provider_enabled
  description = "Has the azurerm_kubernetes_cluster turned on key_vault_secrets_provider block?"
}

output "kube_admin_config_raw" {
  value       = module.aks.kube_admin_config_raw
  description = "The azurerm_kubernetes_cluster's kube_admin_config_raw argument. Raw Kubernetes config for the admin account to be used by [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/) and other compatible tools. This is only available when Role Based Access Control with Azure Active Directory is enabled and local accounts enabled."
}

output "kube_config_raw" {
  value       = module.aks.kube_config_raw
  description = "The azurerm_kubernetes_cluster's kube_config_raw argument. Raw Kubernetes config to be used by [kubectl](https://kubernetes.io/docs/reference/kubectl/overview/) and other compatible tools."
}

output "kubelet_identity" {
  value       = module.aks.kubelet_identity
  description = "The azurerm_kubernetes_cluster's kubelet_identity block."
}

output "location" {
  value       = module.aks.location
  description = "The azurerm_kubernetes_cluster's location argument. (Required) The location where the Managed Kubernetes Cluster should be created."
}

output "network_profile" {
  value       = module.aks.network_profile
  description = "The azurerm_kubernetes_cluster's network_profile block"
}

output "node_resource_group" {
  value       = module.aks.node_resource_group
  description = "The auto-generated Resource Group which contains the resources for this Managed Kubernetes Cluster."
}

output "oidc_issuer_url" {
  value       = module.aks.oidc_issuer_url
  description = "The OIDC issuer URL that is associated with the cluster."
}

output "oms_agent" {
  value       = module.aks.oms_agent
  description = "The azurerm_kubernetes_cluster's oms_agent argument."
}

output "oms_agent_enabled" {
  value       = module.aks.oms_agent_enabled
  description = "Has the azurerm_kubernetes_cluster turned on oms_agent block?"
}

output "open_service_mesh_enabled" {
  value       = module.aks.open_service_mesh_enabled
  description = "(Optional) Is Open Service Mesh enabled? For more details, please visit [Open Service Mesh for AKS](https://docs.microsoft.com/azure/aks/open-service-mesh-about)."
}

output "password" {
  value       = module.aks.password
  description = "The password in the azurerm_kubernetes_cluster's kube_config block. A password or token used to authenticate to the Kubernetes cluster."
}

output "username" {
  value       = module.aks.username
  description = "The username in the azurerm_kubernetes_cluster's kube_config block. A username used to authenticate to the Kubernetes cluster."
}

output "web_app_routing_identity" {
  value       = module.aks.web_app_routing_identity
  description = "The azurerm_kubernetes_cluster's web_app_routing_identity block, it's type is a list of object."
}
