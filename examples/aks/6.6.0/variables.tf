variable "aci_connector_linux_enabled" {
  description = "Enable Virtual Node pool"
  type        = bool
  default     = false
}

variable "aci_connector_linux_subnet_name" {
  description = "(Optional) aci_connector_linux subnet name"
  type        = string
  default     = null
}

variable "admin_username" {
  description = "The username of the local administrator to be created on the Kubernetes cluster. Set this variable to null to turn off the cluster's linux_profile. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "agents_availability_zones" {
  description = "(Optional) A list of Availability Zones across which the Node Pool should be spread. Changing this forces a new resource to be created."
  type        = list(string)
  default     = null
}

variable "agents_count" {
  description = "The number of Agents that should exist in the Agent Pool. Please set agents_count null while enable_auto_scaling is true to avoid possible agents_count changes."
  type        = number
  default     = 2
}

variable "agents_labels" {
  description = "(Optional) A map of Kubernetes labels which should be applied to nodes in the Default Node Pool. Changing this forces a new resource to be created."
  type        = map(string)
  default     = {}
}

variable "agents_max_count" {
  description = "Maximum number of nodes in a pool"
  type        = number
  default     = null
}

variable "agents_max_pods" {
  description = "(Optional) The maximum number of pods that can run on each agent. Changing this forces a new resource to be created."
  type        = number
  default     = null
}

variable "agents_min_count" {
  description = "Minimum number of nodes in a pool"
  type        = number
  default     = null
}

variable "agents_pool_name" {
  description = "The default Azure AKS agentpool (nodepool) name."
  type        = string
  default     = "nodepool"
}

