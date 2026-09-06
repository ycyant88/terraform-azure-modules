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

variable "agents_pool_kubelet_configs" {
  description = "  list(object({\n    cpu_manager_policy        = (Optional) Specifies the CPU Manager policy to use. Possible values are none and static, Changing this forces a new resource to be created.\n    cpu_cfs_quota_enabled     = (Optional) Is CPU CFS quota enforcement for containers enabled? Changing this forces a new resource to be created.\n    cpu_cfs_quota_period      = (Optional) Specifies the CPU CFS quota period value. Changing this forces a new resource to be created.\n    image_gc_high_threshold   = (Optional) Specifies the percent of disk usage above which image garbage collection is always run. Must be between 0 and 100. Changing this forces a new resource to be created.\n    image_gc_low_threshold    = (Optional) Specifies the percent of disk usage lower than which image garbage collection is never run. Must be between 0 and 100. Changing this forces a new resource to be created.\n    topology_manager_policy   = (Optional) Specifies the Topology Manager policy to use. Possible values are none, best-effort, restricted or single-numa-node. Changing this forces a new resource to be created.\n    allowed_unsafe_sysctls    = (Optional) Specifies the allow list of unsafe sysctls command or patterns (ending in *). Changing this forces a new resource to be created.\n    container_log_max_size_mb = (Optional) Specifies the maximum size (e.g. 10MB) of container log file before it is rotated. Changing this forces a new resource to be created.\n    container_log_max_line    = (Optional) Specifies the maximum number of container log files that can be present for a container. must be at least 2. Changing this forces a new resource to be created.\n    pod_max_pid               = (Optional) Specifies the maximum number of processes per pod. Changing this forces a new resource to be created.\n}))\n"
  type = list(object({
    cpu_manager_policy        = optional(string)
    cpu_cfs_quota_enabled     = optional(bool, true)
    cpu_cfs_quota_period      = optional(string)
    image_gc_high_threshold   = optional(number)
    image_gc_low_threshold    = optional(number)
    topology_manager_policy   = optional(string)
    allowed_unsafe_sysctls    = optional(set(string))
    container_log_max_size_mb = optional(number)
    container_log_max_line    = optional(number)
    pod_max_pid               = optional(number)
  }))
  default = []
}

