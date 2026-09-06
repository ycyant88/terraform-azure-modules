variable "aci_connector_linux_subnet_name" {
  description = "The subnet name for the ACI connector Linux."
  type        = string
  default     = null
}

variable "api_server_access_profile" {
  description = "The API server access profile for the Kubernetes cluster."
  type        = list(string)
  default     = null
}

variable "auto_scaler_profile" {
  description = "The auto scaler profile for the Kubernetes cluster."
  type = object({
    balance_similar_node_groups      = optional(string)
    expander                         = optional(string)
    max_graceful_termination_sec     = optional(string)
    max_node_provisioning_time       = optional(string)
    max_unready_nodes                = optional(string)
    max_unready_percentage           = optional(string)
    new_pod_scale_up_delay           = optional(string)
    scale_down_delay_after_add       = optional(string)
    scale_down_delay_after_delete    = optional(string)
    scale_down_delay_after_failure   = optional(string)
    scale_down_unneeded              = optional(string)
    scale_down_unready               = optional(string)
    scale_down_utilization_threshold = optional(string)
    empty_bulk_delete_max            = optional(string)
    skip_nodes_with_local_storage    = optional(string)
    skip_nodes_with_system_pods      = optional(string)
  })
  default = null
}

variable "automatic_upgrade_channel" {
  description = "(Optional) The upgrade channel for this Kubernetes Cluster. Possible values are patch, rapid, node-image and stable. By default automatic-upgrades are turned off. Note that you cannot specify the patch version using kubernetes_version or orchestrator_version when using the patch upgrade channel. See [the documentation](https://learn.microsoft.com/en-us/azure/aks/auto-upgrade-cluster) for more information"
  type        = string
  default     = null
}

variable "azure_active_directory_role_based_access_control" {
  description = "The Azure Active Directory role-based access control for the Kubernetes cluster."
  type = object({
    tenant_id              = optional(string)
    admin_group_object_ids = optional(list(string))
    azure_rbac_enabled     = optional(bool)
  })
  default = null
}

variable "azure_policy_enabled" {
  description = "Whether or not Azure Policy is enabled for the Kubernetes cluster."
  type        = bool
  default     = true
}

variable "cluster_suffix" {
  description = "Optional. The suffix to append to the Kubernetes cluster name if create_before_destroy is set to true on the nodepools."
  type        = string
  default     = ""
}

variable "cost_analysis_enabled" {
  description = "Whether or not cost analysis is enabled for the Kubernetes cluster. SKU must be Standard or Premium."
  type        = bool
  default     = false
}

variable "create_nodepools_before_destroy" {
  description = "Whether or not to create node pools before destroying the old ones. This is the opposite of the default behavior. Set this to true if zero downtime is required during nodepool redeployments such as changes to snapshot_id."
  type        = bool
  default     = false
}

variable "customer_managed_key" {
  description = "A map describing customer-managed keys to associate with the resource. This includes the following properties:\n- key_vault_resource_id - The resource ID of the Key Vault where the key is stored.\n- key_name - The name of the key.\n- key_version - (Optional) The version of the key. If not specified, the latest version is used.\n- user_assigned_identity - (Optional) An object representing a user-assigned identity with the following properties:\n  - resource_id - The resource ID of the user-assigned identity.\n"
  type = object({
    key_vault_resource_id = string
    key_name              = string
    key_version           = optional(string, null)
    user_assigned_identity = optional(object({
      resource_id = string
    }), null)
  })
  default = null
}