variable "agents_size" {
  description = "The default virtual machine size for the Kubernetes agents"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "agents_tags" {
  description = "(Optional) A mapping of tags to assign to the Node Pool."
  type        = map(string)
  default     = {}
}

variable "agents_type" {
  description = "(Optional) The type of Node Pool which should be created. Possible values are AvailabilitySet and VirtualMachineScaleSets. Defaults to VirtualMachineScaleSets."
  type        = string
  default     = "VirtualMachineScaleSets"
}

variable "api_server_authorized_ip_ranges" {
  description = "(Optional) The IP ranges to allow for incoming traffic to the server nodes."
  type        = set(string)
  default     = null
}

variable "auto_scaler_profile_balance_similar_node_groups" {
  description = "Detect similar node groups and balance the number of nodes between them. Defaults to false."
  type        = bool
  default     = false
}

variable "auto_scaler_profile_empty_bulk_delete_max" {
  description = "Maximum number of empty nodes that can be deleted at the same time. Defaults to 10."
  type        = number
  default     = 10
}

variable "auto_scaler_profile_enabled" {
  description = "Enable configuring the auto scaler profile"
  type        = bool
  default     = false
}

variable "auto_scaler_profile_expander" {
  description = "Expander to use. Possible values are least-waste, priority, most-pods and random. Defaults to random."
  type        = string
  default     = "random"
}

variable "auto_scaler_profile_max_graceful_termination_sec" {
  description = "Maximum number of seconds the cluster autoscaler waits for pod termination when trying to scale down a node. Defaults to 600."
  type        = string
  default     = "600"
}

variable "auto_scaler_profile_max_node_provisioning_time" {
  description = "Maximum time the autoscaler waits for a node to be provisioned. Defaults to 15m."
  type        = string
  default     = "15m"
}

variable "auto_scaler_profile_max_unready_nodes" {
  description = "Maximum Number of allowed unready nodes. Defaults to 3."
  type        = number
  default     = 3
}

variable "auto_scaler_profile_max_unready_percentage" {
  description = "Maximum percentage of unready nodes the cluster autoscaler will stop if the percentage is exceeded. Defaults to 45."
  type        = number
  default     = 45
}

variable "auto_scaler_profile_new_pod_scale_up_delay" {
  description = "For scenarios like burst/batch scale where you don't want CA to act before the kubernetes scheduler could schedule all the pods, you can tell CA to ignore unscheduled pods before they're a certain age. Defaults to 10s."
  type        = string
  default     = "10s"
}

variable "auto_scaler_profile_scale_down_delay_after_add" {
  description = "How long after the scale up of AKS nodes the scale down evaluation resumes. Defaults to 10m."
  type        = string
  default     = "10m"
}

variable "auto_scaler_profile_scale_down_delay_after_delete" {
  description = "How long after node deletion that scale down evaluation resumes. Defaults to the value used for scan_interval."
  type        = string
  default     = null
}

variable "auto_scaler_profile_scale_down_delay_after_failure" {
  description = "How long after scale down failure that scale down evaluation resumes. Defaults to 3m."
  type        = string
  default     = "3m"
}

variable "auto_scaler_profile_scale_down_unneeded" {
  description = "How long a node should be unneeded before it is eligible for scale down. Defaults to 10m."
  type        = string
  default     = "10m"
}

variable "auto_scaler_profile_scale_down_unready" {
  description = "How long an unready node should be unneeded before it is eligible for scale down. Defaults to 20m."
  type        = string
  default     = "20m"
}

variable "auto_scaler_profile_scale_down_utilization_threshold" {
  description = "Node utilization level, defined as sum of requested resources divided by capacity, below which a node can be considered for scale down. Defaults to 0.5."
  type        = string
  default     = "0.5"
}

variable "auto_scaler_profile_scan_interval" {
  description = "How often the AKS Cluster should be re-evaluated for scale up/down. Defaults to 10s."
  type        = string
  default     = "10s"
}

variable "auto_scaler_profile_skip_nodes_with_local_storage" {
  description = "If true cluster autoscaler will never delete nodes with pods with local storage, for example, EmptyDir or HostPath. Defaults to true."
  type        = bool
  default     = true
}

variable "auto_scaler_profile_skip_nodes_with_system_pods" {
  description = "If true cluster autoscaler will never delete nodes with pods from kube-system (except for DaemonSet or mirror pods). Defaults to true."
  type        = bool
  default     = true
}

variable "automatic_channel_upgrade" {
  description = "(Optional) The upgrade channel for this Kubernetes Cluster. Possible values are patch, rapid, node-image and stable. By default automatic-upgrades are turned off. Note that you cannot use the patch upgrade channel and still specify the patch version using kubernetes_version. See [the documentation](https://learn.microsoft.com/en-us/azure/aks/auto-upgrade-cluster) for more information"
  type        = string
  default     = null
}

variable "azure_policy_enabled" {
  description = "Enable Azure Policy Addon."
  type        = bool
  default     = false
}

variable "client_id" {
  description = "(Optional) The Client ID (appId) for the Service Principal used for the AKS deployment"
  type        = string
  default     = ""
}

variable "client_secret" {
  description = "(Optional) The Client Secret (password) for the Service Principal used for the AKS deployment"
  type        = string
  default     = ""
}

variable "cluster_log_analytics_workspace_name" {
  description = "(Optional) The name of the Analytics workspace"
  type        = string
  default     = null
}

variable "cluster_name" {
  description = "(Optional) The name for the AKS resources created in the specified Azure Resource Group. This variable overwrites the 'prefix' var (The 'prefix' var will still be applied to the dns_prefix if it is set)"
  type        = string
  default     = null
}

variable "disk_encryption_set_id" {
  description = "(Optional) The ID of the Disk Encryption Set which should be used for the Nodes and Volumes. More information [can be found in the documentation](https://docs.microsoft.com/azure/aks/azure-disk-customer-managed-keys). Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "enable_auto_scaling" {
  description = "Enable node pool autoscaling"
  type        = bool
  default     = false
}

variable "enable_host_encryption" {
  description = "Enable Host Encryption for default node pool. Encryption at host feature must be enabled on the subscription: https://docs.microsoft.com/azure/virtual-machines/linux/disks-enable-host-based-encryption-cli"
  type        = bool
  default     = false
}

variable "enable_node_public_ip" {
  description = "(Optional) Should nodes in this Node Pool have a Public IP Address? Defaults to false."
  type        = bool
  default     = false
}

variable "http_application_routing_enabled" {
  description = "Enable HTTP Application Routing Addon (forces recreation)."
  type        = bool
  default     = false
}

variable "identity_ids" {
  description = "(Optional) Specifies a list of User Assigned Managed Identity IDs to be assigned to this Kubernetes Cluster."
  type        = list(string)
  default     = null
}

variable "identity_type" {
  description = "(Optional) The type of identity used for the managed cluster. Conflicts with client_id and client_secret. Possible values are SystemAssigned and UserAssigned. If UserAssigned is set, an identity_ids must be set as well."
  type        = string
  default     = "SystemAssigned"
}

variable "ingress_application_gateway_enabled" {
  description = "Whether to deploy the Application Gateway ingress controller to this Kubernetes Cluster?"
  type        = bool
  default     = false
}

variable "ingress_application_gateway_id" {
  description = "The ID of the Application Gateway to integrate with the ingress controller of this Kubernetes Cluster."
  type        = string
  default     = null
}

variable "ingress_application_gateway_name" {
  description = "The name of the Application Gateway to be used or created in the Nodepool Resource Group, which in turn will be integrated with the ingress controller of this Kubernetes Cluster."
  type        = string
  default     = null
}

variable "ingress_application_gateway_subnet_cidr" {
  description = "The subnet CIDR to be used to create an Application Gateway, which in turn will be integrated with the ingress controller of this Kubernetes Cluster."
  type        = string
  default     = null
}

variable "ingress_application_gateway_subnet_id" {
  description = "The ID of the subnet on which to create an Application Gateway, which in turn will be integrated with the ingress controller of this Kubernetes Cluster."
  type        = string
  default     = null
}

variable "key_vault_secrets_provider_enabled" {
  description = "(Optional) Whether to use the Azure Key Vault Provider for Secrets Store CSI Driver in an AKS cluster. For more details: https://docs.microsoft.com/en-us/azure/aks/csi-secrets-store-driver"
  type        = bool
  default     = false
}

variable "kms_enabled" {
  description = "(Optional) Enable Azure KeyVault Key Management Service."
  type        = bool
  default     = false
}

variable "kms_key_vault_key_id" {
  description = "(Optional) Identifier of Azure Key Vault key. When Azure Key Vault key management service is enabled, this field is required and must be a valid key identifier."
  type        = string
  default     = null
}

variable "kms_key_vault_network_access" {
  description = "(Optional) Network Access of Azure Key Vault. Possible values are: Private and Public."
  type        = string
  default     = "Public"
}

variable "kubernetes_version" {
  description = "Specify which Kubernetes release to use. The default used is the latest Kubernetes version available in the region"
  type        = string
  default     = null
}

variable "load_balancer_profile_enabled" {
  description = "(Optional) Enable a load_balancer_profile block. This can only be used when load_balancer_sku is set to standard."
  type        = bool
  default     = false
}

variable "load_balancer_profile_idle_timeout_in_minutes" {
  description = "(Optional) Desired outbound flow idle timeout in minutes for the cluster load balancer. Must be between 4 and 120 inclusive."
  type        = number
  default     = 30
}

variable "load_balancer_profile_managed_outbound_ip_count" {
  description = "(Optional) Count of desired managed outbound IPs for the cluster load balancer. Must be between 1 and 100 inclusive"
  type        = number
  default     = null
}

variable "load_balancer_profile_managed_outbound_ipv6_count" {
  description = "(Optional) The desired number of IPv6 outbound IPs created and managed by Azure for the cluster load balancer. Must be in the range of 1 to 100 (inclusive). The default value is 0 for single-stack and 1 for dual-stack. Note: managed_outbound_ipv6_count requires dual-stack networking. To enable dual-stack networking the Preview Feature Microsoft.ContainerService/AKS-EnableDualStack needs to be enabled and the Resource Provider re-registered, see the documentation for more information. https://learn.microsoft.com/en-us/azure/aks/configure-kubenet-dual-stack?tabs=azure-cli%2Ckubectl#register-the-aks-enabledualstack-preview-feature"
  type        = number
  default     = null
}

variable "load_balancer_profile_outbound_ip_address_ids" {
  description = "(Optional) The ID of the Public IP Addresses which should be used for outbound communication for the cluster load balancer."
  type        = set(string)
  default     = null
}

variable "load_balancer_profile_outbound_ip_prefix_ids" {
  description = "(Optional) The ID of the outbound Public IP Address Prefixes which should be used for the cluster load balancer."
  type        = set(string)
  default     = null
}

variable "load_balancer_profile_outbound_ports_allocated" {
  description = "(Optional) Number of desired SNAT port for each VM in the clusters load balancer. Must be between 0 and 64000 inclusive. Defaults to 0"
  type        = number
  default     = 0
}

variable "load_balancer_sku" {
  description = "(Optional) Specifies the SKU of the Load Balancer used for this Kubernetes Cluster. Possible values are basic and standard. Defaults to standard. Changing this forces a new kubernetes cluster to be created."
  type        = string
  default     = "standard"
}

variable "local_account_disabled" {
  description = "(Optional) - If true local accounts will be disabled. Defaults to false. See [the documentation](https://docs.microsoft.com/azure/aks/managed-aad#disable-local-accounts) for more information."
  type        = bool
  default     = null
}

variable "location" {
  description = "Location of cluster, if not defined it will be read from the resource-group"
  type        = string
  default     = null
}

variable "log_analytics_solution_id" {
  description = "(Optional) Existing azurerm_log_analytics_solution ID. Providing ID disables creation of azurerm_log_analytics_solution."
  type        = string
  default     = null
}

variable "log_analytics_workspace" {
  description = "(Optional) Existing azurerm_log_analytics_workspace to attach azurerm_log_analytics_solution. Providing the config disables creation of azurerm_log_analytics_workspace."
  type = object({
    id   = string
    name = string
  })
  default = null
}

variable "log_analytics_workspace_enabled" {
  description = "Enable the integration of azurerm_log_analytics_workspace and azurerm_log_analytics_solution: https://docs.microsoft.com/en-us/azure/azure-monitor/containers/container-insights-onboard"
  type        = bool
  default     = true
}

variable "log_analytics_workspace_resource_group_name" {
  description = "(Optional) Resource group name to create azurerm_log_analytics_solution."
  type        = string
  default     = null
}

variable "log_analytics_workspace_sku" {
  description = "The SKU (pricing level) of the Log Analytics workspace. For new subscriptions the SKU should be set to PerGB2018"
  type        = string
  default     = "PerGB2018"
}

variable "log_retention_in_days" {
  description = "The retention period for the logs in days"
  type        = number
  default     = 30
}

variable "maintenance_window" {
  description = "(Optional) Maintenance configuration of the managed cluster."
  type = object({
    allowed = list(object({
      day   = string
      hours = set(number)
    })),
    not_allowed = list(object({
      end   = string
      start = string
    })),
  })
  default = null
}

variable "microsoft_defender_enabled" {
  description = "(Optional) Is Microsoft Defender on the cluster enabled? Requires var.log_analytics_workspace_enabled to be true to set this variable to true."
  type        = bool
  default     = false
}

variable "net_profile_dns_service_ip" {
  description = "(Optional) IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns). Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "net_profile_docker_bridge_cidr" {
  description = "(Optional) IP address (in CIDR notation) used as the Docker bridge IP address on nodes. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "net_profile_outbound_type" {
  description = "(Optional) The outbound (egress) routing method which should be used for this Kubernetes Cluster. Possible values are loadBalancer and userDefinedRouting. Defaults to loadBalancer."
  type        = string
  default     = "loadBalancer"
}

variable "net_profile_pod_cidr" {
  description = " (Optional) The CIDR to use for pod IP addresses. This field can only be set when network_plugin is set to kubenet. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "net_profile_service_cidr" {
  description = "(Optional) The Network Range used by the Kubernetes service. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "network_plugin" {
  description = "Network plugin to use for networking."
  type        = string
  default     = "kubenet"
}

variable "network_policy" {
  description = " (Optional) Sets up network policy to be used with Azure CNI. Network policy allows us to control the traffic flow between pods. Currently supported values are calico and azure. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "node_resource_group" {
  description = "The auto-generated Resource Group which contains the resources for this Managed Kubernetes Cluster. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "oidc_issuer_enabled" {
  description = "Enable or Disable the OIDC issuer URL. Defaults to false."
  type        = bool
  default     = false
}

variable "only_critical_addons_enabled" {
  description = "(Optional) Enabling this option will taint default node pool with CriticalAddonsOnly=true:NoSchedule taint. Changing this forces a new resource to be created."
  type        = bool
  default     = null
}

variable "open_service_mesh_enabled" {
  description = "Is Open Service Mesh enabled? For more details, please visit [Open Service Mesh for AKS](https://docs.microsoft.com/azure/aks/open-service-mesh-about)."
  type        = bool
  default     = null
}

variable "orchestrator_version" {
  description = "Specify which Kubernetes release to use for the orchestration layer. The default used is the latest Kubernetes version available in the region"
  type        = string
  default     = null
}

variable "os_disk_size_gb" {
  description = "Disk size of nodes in GBs."
  type        = number
  default     = 50
}

variable "os_disk_type" {
  description = "The type of disk which should be used for the Operating System. Possible values are Ephemeral and Managed. Defaults to Managed. Changing this forces a new resource to be created."
  type        = string
  default     = "Managed"
}

variable "pod_subnet_id" {
  description = "(Optional) The ID of the Subnet where the pods in the default Node Pool should exist. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "prefix" {
  description = "(Required) The prefix for the resources created in the specified Azure Resource Group"
  type        = string
  default     = ""
}

variable "private_cluster_enabled" {
  description = "If true cluster API server will be exposed only on internal IP address and available only in cluster vnet."
  type        = bool
  default     = false
}

variable "private_cluster_public_fqdn_enabled" {
  description = "(Optional) Specifies whether a Public FQDN for this Private Cluster should be added. Defaults to false."
  type        = bool
  default     = false
}

variable "private_dns_zone_id" {
  description = "(Optional) Either the ID of Private DNS Zone which should be delegated to this Cluster, System to have AKS manage this or None. In case of None you will need to bring your own DNS server and set up resolving, otherwise cluster will have issues after provisioning. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "public_ssh_key" {
  description = "A custom ssh key to control access to the AKS cluster. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "rbac_aad" {
  description = "(Optional) Is Azure Active Directory ingration enabled?"
  type        = bool
  default     = true
}

variable "rbac_aad_admin_group_object_ids" {
  description = "Object ID of groups with admin access."
  type        = list(string)
  default     = null
}

variable "rbac_aad_azure_rbac_enabled" {
  description = "(Optional) Is Role Based Access Control based on Azure AD enabled?"
  type        = bool
  default     = null
}

variable "rbac_aad_client_app_id" {
  description = "The Client ID of an Azure Active Directory Application."
  type        = string
  default     = null
}

variable "rbac_aad_managed" {
  description = "Is the Azure Active Directory integration Managed, meaning that Azure will create/manage the Service Principal used for integration."
  type        = bool
  default     = false
}

variable "rbac_aad_server_app_id" {
  description = "The Server ID of an Azure Active Directory Application."
  type        = string
  default     = null
}

variable "rbac_aad_server_app_secret" {
  description = "The Server Secret of an Azure Active Directory Application."
  type        = string
  default     = null
}

variable "rbac_aad_tenant_id" {
  description = "(Optional) The Tenant ID used for Azure Active Directory Application. If this isn't specified the Tenant ID of the current Subscription is used."
  type        = string
  default     = null
}

variable "resource_group_name" {
  description = "The resource group name to be imported"
  type        = string
  default     = ""
}

variable "role_based_access_control_enabled" {
  description = "Enable Role Based Access Control."
  type        = bool
  default     = false
}

variable "scale_down_mode" {
  description = "(Optional) Specifies the autoscaling behaviour of the Kubernetes Cluster. If not specified, it defaults to Delete. Possible values include Delete and Deallocate. Changing this forces a new resource to be created."
  type        = string
  default     = "Delete"
}

variable "secret_rotation_enabled" {
  description = "Is secret rotation enabled? This variable is only used when key_vault_secrets_provider_enabled is true and defaults to false"
  type        = bool
  default     = false
}

variable "secret_rotation_interval" {
  description = "The interval to poll for secret rotation. This attribute is only set when secret_rotation is true and defaults to 2m"
  type        = string
  default     = "2m"
}

variable "sku_tier" {
  description = "The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free and Paid"
  type        = string
  default     = "Free"
}

variable "storage_profile_blob_driver_enabled" {
  description = "(Optional) Is the Blob CSI driver enabled? Defaults to false"
  type        = bool
  default     = false
}

variable "storage_profile_disk_driver_enabled" {
  description = "(Optional) Is the Disk CSI driver enabled? Defaults to true"
  type        = bool
  default     = true
}

variable "storage_profile_disk_driver_version" {
  description = "(Optional) Disk CSI Driver version to be used. Possible values are v1 and v2. Defaults to v1."
  type        = string
  default     = "v1"
}

variable "storage_profile_enabled" {
  description = "Enable storage profile"
  type        = bool
  default     = false
}

variable "storage_profile_file_driver_enabled" {
  description = "(Optional) Is the File CSI driver enabled? Defaults to true"
  type        = bool
  default     = true
}

variable "storage_profile_snapshot_controller_enabled" {
  description = "(Optional) Is the Snapshot Controller enabled? Defaults to true"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Any tags that should be present on the AKS cluster resources"
  type        = map(string)
  default     = {}
}

variable "ultra_ssd_enabled" {
  description = "(Optional) Used to specify whether the UltraSSD is enabled in the Default Node Pool. Defaults to false."
  type        = bool
  default     = false
}

variable "vnet_subnet_id" {
  description = "(Optional) The ID of a Subnet where the Kubernetes Node Pool should exist. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "workload_identity_enabled" {
  description = "Enable or Disable Workload Identity. Defaults to false."
  type        = bool
  default     = false
}
