variable "auto_scaling_enabled" {
  description = "Optional. Whether or not auto-scaling is enabled."
  type        = bool
  default     = false
}

variable "capacity_reservation_group_id" {
  description = "The ID of the capacity reservation group."
  type        = string
  default     = null
}

variable "cluster_resource_id" {
  description = "Resource ID of the existing Kubernetes cluster."
  type        = string
  default     = ""
}

variable "create_nodepool_before_destroy" {
  description = "Whether or not to create node pools before destroying the old ones. This is the opposite of the default behavior. Set this to true if zero downtime is required during nodepool redeployments such as changes to snapshot_id."
  type        = bool
  default     = false
}

variable "eviction_policy" {
  description = "Optional. The eviction policy for the nodepool."
  type        = string
  default     = null
}

variable "fips_enabled" {
  description = "Optional. Whether or not FIPS is enabled."
  type        = bool
  default     = null
}

variable "gpu_instance" {
  description = "Optional. The GPU instance type for the nodepool."
  type        = string
  default     = null
}

variable "host_encryption_enabled" {
  description = "Optional. Whether or not host encryption is enabled."
  type        = bool
  default     = null
}

variable "host_group_id" {
  description = "Optional. The ID of the host group."
  type        = string
  default     = null
}

variable "kubelet_config" {
  description = "Optional. The Kubelet config for the nodepool."
  type = object({
    cpu_manager_policy        = string
    cpu_cfs_quota_enabled     = bool
    cpu_cfs_quota_period      = string
    image_gc_high_threshold   = number
    image_gc_low_threshold    = number
    topology_manager_policy   = string
    allowed_unsafe_sysctls    = set(string)
    container_log_max_size_mb = number
    container_log_max_line    = number
    pod_max_pid               = number
  })
  default = null
}

variable "kubelet_disk_type" {
  description = "Optional. The disk type for the kubelet."
  type        = string
  default     = null
}

variable "linux_os_config" {
  description = "Optional. The Linux OS config for the nodepool."
  type = object({
    swap_file_size_mb             = optional(number)
    transparent_huge_page_defrag  = optional(string)
    transparent_huge_page_enabled = optional(string)
    sysctl_config = object({
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
    })
  })
  default = null
}

variable "max_count" {
  description = "Optional. The maximum number of nodes for the nodepool if auto-scaling is enabled."
  type        = number
  default     = null
}

variable "max_pods" {
  description = "Optional. The maximum number of pods per node."
  type        = number
  default     = null
}

variable "min_count" {
  description = "Optional. The minimum number of nodes for the nodepool if auto-scaling is enabled."
  type        = number
  default     = null
}

variable "mode" {
  description = "Optional. The mode for the nodepool."
  type        = string
  default     = null
}

variable "name" {
  description = "Required. The name of the Kubernetes nodepool."
  type        = string
  default     = ""
}

variable "network_plugin_mode" {
  description = "The network plugin mode for the nodepool."
  type        = string
  default     = ""
}

variable "node_count" {
  description = "Optional. The number of nodes for the nodepool. Set to 0 if auto-scaling is enabled."
  type        = number
  default     = null
}

variable "node_labels" {
  description = "Optional. The labels for the nodepool."
  type        = map(string)
  default     = null
}

variable "node_network_profile" {
  description = "Optional. The network profile for the nodepool."
  type = object({
    allowed_host_ports = list(object({
      port_start = number
      port_end   = number
      protocol   = string
    }))
    application_security_group_ids = list(string)
    node_public_ip_tags            = map(string)
  })
  default = null
}

variable "node_public_ip_enabled" {
  description = "Optional. Whether or not public IPs are enabled for the nodepool."
  type        = bool
  default     = null
}

variable "node_public_ip_prefix_id" {
  description = "Optional. The ID of the public IP prefix."
  type        = string
  default     = null
}

variable "node_taints" {
  description = "Optional. The taints for the nodepool."
  type        = list(string)
  default     = null
}

variable "orchestrator_version" {
  description = "Optional. The Kubernetes version for the nodepool."
  type        = string
  default     = null
}

variable "os_disk_size_gb" {
  description = "Optional. The size of the OS disk for the nodepool."
  type        = number
  default     = null
}

variable "os_disk_type" {
  description = "Optional. The type of the OS disk for the nodepool."
  type        = string
  default     = null
}

variable "os_sku" {
  description = "Optional. The SKU of the OS for the nodepool."
  type        = string
  default     = null
}

variable "os_type" {
  description = "Optional. The type of the OS for the nodepool."
  type        = string
  default     = null
}

variable "pod_subnet_id" {
  description = "Optional. The ID of the pod subnet."
  type        = string
  default     = null
}

variable "priority" {
  description = "Optional. The priority for the nodepool."
  type        = string
  default     = null
}

variable "proximity_placement_group_id" {
  description = "Optional. The ID of the proximity placement group."
  type        = string
  default     = null
}

variable "scale_down_mode" {
  description = "Optional. The scale down mode for the nodepool."
  type        = string
  default     = null
}

variable "snapshot_id" {
  description = "Optional. The ID of the snapshot."
  type        = string
  default     = null
}

variable "spot_max_price" {
  description = "Optional. The maximum price for spot instances."
  type        = string
  default     = null
}

variable "tags" {
  description = "Optional. A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "- create - (Defaults to 60 minutes) Used when creating the Kubernetes Cluster Node Pool.\n- delete - (Defaults to 60 minutes) Used when deleting the Kubernetes Cluster Node Pool.\n- read - (Defaults to 5 minutes) Used when retrieving the Kubernetes Cluster Node Pool.\n- update - (Defaults to 60 minutes) Used when updating the Kubernetes Cluster Node Pool.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}

variable "ultra_ssd_enabled" {
  description = "Optional. Whether or not ultra SSD is enabled."
  type        = bool
  default     = null
}

variable "upgrade_settings" {
  description = "Optional. The upgrade settings for the nodepool."
  type = object({
    drain_timeout_in_minutes      = optional(number)
    node_soak_duration_in_minutes = optional(number)
    max_surge                     = optional(string)
  })
  default = { "max_surge" : "10%" }
}

variable "vm_size" {
  description = "Required. The size of the VMs for the nodepool."
  type        = string
  default     = ""
}

variable "vnet_subnet_id" {
  description = "Optional. The ID of the VNet subnet."
  type        = string
  default     = null
}

variable "windows_profile" {
  description = "Optional. The Windows profile for the nodepool."
  type = object({
    outbound_nat_enabled = bool
  })
  default = null
}

variable "workload_runtime" {
  description = "Optional. The workload runtime for the nodepool."
  type        = string
  default     = null
}

variable "zones" {
  description = "Optional. The availability zones for the nodepool."
  type        = list(string)
  default     = null
}