variable "default_node_pool" {
  description = "Required. The default node pool for the Kubernetes cluster."
  type = object({
    name                          = string
    vm_size                       = string
    capacity_reservation_group_id = optional(string)
    auto_scaling_enabled          = optional(bool, false)
    host_encryption_enabled       = optional(bool)
    node_public_ip_enabled        = optional(bool)
    gpu_instance                  = optional(string)
    host_group_id                 = optional(string)
    fips_enabled                  = optional(bool)
    kubelet_disk_type             = optional(string)
    max_pods                      = optional(number)
    node_public_ip_prefix_id      = optional(string)
    node_labels                   = optional(map(string))
    only_critical_addons_enabled  = optional(string)
    orchestrator_version          = optional(string)
    os_disk_size_gb               = optional(string)
    os_disk_type                  = optional(string)
    os_sku                        = optional(string)
    pod_subnet_id                 = optional(string)
    proximity_placement_group_id  = optional(string)
    scale_down_mode               = optional(string)
    snapshot_id                   = optional(string)
    temporary_name_for_rotation   = optional(string)
    type                          = optional(string, "VirtualMachineScaleSets")
    tags                          = optional(map(string))
    ultra_ssd_enabled             = optional(bool)
    vnet_subnet_id                = optional(string)
    workload_runtime              = optional(string)
    zones                         = optional(list(string))
    max_count                     = optional(number)
    min_count                     = optional(number)
    node_count                    = optional(number)
    kubelet_config = optional(object({
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
    upgrade_settings = optional(object({
      drain_timeout_in_minutes      = optional(number)
      node_soak_duration_in_minutes = optional(number)
      max_surge                     = string
    }))

  })
  default = ""
}

variable "defender_log_analytics_workspace_id" {
  description = "The log analytics workspace ID for the Microsoft Defender."
  type        = string
  default     = null
}

variable "diagnostic_settings" {
  description = "A map of diagnostic settings to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.\n- log_categories - (Optional) A set of log categories to send to the log analytics workspace. Defaults to [].\n- log_groups - (Optional) A set of log groups to send to the log analytics workspace. Defaults to [\"allLogs\"].\n- metric_categories - (Optional) A set of metric categories to send to the log analytics workspace. Defaults to [\"AllMetrics\"].\n- log_analytics_destination_type - (Optional) The destination type for the diagnostic setting. Possible values are Dedicated and AzureDiagnostics. Defaults to Dedicated.\n- workspace_resource_id - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.\n- storage_account_resource_id - (Optional) The resource ID of the storage account to send logs and metrics to.\n- event_hub_authorization_rule_resource_id - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.\n- event_hub_name - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.\n- marketplace_partner_resource_id - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic LogsLogs.\n"
  type = map(object({
    name                                     = optional(string, null)
    log_categories                           = optional(set(string), [])
    log_groups                               = optional(set(string), ["allLogs"])
    metric_categories                        = optional(set(string), ["AllMetrics"])
    log_analytics_destination_type           = optional(string, "Dedicated")
    workspace_resource_id                    = optional(string, null)
    storage_account_resource_id              = optional(string, null)
    event_hub_authorization_rule_resource_id = optional(string, null)
    event_hub_name                           = optional(string, null)
    marketplace_partner_resource_id          = optional(string, null)
  }))
  default = {}
}

variable "disk_encryption_set_id" {
  description = "The disk encryption set ID for the Kubernetes cluster."
  type        = string
  default     = null
}

variable "dns_prefix" {
  description = "The DNS prefix specified when creating the managed cluster. If you do not specify one, a random prefix will be generated."
  type        = string
  default     = ""
}

variable "dns_prefix_private_cluster" {
  description = "The Private Cluster DNS prefix specified when creating a private cluster. Required if deploying private cluster."
  type        = string
  default     = ""
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "http_application_routing_enabled" {
  description = "Whether or not HTTP application routing is enabled for the Kubernetes cluster."
  type        = bool
  default     = false
}

variable "http_proxy_config" {
  description = "The HTTP proxy configuration for the Kubernetes cluster."
  type = object({
    http_proxy  = optional(string)
    https_proxy = optional(string)
    no_proxy    = optional(string)
    trusted_ca  = optional(string)
  })
  default = null
}

variable "identity" {
  description = "The type and id of identities to use for the Kubernetes cluster."
  type = object({
    type         = string
    identity_ids = optional(list(string))
  })
  default = { "type" : "SystemAssigned" }
}

variable "image_cleaner_enabled" {
  description = "Whether or not the image cleaner is enabled for the Kubernetes cluster."
  type        = bool
  default     = false
}

variable "ingress_application_gateway" {
  description = "The ingress application gateway for the Kubernetes cluster."
  type = object({
    gateway_id   = optional(string)
    gateway_name = optional(string)
    subnet_cidr  = optional(string)
    subnet_id    = optional(string)
  })
  default = null
}

variable "key_management_service" {
  description = "The key management service for the Kubernetes cluster."
  type = object({
    key_vault_key_id         = string
    key_vault_network_access = string
  })
  default = null
}

variable "key_vault_secrets_provider" {
  description = "The key vault secrets provider for the Kubernetes cluster. Either rotation enabled or rotation interval must be specified."
  type = object({
    secret_rotation_enabled  = optional(bool)
    secret_rotation_interval = optional(string)
  })
  default = null
}

variable "kubelet_identity" {
  description = "The kubelet identity for the Kubernetes cluster."
  type = object({
    client_id                 = optional(string)
    object_id                 = optional(string)
    user_assigned_identity_id = optional(string)
  })
  default = null
}

variable "kubernetes_version" {
  description = "The version of Kubernetes to use for the managed cluster."
  type        = string
  default     = null
}

variable "linux_profile" {
  description = "The Linux profile for the Kubernetes cluster."
  type = object({
    admin_username = string
    ssh_key        = string
  })
  default = null
}

variable "local_account_disabled" {
  description = "Defaults to true. Whether or not the local account should be disabled on the Kubernetes cluster. Azure RBAC must be enabled."
  type        = bool
  default     = true
}

variable "location" {
  description = "Azure region where the resource should be deployed."
  type        = string
  default     = ""
}

variable "lock" {
  description = "Controls the Resource Lock configuration for this resource. The following properties can be specified:\n\n- kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n- name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n"
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "maintenance_window" {
  description = "The maintenance window for the Kubernetes cluster."
  type = object({
    allowed = object({
      day   = string
      hours = number
    })
    not_allowed = object({
      start = string
      end   = string
    })
  })
  default = null
}

variable "maintenance_window_auto_upgrade" {
  description = "values for maintenance window auto upgrade"
  type = object({
    frequency    = string
    interval     = string
    duration     = number
    day_of_week  = optional(string)
    day_of_month = optional(number)
    week_index   = optional(string)
    start_time   = optional(string)
    utc_offset   = optional(string)
    start_date   = optional(string)
    not_allowed = optional(object({
      start = string
      end   = string
    }))
  })
  default = null
}

variable "maintenance_window_node_os" {
  description = "values for maintenance window node os"
  type = object({
    frequency    = string
    interval     = string
    duration     = number
    day_of_week  = optional(string)
    day_of_month = optional(number)
    week_index   = optional(string)
    start_time   = optional(string)
    utc_offset   = optional(string)
    start_date   = optional(string)
    not_allowed = optional(object({
      start = string
      end   = string
    }))
  })
  default = null
}

variable "managed_identities" {
  description = "Controls the Managed Identity configuration on this resource. The following properties can be specified:\n\n- system_assigned - (Optional) Specifies if the System Assigned Managed Identity should be enabled.\n- user_assigned_resource_ids - (Optional) Specifies a list of User Assigned Managed Identity resource IDs to be assigned to this resource.\n"
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default = {}
}

variable "monitor_metrics" {
  description = "The monitor metrics for the Kubernetes cluster. Both required if enabling Prometheus"
  type = object({
    annotations_allowed = optional(bool)
    labels_allowed      = optional(bool)
  })
  default = null
}

variable "name" {
  description = "The name of this resource."
  type        = string
  default     = ""
}

variable "network_profile" {
  description = "The network profile for the Kubernetes cluster."
  type = object({
    network_plugin      = string
    network_mode        = optional(string)
    network_policy      = optional(string)
    dns_service_ip      = optional(string)
    network_data_plane  = optional(string)
    network_plugin_mode = optional(string)
    outbound_type       = optional(string, "loadBalancer")
    pod_cidr            = optional(string)
    pod_cidrs           = optional(list(string))
    service_cidr        = optional(string)
    service_cidrs       = optional(list(string))
    ip_versions         = optional(list(string))
    load_balancer_sku   = optional(string)
    load_balancer_profile = optional(object({
      managed_outbound_ip_count   = optional(number)
      managed_outbound_ipv6_count = optional(number)
      outbound_ip_address_ids     = optional(list(string))
      outbound_ip_prefix_ids      = optional(list(string))
      outbound_ports_allocated    = optional(number)
      idle_timeout_in_minutes     = optional(number)
    }))
    nat_gateway_profile = optional(object({
      managed_outbound_ip_count = optional(number)
      idle_timeout_in_minutes   = optional(number)
    }))
  })
  default = { "network_plugin" : "azure", "network_plugin_mode" : "overlay", "network_policy" : "azure" }
}

variable "node_os_channel_upgrade" {
  description = "The node OS channel upgrade for the Kubernetes cluster."
  type        = string
  default     = "NodeImage"
}

variable "node_pools" {
  description = "Optional. The additional node pools for the Kubernetes cluster."
  type = map(object({
    name                          = string
    vm_size                       = string
    capacity_reservation_group_id = optional(string)
    auto_scaling_enabled          = optional(bool, false)
    max_count                     = optional(number)
    min_count                     = optional(number)
    node_count                    = optional(number)
    host_encryption_enabled       = optional(bool)
    node_public_ip_enabled        = optional(bool)
    eviction_policy               = optional(string)
    host_group_id                 = optional(string)
    fips_enabled                  = optional(bool)
    gpu_instance                  = optional(string)
    kubelet_disk_type             = optional(string)
    max_pods                      = optional(number)
    mode                          = optional(string)
    node_network_profile = optional(object({
      allowed_host_ports = optional(list(object({
        port_start = optional(number)
        port_end   = optional(number)
        protocol   = optional(string)
      })))
      application_security_group_ids = optional(list(string))
      node_public_ip_tags            = optional(map(string))
    }))
    node_labels                  = optional(map(string))
    node_public_ip_prefix_id     = optional(string)
    node_taints                  = optional(list(string))
    orchestrator_version         = optional(string)
    os_disk_size_gb              = optional(number)
    os_disk_type                 = optional(string)
    os_sku                       = optional(string)
    os_type                      = optional(string)
    pod_subnet_id                = optional(string)
    priority                     = optional(string)
    proximity_placement_group_id = optional(string)
    spot_max_price               = optional(string)
    snapshot_id                  = optional(string)
    tags                         = optional(map(string))
    scale_down_mode              = optional(string)
    ultra_ssd_enabled            = optional(bool)
    vnet_subnet_id               = optional(string)
    zones                        = optional(list(string))
    workload_runtime             = optional(string)
    windows_profile = optional(object({
      outbound_nat_enabled = optional(bool)
    }))
    upgrade_settings = optional(object({
      drain_timeout_in_minutes      = optional(number)
      node_soak_duration_in_minutes = optional(number)
      max_surge                     = string
    }))

    kubelet_config = optional(object({
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
    }))
  }))
  default = {}
}

variable "node_resource_group_name" {
  description = "The resource group name for the node pool."
  type        = string
  default     = null
}

variable "oidc_issuer_enabled" {
  description = "Whether or not the OIDC issuer is enabled for the Kubernetes cluster."
  type        = bool
  default     = false
}

variable "oms_agent" {
  description = "Optional. The OMS agent for the Kubernetes cluster."
  type = object({
    log_analytics_workspace_id      = string
    msi_auth_for_monitoring_enabled = optional(bool)
  })
  default = null
}

variable "open_service_mesh_enabled" {
  description = "Whether or not open service mesh is enabled for the Kubernetes cluster."
  type        = bool
  default     = false
}

variable "private_cluster_enabled" {
  description = "Whether or not the Kubernetes cluster is private."
  type        = bool
  default     = false
}

variable "private_cluster_public_fqdn_enabled" {
  description = "Whether or not the private cluster public FQDN is enabled for the Kubernetes cluster."
  type        = bool
  default     = false
}

variable "private_dns_zone_id" {
  description = "The private DNS zone ID for the Kubernetes cluster."
  type        = string
  default     = null
}

variable "private_endpoints" {
  description = "  A map of private endpoints to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  \n  - name - (Optional) The name of the private endpoint. One will be generated if not set.\n  - role_assignments - (Optional) A map of role assignments to create on the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time. See var.role_assignments for more information.\n    - role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n    - principal_id - The ID of the principal to assign the role to.\n    - description - (Optional) The description of the role assignment.\n    - skip_service_principal_aad_check - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n    - condition - (Optional) The condition which will be used to scope the role assignment.\n    - condition_version - (Optional) The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\n    - delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\n    - principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n  - lock - (Optional) The lock level to apply to the private endpoint. Default is None. Possible values are None, CanNotDelete, and ReadOnly.\n    - kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n    - name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n  - tags - (Optional) A mapping of tags to assign to the private endpoint.\n  - subnet_resource_id - The resource ID of the subnet to deploy the private endpoint in.\n  - subresource_name - The name of the sub resource for the private endpoint.\n  - private_dns_zone_group_name - (Optional) The name of the private DNS zone group. One will be generated if not set.\n  - private_dns_zone_resource_ids - (Optional) A set of resource IDs of private DNS zones to associate with the private endpoint. If not set, no zone groups will be created and the private endpoint will not be associated with any private DNS zones. DNS records must be managed external to this module.\n  - application_security_group_resource_ids - (Optional) A map of resource IDs of application security groups to associate with the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  - private_service_connection_name - (Optional) The name of the private service connection. One will be generated if not set.\n  - network_interface_name - (Optional) The name of the network interface. One will be generated if not set.\n  - location - (Optional) The Azure location where the resources will be deployed. Defaults to the location of the resource group.\n  - resource_group_name - (Optional) The resource group where the resources will be deployed. Defaults to the resource group of the Key Vault.\n  - ip_configurations - (Optional) A map of IP configurations to create on the private endpoint. If not specified the platform will create one. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n    - name - The name of the IP configuration.\n    - private_ip_address - The private IP address of the IP configuration.\n"
  type = map(object({
    name = optional(string, null)
    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
      principal_type                         = optional(string, null)
    })), {})
    lock = optional(object({
      kind = string
      name = optional(string, null)
    }), null)
    tags                                    = optional(map(string), null)
    subnet_resource_id                      = string
    subresource_name                        = string # NOTE: `subresource_name` can be excluded if the resource does not support multiple sub resource types (e.g. storage account supports blob, queue, etc)
    private_dns_zone_group_name             = optional(string, "default")
    private_dns_zone_resource_ids           = optional(set(string), [])
    application_security_group_associations = optional(map(string), {})
    private_service_connection_name         = optional(string, null)
    network_interface_name                  = optional(string, null)
    location                                = optional(string, null)
    resource_group_name                     = optional(string, null)
    ip_configurations = optional(map(object({
      name               = string
      private_ip_address = string
    })), {})
  }))
  default = {}
}

variable "private_endpoints_manage_dns_zone_group" {
  description = "Whether to manage private DNS zone groups with this module. If set to false, you must manage private DNS zone groups externally, e.g. using Azure Policy."
  type        = bool
  default     = true
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "  A map of role assignments to create on the <RESOURCE>. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  \n  - role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n  - principal_id - The ID of the principal to assign the role to.\n  - description - (Optional) The description of the role assignment.\n  - skip_service_principal_aad_check - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n  - condition - (Optional) The condition which will be used to scope the role assignment.\n  - condition_version - (Optional) The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\n  - delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\n  - principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n  \n  > Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
  type = map(object({
    role_definition_id_or_name             = string
    principal_id                           = string
    description                            = optional(string, null)
    skip_service_principal_aad_check       = optional(bool, false)
    condition                              = optional(string, null)
    condition_version                      = optional(string, null)
    delegated_managed_identity_resource_id = optional(string, null)
    principal_type                         = optional(string, null)
  }))
  default = {}
}

variable "role_based_access_control_enabled" {
  description = "Whether or not role-based access control is enabled for the Kubernetes cluster."
  type        = bool
  default     = true
}

variable "run_command_enabled" {
  description = "Whether or not the run command is enabled for the Kubernetes cluster."
  type        = bool
  default     = false
}

variable "service_mesh_profile" {
  description = "The service mesh profile for the Kubernetes cluster."
  type = object({
    mode                             = string
    internal_ingress_gateway_enabled = optional(bool)
    external_ingress_gateway_enabled = optional(bool)
    certificate_authority = optional(object({
      key_vault_id           = string
      root_cert_object_name  = string
      cert_chain_object_name = string
      cert_object_name       = string
      key_object_name        = string
    }))
  })
  default = null
}

variable "service_principal" {
  description = "The service principal for the Kubernetes cluster. Only specify this or identity, not both."
  type = object({
    client_id     = string
    client_secret = string
  })
  default = null
}

variable "sku_tier" {
  description = "The SKU tier of the Kubernetes Cluster. Possible values are Free, Standard, and Premium."
  type        = string
  default     = "Standard"
}

variable "storage_profile" {
  description = "Optional. The storage profile for the Kubernetes cluster."
  type = object({
    blob_driver_enabled         = optional(bool),
    disk_driver_enabled         = optional(bool),
    file_driver_enabled         = optional(bool),
    snapshot_controller_enabled = optional(bool)
  })
  default = null
}

variable "support_plan" {
  description = "The support plan for the Kubernetes cluster. Defaults to KubernetesOfficial."
  type        = string
  default     = "KubernetesOfficial"
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "web_app_routing_dns_zone_ids" {
  description = "The web app routing DNS zone IDs for the Kubernetes cluster."
  type        = map(list(string))
  default     = {}
}

variable "windows_profile" {
  description = "The Windows profile for the Kubernetes cluster."
  type = object({
    admin_username = string
    admin_password = string
    license        = optional(string)
    gmsa = optional(object({
      root_domain = string
      dns_server  = string
    }))
  })
  default = null
}

variable "workload_autoscaler_profile" {
  description = "The workload autoscaler profile for the Kubernetes cluster."
  type = object({
    keda_enabled = optional(bool)
    vpa_enabled  = optional(bool)
  })
  default = null
}

variable "workload_identity_enabled" {
  description = "Whether or not workload identity is enabled for the Kubernetes cluster."
  type        = bool
  default     = false
}