variable "agents_pool_linux_os_configs" {
  description = "list(object({\n  sysctl_configs = optional(list(object({\n    fs_aio_max_nr                      = (Optional) The sysctl setting fs.aio-max-nr. Must be between 65536 and 6553500. Changing this forces a new resource to be created.\n    fs_file_max                        = (Optional) The sysctl setting fs.file-max. Must be between 8192 and 12000500. Changing this forces a new resource to be created.\n    fs_inotify_max_user_watches        = (Optional) The sysctl setting fs.inotify.max_user_watches. Must be between 781250 and 2097152. Changing this forces a new resource to be created.\n    fs_nr_open                         = (Optional) The sysctl setting fs.nr_open. Must be between 8192 and 20000500. Changing this forces a new resource to be created.\n    kernel_threads_max                 = (Optional) The sysctl setting kernel.threads-max. Must be between 20 and 513785. Changing this forces a new resource to be created.\n    net_core_netdev_max_backlog        = (Optional) The sysctl setting net.core.netdev_max_backlog. Must be between 1000 and 3240000. Changing this forces a new resource to be created.\n    net_core_optmem_max                = (Optional) The sysctl setting net.core.optmem_max. Must be between 20480 and 4194304. Changing this forces a new resource to be created.\n    net_core_rmem_default              = (Optional) The sysctl setting net.core.rmem_default. Must be between 212992 and 134217728. Changing this forces a new resource to be created.\n    net_core_rmem_max                  = (Optional) The sysctl setting net.core.rmem_max. Must be between 212992 and 134217728. Changing this forces a new resource to be created.\n    net_core_somaxconn                 = (Optional) The sysctl setting net.core.somaxconn. Must be between 4096 and 3240000. Changing this forces a new resource to be created.\n    net_core_wmem_default              = (Optional) The sysctl setting net.core.wmem_default. Must be between 212992 and 134217728. Changing this forces a new resource to be created.\n    net_core_wmem_max                  = (Optional) The sysctl setting net.core.wmem_max. Must be between 212992 and 134217728. Changing this forces a new resource to be created.\n    net_ipv4_ip_local_port_range_min   = (Optional) The sysctl setting net.ipv4.ip_local_port_range max value. Must be between 1024 and 60999. Changing this forces a new resource to be created.\n    net_ipv4_ip_local_port_range_max   = (Optional) The sysctl setting net.ipv4.ip_local_port_range min value. Must be between 1024 and 60999. Changing this forces a new resource to be created.\n    net_ipv4_neigh_default_gc_thresh1  = (Optional) The sysctl setting net.ipv4.neigh.default.gc_thresh1. Must be between 128 and 80000. Changing this forces a new resource to be created.\n    net_ipv4_neigh_default_gc_thresh2  = (Optional) The sysctl setting net.ipv4.neigh.default.gc_thresh2. Must be between 512 and 90000. Changing this forces a new resource to be created.\n    net_ipv4_neigh_default_gc_thresh3  = (Optional) The sysctl setting net.ipv4.neigh.default.gc_thresh3. Must be between 1024 and 100000. Changing this forces a new resource to be created.\n    net_ipv4_tcp_fin_timeout           = (Optional) The sysctl setting net.ipv4.tcp_fin_timeout. Must be between 5 and 120. Changing this forces a new resource to be created.\n    net_ipv4_tcp_keepalive_intvl       = (Optional) The sysctl setting net.ipv4.tcp_keepalive_intvl. Must be between 10 and 75. Changing this forces a new resource to be created.\n    net_ipv4_tcp_keepalive_probes      = (Optional) The sysctl setting net.ipv4.tcp_keepalive_probes. Must be between 1 and 15. Changing this forces a new resource to be created.\n    net_ipv4_tcp_keepalive_time        = (Optional) The sysctl setting net.ipv4.tcp_keepalive_time. Must be between 30 and 432000. Changing this forces a new resource to be created.\n    net_ipv4_tcp_max_syn_backlog       = (Optional) The sysctl setting net.ipv4.tcp_max_syn_backlog. Must be between 128 and 3240000. Changing this forces a new resource to be created.\n    net_ipv4_tcp_max_tw_buckets        = (Optional) The sysctl setting net.ipv4.tcp_max_tw_buckets. Must be between 8000 and 1440000. Changing this forces a new resource to be created.\n    net_ipv4_tcp_tw_reuse              = (Optional) The sysctl setting net.ipv4.tcp_tw_reuse. Changing this forces a new resource to be created.\n    net_netfilter_nf_conntrack_buckets = (Optional) The sysctl setting net.netfilter.nf_conntrack_buckets. Must be between 65536 and 147456. Changing this forces a new resource to be created.\n    net_netfilter_nf_conntrack_max     = (Optional) The sysctl setting net.netfilter.nf_conntrack_max. Must be between 131072 and 1048576. Changing this forces a new resource to be created.\n    vm_max_map_count                   = (Optional) The sysctl setting vm.max_map_count. Must be between 65530 and 262144. Changing this forces a new resource to be created.\n    vm_swappiness                      = (Optional) The sysctl setting vm.swappiness. Must be between 0 and 100. Changing this forces a new resource to be created.\n    vm_vfs_cache_pressure              = (Optional) The sysctl setting vm.vfs_cache_pressure. Must be between 0 and 100. Changing this forces a new resource to be created.\n  })), [])\n  transparent_huge_page_enabled = (Optional) Specifies the Transparent Huge Page enabled configuration. Possible values are always, madvise and never. Changing this forces a new resource to be created.\n  transparent_huge_page_defrag  = (Optional) specifies the defrag configuration for Transparent Huge Page. Possible values are always, defer, defer+madvise, madvise and never. Changing this forces a new resource to be created.\n  swap_file_size_mb             = (Optional) Specifies the size of the swap file on each node in MB. Changing this forces a new resource to be created.\n}))\n"
  type = list(object({
    sysctl_configs = optional(list(object({
      fs_aio_max_nr                      = optional(number)
      fs_file_max                        = optional(number)
      fs_inotify_max_user_watches        = optional(number)
      fs_nr_open                         = optional(number)
      kernel_threads_max                 = optional(number)
      net_core_netdev_max_backlog        = optional(number)
      net_core_optmem_max                = optional(number)
      net_core_rmem_default              = optional(number)
      net_core_rmem_max                  = optional(number)
      net_core_somaxconn                 = optional(number)
      net_core_wmem_default              = optional(number)
      net_core_wmem_max                  = optional(number)
      net_ipv4_ip_local_port_range_min   = optional(number)
      net_ipv4_ip_local_port_range_max   = optional(number)
      net_ipv4_neigh_default_gc_thresh1  = optional(number)
      net_ipv4_neigh_default_gc_thresh2  = optional(number)
      net_ipv4_neigh_default_gc_thresh3  = optional(number)
      net_ipv4_tcp_fin_timeout           = optional(number)
      net_ipv4_tcp_keepalive_intvl       = optional(number)
      net_ipv4_tcp_keepalive_probes      = optional(number)
      net_ipv4_tcp_keepalive_time        = optional(number)
      net_ipv4_tcp_max_syn_backlog       = optional(number)
      net_ipv4_tcp_max_tw_buckets        = optional(number)
      net_ipv4_tcp_tw_reuse              = optional(bool)
      net_netfilter_nf_conntrack_buckets = optional(number)
      net_netfilter_nf_conntrack_max     = optional(number)
      vm_max_map_count                   = optional(number)
      vm_swappiness                      = optional(number)
      vm_vfs_cache_pressure              = optional(number)
    })), [])
    transparent_huge_page_enabled = optional(string)
    transparent_huge_page_defrag  = optional(string)
    swap_file_size_mb             = optional(number)
  }))
  default = []
}

variable "agents_pool_max_surge" {
  description = "The maximum number or percentage of nodes which will be added to the Default Node Pool size during an upgrade."
  type        = string
  default     = null
}

variable "agents_pool_name" {
  description = "The default Azure AKS agentpool (nodepool) name."
  type        = string
  default     = "nodepool"
}

variable "agents_proximity_placement_group_id" {
  description = "(Optional) The ID of the Proximity Placement Group of the default Azure AKS agentpool (nodepool). Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "agents_size" {
  description = "The default virtual machine size for the Kubernetes agents. Changing this without specifying var.temporary_name_for_rotation forces a new resource to be created."
  type        = string
  default     = "Standard_D2s_v3"
}

variable "agents_tags" {
  description = "(Optional) A mapping of tags to assign to the Node Pool."
  type        = map(string)
  default     = {}
}

variable "agents_taints" {
  description = "(Optional) A list of the taints added to new nodes during node pool create and scale. Changing this forces a new resource to be created."
  type        = list(string)
  default     = null
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

variable "api_server_subnet_id" {
  description = "(Optional) The ID of the Subnet where the API server endpoint is delegated to."
  type        = string
  default     = null
}

variable "attached_acr_id_map" {
  description = "Azure Container Registry ids that need an authentication mechanism with Azure Kubernetes Service (AKS). Map key must be static string as acr's name, the value is acr's resource id. Changing this forces some new resources to be created."
  type        = map(string)
  default     = {}
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
  description = "(Optional) The upgrade channel for this Kubernetes Cluster. Possible values are patch, rapid, node-image and stable. By default automatic-upgrades are turned off. Note that you cannot specify the patch version using kubernetes_version or orchestrator_version when using the patch upgrade channel. See [the documentation](https://learn.microsoft.com/en-us/azure/aks/auto-upgrade-cluster) for more information"
  type        = string
  default     = null
}

variable "azure_policy_enabled" {
  description = "Enable Azure Policy Addon."
  type        = bool
  default     = false
}

variable "brown_field_application_gateway_for_ingress" {
  description = "[Definition of brown_field](https://learn.microsoft.com/en-us/azure/application-gateway/tutorial-ingress-controller-add-on-existing)\n* id - (Required) The ID of the Application Gateway that be used as cluster ingress.\n* subnet_id - (Required) The ID of the Subnet which the Application Gateway is connected to. Must be set when create_role_assignments is true.\n"
  type = object({
    id        = string
    subnet_id = string
  })
  default = null
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

variable "cluster_name_random_suffix" {
  description = "Whether to add a random suffix on Aks cluster's name or not. azurerm_kubernetes_cluster resource defined in this module is create_before_destroy = true implicity now(described [here](https://github.com/Azure/terraform-azurerm-aks/issues/389)), without this random suffix we'll not be able to recreate this cluster directly due to the naming conflict."
  type        = bool
  default     = false
}

variable "confidential_computing" {
  description = "(Optional) Enable Confidential Computing."
  type = object({
    sgx_quote_helper_enabled = bool
  })
  default = null
}

variable "create_role_assignment_network_contributor" {
  description = "(Deprecated) Create a role assignment for the AKS Service Principal to be a Network Contributor on the subnets used for the AKS Cluster"
  type        = bool
  default     = false
}

variable "create_role_assignments_for_application_gateway" {
  description = "(Optional) Whether to create the corresponding role assignments for application gateway or not. Defaults to true."
  type        = bool
  default     = true
}

variable "default_node_pool_fips_enabled" {
  description = " (Optional) Should the nodes in this Node Pool have Federal Information Processing Standard enabled? Changing this forces a new resource to be created."
  type        = bool
  default     = null
}

variable "disk_encryption_set_id" {
  description = "(Optional) The ID of the Disk Encryption Set which should be used for the Nodes and Volumes. More information [can be found in the documentation](https://docs.microsoft.com/azure/aks/azure-disk-customer-managed-keys). Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "ebpf_data_plane" {
  description = "(Optional) Specifies the eBPF data plane used for building the Kubernetes network. Possible value is cilium. Changing this forces a new resource to be created."
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

variable "green_field_application_gateway_for_ingress" {
  description = "[Definition of green_field](https://learn.microsoft.com/en-us/azure/application-gateway/tutorial-ingress-controller-add-on-new)\n* name - (Optional) The name of the Application Gateway to be used or created in the Nodepool Resource Group, which in turn will be integrated with the ingress controller of this Kubernetes Cluster.\n* subnet_cidr - (Optional) The subnet CIDR to be used to create an Application Gateway, which in turn will be integrated with the ingress controller of this Kubernetes Cluster.\n* subnet_id - (Optional) The ID of the subnet on which to create an Application Gateway, which in turn will be integrated with the ingress controller of this Kubernetes Cluster.\n"
  type = object({
    name        = optional(string)
    subnet_cidr = optional(string)
    subnet_id   = optional(string)
  })
  default = null
}

variable "http_proxy_config" {
  description = "  optional(object({\n    http_proxy  = (Optional) The proxy address to be used when communicating over HTTP.\n    https_proxy = (Optional) The proxy address to be used when communicating over HTTPS.\n    no_proxy    = (Optional) The list of domains that will not use the proxy for communication. Note: If you specify the default_node_pool.0.vnet_subnet_id, be sure to include the Subnet CIDR in the no_proxy list. Note: You may wish to use Terraform's ignore_changes functionality to ignore the changes to this field.\n    trusted_ca  = (Optional) The base64 encoded alternative CA certificate content in PEM format.\n}))\nOnce you have set only one of http_proxy and https_proxy, this config would be used for both http_proxy and https_proxy to avoid a configuration drift.\n"
  type = object({
    http_proxy  = optional(string)
    https_proxy = optional(string)
    no_proxy    = optional(list(string))
    trusted_ca  = optional(string)
  })
  default = null
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

variable "image_cleaner_enabled" {
  description = "(Optional) Specifies whether Image Cleaner is enabled."
  type        = bool
  default     = false
}

variable "image_cleaner_interval_hours" {
  description = "(Optional) Specifies the interval in hours when images should be cleaned up. Defaults to 48."
  type        = number
  default     = 48
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

variable "kubelet_identity" {
  description = "- client_id - (Optional) The Client ID of the user-defined Managed Identity to be assigned to the Kubelets. If not specified a Managed Identity is created automatically. Changing this forces a new resource to be created.\n- object_id - (Optional) The Object ID of the user-defined Managed Identity assigned to the Kubelets.If not specified a Managed Identity is created automatically. Changing this forces a new resource to be created.\n- user_assigned_identity_id - (Optional) The ID of the User Assigned Identity assigned to the Kubelets. If not specified a Managed Identity is created automatically. Changing this forces a new resource to be created.\n"
  type = object({
    client_id                 = optional(string)
    object_id                 = optional(string)
    user_assigned_identity_id = optional(string)
  })
  default = null
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

variable "log_analytics_solution" {
  description = "(Optional) Object which contains existing azurerm_log_analytics_solution ID. Providing ID disables creation of azurerm_log_analytics_solution."
  type = object({
    id = string
  })
  default = null
}

variable "log_analytics_workspace" {
  description = "(Optional) Existing azurerm_log_analytics_workspace to attach azurerm_log_analytics_solution. Providing the config disables creation of azurerm_log_analytics_workspace."
  type = object({
    id                  = string
    name                = string
    location            = optional(string)
    resource_group_name = optional(string)
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
    allowed = optional(list(object({
      day   = string
      hours = set(number)
      })), [
    ]),
    not_allowed = optional(list(object({
      end   = string
      start = string
    })), []),
  })
  default = null
}

variable "maintenance_window_auto_upgrade" {
  description = "- day_of_month - (Optional) The day of the month for the maintenance run. Required in combination with RelativeMonthly frequency. Value between 0 and 31 (inclusive).\n- day_of_week - (Optional) The day of the week for the maintenance run. Options are Monday, Tuesday, Wednesday, Thurday, Friday, Saturday and Sunday. Required in combination with weekly frequency.\n- duration - (Required) The duration of the window for maintenance to run in hours.\n- frequency - (Required) Frequency of maintenance. Possible options are Weekly, AbsoluteMonthly and RelativeMonthly.\n- interval - (Required) The interval for maintenance runs. Depending on the frequency this interval is week or month based.\n- start_date - (Optional) The date on which the maintenance window begins to take effect.\n- start_time - (Optional) The time for maintenance to begin, based on the timezone determined by utc_offset. Format is HH:mm.\n- utc_offset - (Optional) Used to determine the timezone for cluster maintenance.\n- week_index - (Optional) The week in the month used for the maintenance run. Options are First, Second, Third, Fourth, and Last.\n\n---\nnot_allowed block supports the following:\n- end - (Required) The end of a time span, formatted as an RFC3339 string.\n- start - (Required) The start of a time span, formatted as an RFC3339 string.\n"
  type = object({
    day_of_month = optional(number)
    day_of_week  = optional(string)
    duration     = number
    frequency    = string
    interval     = number
    start_date   = optional(string)
    start_time   = optional(string)
    utc_offset   = optional(string)
    week_index   = optional(string)
    not_allowed = optional(set(object({
      end   = string
      start = string
    })))
  })
  default = null
}

variable "maintenance_window_node_os" {
  description = "- day_of_month -\n- day_of_week - (Optional) The day of the week for the maintenance run. Options are Monday, Tuesday, Wednesday, Thurday, Friday, Saturday and Sunday. Required in combination with weekly frequency.\n- duration - (Required) The duration of the window for maintenance to run in hours.\n- frequency - (Required) Frequency of maintenance. Possible options are Daily, Weekly, AbsoluteMonthly and RelativeMonthly.\n- interval - (Required) The interval for maintenance runs. Depending on the frequency this interval is week or month based.\n- start_date - (Optional) The date on which the maintenance window begins to take effect.\n- start_time - (Optional) The time for maintenance to begin, based on the timezone determined by utc_offset. Format is HH:mm.\n- utc_offset - (Optional) Used to determine the timezone for cluster maintenance.\n- week_index - (Optional) The week in the month used for the maintenance run. Options are First, Second, Third, Fourth, and Last.\n\n---\nnot_allowed block supports the following:\n- end - (Required) The end of a time span, formatted as an RFC3339 string.\n- start - (Required) The start of a time span, formatted as an RFC3339 string.\n"
  type = object({
    day_of_month = optional(number)
    day_of_week  = optional(string)
    duration     = number
    frequency    = string
    interval     = number
    start_date   = optional(string)
    start_time   = optional(string)
    utc_offset   = optional(string)
    week_index   = optional(string)
    not_allowed = optional(set(object({
      end   = string
      start = string
    })))
  })
  default = null
}

variable "microsoft_defender_enabled" {
  description = "(Optional) Is Microsoft Defender on the cluster enabled? Requires var.log_analytics_workspace_enabled to be true to set this variable to true."
  type        = bool
  default     = false
}

variable "monitor_metrics" {
  description = "(Optional) Specifies a Prometheus add-on profile for the Kubernetes Cluster\nobject({\n  annotations_allowed = \"(Optional) Specifies a comma-separated list of Kubernetes annotation keys that will be used in the resource's labels metric.\"\n  labels_allowed      = \"(Optional) Specifies a Comma-separated list of additional Kubernetes label keys that will be used in the resource's labels metric.\"\n})\n"
  type = object({
    annotations_allowed = optional(string)
    labels_allowed      = optional(string)
  })
  default = null
}

variable "msi_auth_for_monitoring_enabled" {
  description = "(Optional) Is managed identity authentication for monitoring enabled?"
  type        = bool
  default     = null
}

variable "net_profile_dns_service_ip" {
  description = "(Optional) IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns). Changing this forces a new resource to be created."
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

variable "network_contributor_role_assigned_subnet_ids" {
  description = "Create role assignments for the AKS Service Principal to be a Network Contributor on the subnets used for the AKS Cluster, key should be static string, value should be subnet's id"
  type        = map(string)
  default     = {}
}

variable "network_plugin" {
  description = "Network plugin to use for networking."
  type        = string
  default     = "kubenet"
}

variable "network_plugin_mode" {
  description = "(Optional) Specifies the network plugin mode used for building the Kubernetes network. Possible value is Overlay. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "network_policy" {
  description = " (Optional) Sets up network policy to be used with Azure CNI. Network policy allows us to control the traffic flow between pods. Currently supported values are calico and azure. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "node_os_channel_upgrade" {
  description = " (Optional) The upgrade channel for this Kubernetes Cluster Nodes' OS Image. Possible values are Unmanaged, SecurityPatch, NodeImage and None."
  type        = string
  default     = null
}

variable "node_pools" {
  description = "A map of node pools that need to be created and attached on the Kubernetes cluster. The key of the map can be the name of the node pool, and the key must be static string. The value of the map is a node_pool block as defined below:\nmap(object({\n  name                          = (Required) The name of the Node Pool which should be created within the Kubernetes Cluster. Changing this forces a new resource to be created. A Windows Node Pool cannot have a name longer than 6 characters. A random suffix of 4 characters is always added to the name to avoid clashes during recreates.\n  node_count                    = (Optional) The initial number of nodes which should exist within this Node Pool. Valid values are between 0 and 1000 (inclusive) for user pools and between 1 and 1000 (inclusive) for system pools and must be a value in the range min_count - max_count.\n  tags                          = (Optional) A mapping of tags to assign to the resource. At this time there's a bug in the AKS API where Tags for a Node Pool are not stored in the correct case - you [may wish to use Terraform's ignore_changes functionality to ignore changes to the casing](https://www.terraform.io/language/meta-arguments/lifecycle#ignore_changess) until this is fixed in the AKS API.\n  vm_size                       = (Required) The SKU which should be used for the Virtual Machines used in this Node Pool. Changing this forces a new resource to be created.\n  host_group_id                 = (Optional) The fully qualified resource ID of the Dedicated Host Group to provision virtual machines from. Changing this forces a new resource to be created.\n  capacity_reservation_group_id = (Optional) Specifies the ID of the Capacity Reservation Group where this Node Pool should exist. Changing this forces a new resource to be created.\n  custom_ca_trust_enabled       = (Optional) Specifies whether to trust a Custom CA. This requires that the Preview Feature Microsoft.ContainerService/CustomCATrustPreview is enabled and the Resource Provider is re-registered, see [the documentation](https://learn.microsoft.com/en-us/azure/aks/custom-certificate-authority) for more information.\n  enable_auto_scaling           = (Optional) Whether to enable [auto-scaler](https://docs.microsoft.com/azure/aks/cluster-autoscaler).\n  enable_host_encryption        = (Optional) Should the nodes in this Node Pool have host encryption enabled? Changing this forces a new resource to be created.\n  enable_node_public_ip         = (Optional) Should each node have a Public IP Address? Changing this forces a new resource to be created.\n  eviction_policy               = (Optional) The Eviction Policy which should be used for Virtual Machines within the Virtual Machine Scale Set powering this Node Pool. Possible values are Deallocate and Delete. Changing this forces a new resource to be created. An Eviction Policy can only be configured when priority is set to Spot and will default to Delete unless otherwise specified.\n  gpu_instance                  = (Optional) Specifies the GPU MIG instance profile for supported GPU VM SKU. The allowed values are MIG1g, MIG2g, MIG3g, MIG4g and MIG7g. Changing this forces a new resource to be created.\n  kubelet_config = optional(object({\n    cpu_manager_policy        = (Optional) Specifies the CPU Manager policy to use. Possible values are none and static, Changing this forces a new resource to be created.\n    cpu_cfs_quota_enabled     = (Optional) Is CPU CFS quota enforcement for containers enabled? Changing this forces a new resource to be created.\n    cpu_cfs_quota_period      = (Optional) Specifies the CPU CFS quota period value. Changing this forces a new resource to be created.\n    image_gc_high_threshold   = (Optional) Specifies the percent of disk usage above which image garbage collection is always run. Must be between 0 and 100. Changing this forces a new resource to be created.\n    image_gc_low_threshold    = (Optional) Specifies the percent of disk usage lower than which image garbage collection is never run. Must be between 0 and 100. Changing this forces a new resource to be created.\n    topology_manager_policy   = (Optional) Specifies the Topology Manager policy to use. Possible values are none, best-effort, restricted or single-numa-node. Changing this forces a new resource to be created.\n    allowed_unsafe_sysctls    = (Optional) Specifies the allow list of unsafe sysctls command or patterns (ending in *). Changing this forces a new resource to be created.\n    container_log_max_size_mb = (Optional) Specifies the maximum size (e.g. 10MB) of container log file before it is rotated. Changing this forces a new resource to be created.\n    container_log_max_files   = (Optional) Specifies the maximum number of container log files that can be present for a container. must be at least 2. Changing this forces a new resource to be created.\n    pod_max_pid               = (Optional) Specifies the maximum number of processes per pod. Changing this forces a new resource to be created.\n  }))\n  linux_os_config = optional(object({\n    sysctl_config = optional(object({\n      fs_aio_max_nr                      = (Optional) The sysctl setting fs.aio-max-nr. Must be between 65536 and 6553500. Changing this forces a new resource to be created.\n      fs_file_max                        = (Optional) The sysctl setting fs.file-max. Must be between 8192 and 12000500. Changing this forces a new resource to be created.\n      fs_inotify_max_user_watches        = (Optional) The sysctl setting fs.inotify.max_user_watches. Must be between 781250 and 2097152. Changing this forces a new resource to be created.\n      fs_nr_open                         = (Optional) The sysctl setting fs.nr_open. Must be between 8192 and 20000500. Changing this forces a new resource to be created.\n      kernel_threads_max                 = (Optional) The sysctl setting kernel.threads-max. Must be between 20 and 513785. Changing this forces a new resource to be created.\n      net_core_netdev_max_backlog        = (Optional) The sysctl setting net.core.netdev_max_backlog. Must be between 1000 and 3240000. Changing this forces a new resource to be created.\n      net_core_optmem_max                = (Optional) The sysctl setting net.core.optmem_max. Must be between 20480 and 4194304. Changing this forces a new resource to be created.\n      net_core_rmem_default              = (Optional) The sysctl setting net.core.rmem_default. Must be between 212992 and 134217728. Changing this forces a new resource to be created.\n      net_core_rmem_max                  = (Optional) The sysctl setting net.core.rmem_max. Must be between 212992 and 134217728. Changing this forces a new resource to be created.\n      net_core_somaxconn                 = (Optional) The sysctl setting net.core.somaxconn. Must be between 4096 and 3240000. Changing this forces a new resource to be created.\n      net_core_wmem_default              = (Optional) The sysctl setting net.core.wmem_default. Must be between 212992 and 134217728. Changing this forces a new resource to be created.\n      net_core_wmem_max                  = (Optional) The sysctl setting net.core.wmem_max. Must be between 212992 and 134217728. Changing this forces a new resource to be created.\n      net_ipv4_ip_local_port_range_min   = (Optional) The sysctl setting net.ipv4.ip_local_port_range min value. Must be between 1024 and 60999. Changing this forces a new resource to be created.\n      net_ipv4_ip_local_port_range_max   = (Optional) The sysctl setting net.ipv4.ip_local_port_range max value. Must be between 1024 and 60999. Changing this forces a new resource to be created.\n      net_ipv4_neigh_default_gc_thresh1  = (Optional) The sysctl setting net.ipv4.neigh.default.gc_thresh1. Must be between 128 and 80000. Changing this forces a new resource to be created.\n      net_ipv4_neigh_default_gc_thresh2  = (Optional) The sysctl setting net.ipv4.neigh.default.gc_thresh2. Must be between 512 and 90000. Changing this forces a new resource to be created.\n      net_ipv4_neigh_default_gc_thresh3  = (Optional) The sysctl setting net.ipv4.neigh.default.gc_thresh3. Must be between 1024 and 100000. Changing this forces a new resource to be created.\n      net_ipv4_tcp_fin_timeout           = (Optional) The sysctl setting net.ipv4.tcp_fin_timeout. Must be between 5 and 120. Changing this forces a new resource to be created.\n      net_ipv4_tcp_keepalive_intvl       = (Optional) The sysctl setting net.ipv4.tcp_keepalive_intvl. Must be between 10 and 75. Changing this forces a new resource to be created.\n      net_ipv4_tcp_keepalive_probes      = (Optional) The sysctl setting net.ipv4.tcp_keepalive_probes. Must be between 1 and 15. Changing this forces a new resource to be created.\n      net_ipv4_tcp_keepalive_time        = (Optional) The sysctl setting net.ipv4.tcp_keepalive_time. Must be between 30 and 432000. Changing this forces a new resource to be created.\n      net_ipv4_tcp_max_syn_backlog       = (Optional) The sysctl setting net.ipv4.tcp_max_syn_backlog. Must be between 128 and 3240000. Changing this forces a new resource to be created.\n      net_ipv4_tcp_max_tw_buckets        = (Optional) The sysctl setting net.ipv4.tcp_max_tw_buckets. Must be between 8000 and 1440000. Changing this forces a new resource to be created.\n      net_ipv4_tcp_tw_reuse              = (Optional) Is sysctl setting net.ipv4.tcp_tw_reuse enabled? Changing this forces a new resource to be created.\n      net_netfilter_nf_conntrack_buckets = (Optional) The sysctl setting net.netfilter.nf_conntrack_buckets. Must be between 65536 and 147456. Changing this forces a new resource to be created.\n      net_netfilter_nf_conntrack_max     = (Optional) The sysctl setting net.netfilter.nf_conntrack_max. Must be between 131072 and 1048576. Changing this forces a new resource to be created.\n      vm_max_map_count                   = (Optional) The sysctl setting vm.max_map_count. Must be between 65530 and 262144. Changing this forces a new resource to be created.\n      vm_swappiness                      = (Optional) The sysctl setting vm.swappiness. Must be between 0 and 100. Changing this forces a new resource to be created.\n      vm_vfs_cache_pressure              = (Optional) The sysctl setting vm.vfs_cache_pressure. Must be between 0 and 100. Changing this forces a new resource to be created.\n    }))\n    transparent_huge_page_enabled = (Optional) Specifies the Transparent Huge Page enabled configuration. Possible values are always, madvise and never. Changing this forces a new resource to be created.\n    transparent_huge_page_defrag  = (Optional) specifies the defrag configuration for Transparent Huge Page. Possible values are always, defer, defer+madvise, madvise and never. Changing this forces a new resource to be created.\n    swap_file_size_mb             = (Optional) Specifies the size of swap file on each node in MB. Changing this forces a new resource to be created.\n  }))\n  fips_enabled       = (Optional) Should the nodes in this Node Pool have Federal Information Processing Standard enabled? Changing this forces a new resource to be created. FIPS support is in Public Preview - more information and details on how to opt into the Preview can be found in [this article](https://docs.microsoft.com/azure/aks/use-multiple-node-pools#add-a-fips-enabled-node-pool-preview).\n  kubelet_disk_type  = (Optional) The type of disk used by kubelet. Possible values are OS and Temporary.\n  max_count          = (Optional) The maximum number of nodes which should exist within this Node Pool. Valid values are between 0 and 1000 and must be greater than or equal to min_count.\n  max_pods           = (Optional) The minimum number of nodes which should exist within this Node Pool. Valid values are between 0 and 1000 and must be less than or equal to max_count.\n  message_of_the_day = (Optional) A base64-encoded string which will be written to /etc/motd after decoding. This allows customization of the message of the day for Linux nodes. It cannot be specified for Windows nodes and must be a static string (i.e. will be printed raw and not executed as a script). Changing this forces a new resource to be created.\n  mode               = (Optional) Should this Node Pool be used for System or User resources? Possible values are System and User. Defaults to User.\n  min_count          = (Optional) The minimum number of nodes which should exist within this Node Pool. Valid values are between 0 and 1000 and must be less than or equal to max_count.\n  node_network_profile = optional(object({\n    node_public_ip_tags = (Optional) Specifies a mapping of tags to the instance-level public IPs. Changing this forces a new resource to be created.\n  }))\n  node_labels                  = (Optional) A map of Kubernetes labels which should be applied to nodes in this Node Pool.\n  node_public_ip_prefix_id     = (Optional) Resource ID for the Public IP Addresses Prefix for the nodes in this Node Pool. enable_node_public_ip should be true. Changing this forces a new resource to be created.\n  node_taints                  = (Optional) A list of Kubernetes taints which should be applied to nodes in the agent pool (e.g key=value:NoSchedule). Changing this forces a new resource to be created.\n  orchestrator_version         = (Optional) Version of Kubernetes used for the Agents. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade). AKS does not require an exact patch version to be specified, minor version aliases such as 1.22 are also supported. - The minor version's latest GA patch is automatically chosen in that case. More details can be found in [the documentation](https://docs.microsoft.com/en-us/azure/aks/supported-kubernetes-versions?tabs=azure-cli#alias-minor-version). This version must be supported by the Kubernetes Cluster - as such the version of Kubernetes used on the Cluster/Control Plane may need to be upgraded first.\n  os_disk_size_gb              = (Optional) The Agent Operating System disk size in GB. Changing this forces a new resource to be created.\n  os_disk_type                 = (Optional) The type of disk which should be used for the Operating System. Possible values are Ephemeral and Managed. Defaults to Managed. Changing this forces a new resource to be created.\n  os_sku                       = (Optional) Specifies the OS SKU used by the agent pool. Possible values include: Ubuntu, CBLMariner, Mariner, Windows2019, Windows2022. If not specified, the default is Ubuntu if OSType=Linux or Windows2019 if OSType=Windows. And the default Windows OSSKU will be changed to Windows2022 after Windows2019 is deprecated. Changing this forces a new resource to be created.\n  os_type                      = (Optional) The Operating System which should be used for this Node Pool. Changing this forces a new resource to be created. Possible values are Linux and Windows. Defaults to Linux.\n  pod_subnet_id                = (Optional) The ID of the Subnet where the pods in the Node Pool should exist. Changing this forces a new resource to be created.\n  priority                     = (Optional) The Priority for Virtual Machines within the Virtual Machine Scale Set that powers this Node Pool. Possible values are Regular and Spot. Defaults to Regular. Changing this forces a new resource to be created.\n  proximity_placement_group_id = (Optional) The ID of the Proximity Placement Group where the Virtual Machine Scale Set that powers this Node Pool will be placed. Changing this forces a new resource to be created. When setting priority to Spot - you must configure an eviction_policy, spot_max_price and add the applicable node_labels and node_taints [as per the Azure Documentation](https://docs.microsoft.com/azure/aks/spot-node-pool).\n  spot_max_price               = (Optional) The maximum price you're willing to pay in USD per Virtual Machine. Valid values are -1 (the current on-demand price for a Virtual Machine) or a positive value with up to five decimal places. Changing this forces a new resource to be created. This field can only be configured when priority is set to Spot.\n  scale_down_mode              = (Optional) Specifies how the node pool should deal with scaled-down nodes. Allowed values are Delete and Deallocate. Defaults to Delete.\n  snapshot_id                  = (Optional) The ID of the Snapshot which should be used to create this Node Pool. Changing this forces a new resource to be created.\n  ultra_ssd_enabled            = (Optional) Used to specify whether the UltraSSD is enabled in the Node Pool. Defaults to false. See [the documentation](https://docs.microsoft.com/azure/aks/use-ultra-disks) for more information. Changing this forces a new resource to be created.\n  vnet_subnet_id               = (Optional) The ID of the Subnet where this Node Pool should exist. Changing this forces a new resource to be created. A route table must be configured on this Subnet.\n  upgrade_settings = optional(object({\n    max_surge = string\n  }))\n  windows_profile = optional(object({\n    outbound_nat_enabled = optional(bool, true)\n  }))\n  workload_runtime = (Optional) Used to specify the workload runtime. Allowed values are OCIContainer and WasmWasi. WebAssembly System Interface node pools are in Public Preview - more information and details on how to opt into the preview can be found in [this article](https://docs.microsoft.com/azure/aks/use-wasi-node-pools)\n  zones            = (Optional) Specifies a list of Availability Zones in which this Kubernetes Cluster Node Pool should be located. Changing this forces a new Kubernetes Cluster Node Pool to be created.\n  create_before_destroy = (Optional) Create a new node pool before destroy the old one when Terraform must update an argument that cannot be updated in-place. Set this argument to true will add add a random suffix to pool's name to avoid conflict. Default to true.\n}))\n"
  type = map(object({
    name                          = string
    node_count                    = optional(number)
    tags                          = optional(map(string))
    vm_size                       = string
    host_group_id                 = optional(string)
    capacity_reservation_group_id = optional(string)
    custom_ca_trust_enabled       = optional(bool)
    enable_auto_scaling           = optional(bool)
    enable_host_encryption        = optional(bool)
    enable_node_public_ip         = optional(bool)
    eviction_policy               = optional(string)
    gpu_instance                  = optional(string)
    kubelet_config = optional(object({
      cpu_manager_policy        = optional(string)
      cpu_cfs_quota_enabled     = optional(bool)
      cpu_cfs_quota_period      = optional(string)
      image_gc_high_threshold   = optional(number)
      image_gc_low_threshold    = optional(number)
      topology_manager_policy   = optional(string)
      allowed_unsafe_sysctls    = optional(set(string))
      container_log_max_size_mb = optional(number)
      container_log_max_files   = optional(number)
      pod_max_pid               = optional(number)
    }))
    linux_os_config = optional(object({
      sysctl_config = optional(object({
        fs_aio_max_nr                      = optional(number)
        fs_file_max                        = optional(number)
        fs_inotify_max_user_watches        = optional(number)
        fs_nr_open                         = optional(number)
        kernel_threads_max                 = optional(number)
        net_core_netdev_max_backlog        = optional(number)
        net_core_optmem_max                = optional(number)
        net_core_rmem_default              = optional(number)
        net_core_rmem_max                  = optional(number)
        net_core_somaxconn                 = optional(number)
        net_core_wmem_default              = optional(number)
        net_core_wmem_max                  = optional(number)
        net_ipv4_ip_local_port_range_min   = optional(number)
        net_ipv4_ip_local_port_range_max   = optional(number)
        net_ipv4_neigh_default_gc_thresh1  = optional(number)
        net_ipv4_neigh_default_gc_thresh2  = optional(number)
        net_ipv4_neigh_default_gc_thresh3  = optional(number)
        net_ipv4_tcp_fin_timeout           = optional(number)
        net_ipv4_tcp_keepalive_intvl       = optional(number)
        net_ipv4_tcp_keepalive_probes      = optional(number)
        net_ipv4_tcp_keepalive_time        = optional(number)
        net_ipv4_tcp_max_syn_backlog       = optional(number)
        net_ipv4_tcp_max_tw_buckets        = optional(number)
        net_ipv4_tcp_tw_reuse              = optional(bool)
        net_netfilter_nf_conntrack_buckets = optional(number)
        net_netfilter_nf_conntrack_max     = optional(number)
        vm_max_map_count                   = optional(number)
        vm_swappiness                      = optional(number)
        vm_vfs_cache_pressure              = optional(number)
      }))
      transparent_huge_page_enabled = optional(string)
      transparent_huge_page_defrag  = optional(string)
      swap_file_size_mb             = optional(number)
    }))
    fips_enabled       = optional(bool)
    kubelet_disk_type  = optional(string)
    max_count          = optional(number)
    max_pods           = optional(number)
    message_of_the_day = optional(string)
    mode               = optional(string, "User")
    min_count          = optional(number)
    node_network_profile = optional(object({
      node_public_ip_tags = optional(map(string))
    }))
    node_labels                  = optional(map(string))
    node_public_ip_prefix_id     = optional(string)
    node_taints                  = optional(list(string))
    orchestrator_version         = optional(string)
    os_disk_size_gb              = optional(number)
    os_disk_type                 = optional(string, "Managed")
    os_sku                       = optional(string)
    os_type                      = optional(string, "Linux")
    pod_subnet_id                = optional(string)
    priority                     = optional(string, "Regular")
    proximity_placement_group_id = optional(string)
    spot_max_price               = optional(number)
    scale_down_mode              = optional(string, "Delete")
    snapshot_id                  = optional(string)
    ultra_ssd_enabled            = optional(bool)
    vnet_subnet_id               = optional(string)
    upgrade_settings = optional(object({
      max_surge = string
    }))
    windows_profile = optional(object({
      outbound_nat_enabled = optional(bool, true)
    }))
    workload_runtime      = optional(string)
    zones                 = optional(set(string))
    create_before_destroy = optional(bool, true)
  }))
  default = {}
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

variable "os_sku" {
  description = "(Optional) Specifies the OS SKU used by the agent pool. Possible values include: Ubuntu, CBLMariner, Mariner, Windows2019, Windows2022. If not specified, the default is Ubuntu if OSType=Linux or Windows2019 if OSType=Windows. And the default Windows OSSKU will be changed to Windows2022 after Windows2019 is deprecated. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "pod_subnet_id" {
  description = "(Optional) The ID of the Subnet where the pods in the default Node Pool should exist. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "prefix" {
  description = "(Optional) The prefix for the resources created in the specified Azure Resource Group. Omitting this variable requires both var.cluster_log_analytics_workspace_name and var.cluster_name have been set."
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
  description = "(Optional) Is Azure Active Directory integration enabled?"
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

variable "run_command_enabled" {
  description = "(Optional) Whether to enable run command for the cluster or not."
  type        = bool
  default     = true
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

variable "service_mesh_profile" {
  description = "mode - (Required) The mode of the service mesh. Possible value is Istio.\ninternal_ingress_gateway_enabled - (Optional) Is Istio Internal Ingress Gateway enabled? Defaults to true.\nexternal_ingress_gateway_enabled - (Optional) Is Istio External Ingress Gateway enabled? Defaults to true.\n"
  type = object({
    mode                             = string
    internal_ingress_gateway_enabled = optional(bool, true)
    external_ingress_gateway_enabled = optional(bool, true)
  })
  default = null
}

variable "sku_tier" {
  description = "The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free, Standard and Premium"
  type        = string
  default     = "Free"
}

variable "snapshot_id" {
  description = "(Optional) The ID of the Snapshot which should be used to create this default Node Pool. temporary_name_for_rotation must be specified when changing this property."
  type        = string
  default     = null
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

variable "support_plan" {
  description = "The support plan which should be used for this Kubernetes Cluster. Possible values are KubernetesOfficial and AKSLongTermSupport."
  type        = string
  default     = "KubernetesOfficial"
}

variable "tags" {
  description = "Any tags that should be present on the AKS cluster resources"
  type        = map(string)
  default     = {}
}

variable "temporary_name_for_rotation" {
  description = "(Optional) Specifies the name of the temporary node pool used to cycle the default node pool for VM resizing. the var.agents_size is no longer ForceNew and can be resized by specifying temporary_name_for_rotation"
  type        = string
  default     = null
}

variable "tracing_tags_enabled" {
  description = "Whether enable tracing tags that generated by BridgeCrew Yor."
  type        = bool
  default     = false
}

variable "tracing_tags_prefix" {
  description = "Default prefix for generated tracing tags"
  type        = string
  default     = "avm_"
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

variable "web_app_routing" {
  description = "object({\n  dns_zone_id = \"(Required) Specifies the ID of the DNS Zone in which DNS entries are created for applications deployed to the cluster when Web App Routing is enabled.\"\n})\n"
  type = object({
    dns_zone_id = string
  })
  default = null
}

variable "workload_autoscaler_profile" {
  description = "keda_enabled - (Optional) Specifies whether KEDA Autoscaler can be used for workloads.\nvertical_pod_autoscaler_enabled - (Optional) Specifies whether Vertical Pod Autoscaler should be enabled.\n"
  type = object({
    keda_enabled                    = optional(bool, false)
    vertical_pod_autoscaler_enabled = optional(bool, false)
  })
  default = null
}

variable "workload_identity_enabled" {
  description = "Enable or Disable Workload Identity. Defaults to false."
  type        = bool
  default     = false
}
