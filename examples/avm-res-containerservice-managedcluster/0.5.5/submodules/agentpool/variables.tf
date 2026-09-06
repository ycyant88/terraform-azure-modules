variable "availability_zones" {
  description = "The list of Availability zones to use for nodes. This can only be specified if the AgentPoolType property is 'VirtualMachineScaleSets'.\n"
  type        = list(string)
  default     = null
}

variable "capacity_reservation_group_id" {
  description = "The fully qualified resource ID of the Capacity Reservation Group to provide virtual machines from a reserved group of Virtual Machines. This is of the form: '/subscriptions/{subscriptionId}/resourcegroups/{resourceGroupName}/providers/Microsoft.Compute/capacityreservationgroups/{capacityReservationGroupName}' Customers use it to create an agentpool with a specified CRG. For more information see [Capacity Reservation](https://learn.microsoft.com/en-us/azure/virtual-machines/capacity-reservation-overview)\n"
  type        = string
  default     = null
}

variable "count_of" {
  description = "Number of agents (VMs) to host docker containers. Allowed values must be in the range of 0 to 1000 (inclusive) for user pools and in the range of 1 to 1000 (inclusive) for system pools. The default valueis 1.\n"
  type        = number
  default     = null
}

variable "create_before_destroy" {
  description = "Whether to create a new resource before destroying the old one when the resource name changes.\n"
  type        = bool
  default     = false
}

variable "creation_data" {
  description = "Data used when creating a target resource from a source resource.\n\n- source_resource_id - This is the ARM ID of the source object to be used to create the target object.\n\n"
  type = object({
    source_resource_id = optional(string)
  })
  default = null
}

variable "enable_auto_scaling" {
  description = "Whether to enable auto-scaler\n"
  type        = bool
  default     = null
}

variable "enable_encryption_at_host" {
  description = "Whether to enable host based OS and data drive encryption. This is only supported on certain VM sizes and in certain Azure regions. For more information, see: https://docs.microsoft.com/azure/aks/enable-host-encryption\n"
  type        = bool
  default     = null
}

variable "enable_fips" {
  description = "Whether to use a FIPS-enabled OS. See [Add a FIPS-enabled node pool](https://docs.microsoft.com/azure/aks/use-multiple-node-pools#add-a-fips-enabled-node-pool-preview) for more details.\n"
  type        = bool
  default     = null
}

variable "enable_node_public_ip" {
  description = "Whether each node is allocated its own public IP. Some scenarios may require nodes in a node pool to receive their own dedicated public IP addresses. A common scenario is for gaming workloads, where a console needs to make a direct connection to a cloud virtual machine to minimize hops. For more information see [assigning a public IP per node](https://docs.microsoft.com/azure/aks/use-multiple-node-pools#assign-a-public-ip-per-node-for-your-node-pools). The default is false.\n"
  type        = bool
  default     = null
}

variable "enable_ultra_ssd" {
  description = "Whether to enable UltraSSD\n"
  type        = bool
  default     = null
}

variable "gateway_profile" {
  description = "Profile of the managed cluster gateway agent pool.\n\n- public_ip_prefix_size - The Gateway agent pool associates one public IPPrefix for each static egress gateway to provide public egress. The size of Public IPPrefix should be selected by the user. Each node in the agent pool is assigned with one IP from the IPPrefix. The IPPrefix size thus serves as a cap on the size of the Gateway agent pool. Due to Azure public IPPrefix size limitation, the valid value range is [28, 31] (/31 = 2 nodes/IPs, /30 = 4 nodes/IPs, /29 = 8 nodes/IPs, /28 = 16 nodes/IPs). The default value is 31.\n\n"
  type = object({
    public_ip_prefix_size = optional(number)
  })
  default = null
}

variable "gpu_instance_profile" {
  description = "GPUInstanceProfile to be used to specify GPU MIG instance profile for supported GPU VM SKU.\n"
  type        = string
  default     = null
}

variable "gpu_profile" {
  description = "GPU settings for the Agent Pool.\n\n- driver - Whether to install GPU drivers. When it's not specified, default is Install.\n\n"
  type = object({
    driver = optional(string)
  })
  default = null
}

variable "host_group_id" {
  description = "The fully qualified resource ID of the Dedicated Host Group to provision virtual machines from, used only in creation scenario and not allowed to changed once set. This is of the form: /subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Compute/hostGroups/{hostGroupName}. For more information see [Azure dedicated hosts](https://docs.microsoft.com/azure/virtual-machines/dedicated-hosts).\n"
  type        = string
  default     = null
}

variable "kubelet_config" {
  description = "Kubelet configurations of agent nodes. See [AKS custom node configuration](https://docs.microsoft.com/azure/aks/custom-node-configuration) for more details.\n\n- allowed_unsafe_sysctls - Allowed list of unsafe sysctls or unsafe sysctl patterns (ending in *).\n- container_log_max_files - The maximum number of container log files that can be present for a container. The number must be \u2265 2.\n- container_log_max_size_mb - The maximum size (e.g. 10Mi) of container log file before it is rotated.\n- cpu_cfs_quota - If CPU CFS quota enforcement is enabled for containers that specify CPU limits. The default is true.\n- cpu_cfs_quota_period - The CPU CFS quota period value. The default is '100ms.' Valid values are a sequence of decimal numbers with an optional fraction and a unit suffix. For example: '300ms', '2h45m'. Supported units are 'ns', 'us', 'ms', 's', 'm', and 'h'.\n- cpu_manager_policy - The CPU Manager policy to use. The default is 'none'. See [Kubernetes CPU management policies](https://kubernetes.io/docs/tasks/administer-cluster/cpu-management-policies/#cpu-management-policies) for more information. Allowed values are 'none' and 'static'.\n- fail_swap_on - If set to true it will make the Kubelet fail to start if swap is enabled on the node.\n- image_gc_high_threshold - The percent of disk usage after which image garbage collection is always run. To disable image garbage collection, set to 100. The default is 85%\n- image_gc_low_threshold - The percent of disk usage before which image garbage collection is never run. This cannot be set higher than imageGcHighThreshold. The default is 80%\n- pod_max_pids - The maximum number of processes per pod.\n- topology_manager_policy - The Topology Manager policy to use. For more information see [Kubernetes Topology Manager](https://kubernetes.io/docs/tasks/administer-cluster/topology-manager). The default is 'none'. Allowed values are 'none', 'best-effort', 'restricted', and 'single-numa-node'.\n\n"
  type = object({
    allowed_unsafe_sysctls    = optional(list(string))
    container_log_max_files   = optional(number)
    container_log_max_size_mb = optional(number)
    cpu_cfs_quota             = optional(bool)
    cpu_cfs_quota_period      = optional(string)
    cpu_manager_policy        = optional(string)
    fail_swap_on              = optional(bool)
    image_gc_high_threshold   = optional(number)
    image_gc_low_threshold    = optional(number)
    pod_max_pids              = optional(number)
    topology_manager_policy   = optional(string)
  })
  default = null
}

variable "kubelet_disk_type" {
  description = "Determines the placement of emptyDir volumes, container runtime data root, and Kubelet ephemeral storage.\n"
  type        = string
  default     = null
}

variable "linux_os_config" {
  description = "OS configurations of Linux agent nodes. See [AKS custom node configuration](https://docs.microsoft.com/azure/aks/custom-node-configuration) for more details.\n\n- swap_file_size_mb - The size in MB of a swap file that will be created on each node.\n- sysctls - Sysctl settings for Linux agent nodes.\n  - fs_aio_max_nr - Sysctl setting fs.aio-max-nr.\n  - fs_file_max - Sysctl setting fs.file-max.\n  - fs_inotify_max_user_watches - Sysctl setting fs.inotify.max_user_watches.\n  - fs_nr_open - Sysctl setting fs.nr_open.\n  - kernel_threads_max - Sysctl setting kernel.threads-max.\n  - net_core_netdev_max_backlog - Sysctl setting net.core.netdev_max_backlog.\n  - net_core_optmem_max - Sysctl setting net.core.optmem_max.\n  - net_core_rmem_default - Sysctl setting net.core.rmem_default.\n  - net_core_rmem_max - Sysctl setting net.core.rmem_max.\n  - net_core_somaxconn - Sysctl setting net.core.somaxconn.\n  - net_core_wmem_default - Sysctl setting net.core.wmem_default.\n  - net_core_wmem_max - Sysctl setting net.core.wmem_max.\n  - net_ipv4_ip_local_port_range - Sysctl setting net.ipv4.ip_local_port_range.\n  - net_ipv4_neigh_default_gc_thresh1 - Sysctl setting net.ipv4.neigh.default.gc_thresh1.\n  - net_ipv4_neigh_default_gc_thresh2 - Sysctl setting net.ipv4.neigh.default.gc_thresh2.\n  - net_ipv4_neigh_default_gc_thresh3 - Sysctl setting net.ipv4.neigh.default.gc_thresh3.\n  - net_ipv4_tcp_fin_timeout - Sysctl setting net.ipv4.tcp_fin_timeout.\n  - net_ipv4_tcp_keepalive_probes - Sysctl setting net.ipv4.tcp_keepalive_probes.\n  - net_ipv4_tcp_keepalive_time - Sysctl setting net.ipv4.tcp_keepalive_time.\n  - net_ipv4_tcp_max_syn_backlog - Sysctl setting net.ipv4.tcp_max_syn_backlog.\n  - net_ipv4_tcp_max_tw_buckets - Sysctl setting net.ipv4.tcp_max_tw_buckets.\n  - net_ipv4_tcp_tw_reuse - Sysctl setting net.ipv4.tcp_tw_reuse.\n  - net_ipv4_tcpkeepalive_intvl - Sysctl setting net.ipv4.tcp_keepalive_intvl.\n  - net_netfilter_nf_conntrack_buckets - Sysctl setting net.netfilter.nf_conntrack_buckets.\n  - net_netfilter_nf_conntrack_max - Sysctl setting net.netfilter.nf_conntrack_max.\n  - vm_max_map_count - Sysctl setting vm.max_map_count.\n  - vm_swappiness - Sysctl setting vm.swappiness.\n  - vm_vfs_cache_pressure - Sysctl setting vm.vfs_cache_pressure.\n- transparent_huge_page_defrag - Whether the kernel should make aggressive use of memory compaction to make more hugepages available. Valid values are 'always', 'defer', 'defer+madvise', 'madvise' and 'never'. The default is 'madvise'. For more information see [Transparent Hugepages](https://www.kernel.org/doc/html/latest/admin-guide/mm/transhuge.html#admin-guide-transhuge).\n- transparent_huge_page_enabled - Whether transparent hugepages are enabled. Valid values are 'always', 'madvise', and 'never'. The default is 'always'. For more information see [Transparent Hugepages](https://www.kernel.org/doc/html/latest/admin-guide/mm/transhuge.html#admin-guide-transhuge).\n\n"
  type = object({
    swap_file_size_mb = optional(number)
    sysctls = optional(object({
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
      net_ipv4_ip_local_port_range       = optional(string)
      net_ipv4_neigh_default_gc_thresh1  = optional(number)
      net_ipv4_neigh_default_gc_thresh2  = optional(number)
      net_ipv4_neigh_default_gc_thresh3  = optional(number)
      net_ipv4_tcp_fin_timeout           = optional(number)
      net_ipv4_tcp_keepalive_probes      = optional(number)
      net_ipv4_tcp_keepalive_time        = optional(number)
      net_ipv4_tcp_max_syn_backlog       = optional(number)
      net_ipv4_tcp_max_tw_buckets        = optional(number)
      net_ipv4_tcp_tw_reuse              = optional(bool)
      net_ipv4_tcpkeepalive_intvl        = optional(number)
      net_netfilter_nf_conntrack_buckets = optional(number)
      net_netfilter_nf_conntrack_max     = optional(number)
      vm_max_map_count                   = optional(number)
      vm_swappiness                      = optional(number)
      vm_vfs_cache_pressure              = optional(number)
    }))
    transparent_huge_page_defrag  = optional(string)
    transparent_huge_page_enabled = optional(string)
  })
  default = null
}

variable "local_dns_profile" {
  description = "Configures the per-node local DNS, with VnetDNS and KubeDNS overrides. LocalDNS helps improve performance and reliability of DNS resolution in an AKS cluster. For more details see aka.ms/aks/localdns.\n\n- kube_dns_overrides - LocalDNSOverrides is a map of zone names for Vnet and Kube DNS overrides.\n- mode - Mode of enablement for localDNS.\n- vnet_dns_overrides - LocalDNSOverrides is a map of zone names for Vnet and Kube DNS overrides.\n\n"
  type = object({
    kube_dns_overrides = optional(map(object({
      cache_duration_in_seconds       = optional(number)
      forward_destination             = optional(string)
      forward_policy                  = optional(string)
      max_concurrent                  = optional(number)
      protocol                        = optional(string)
      query_logging                   = optional(string)
      serve_stale                     = optional(string)
      serve_stale_duration_in_seconds = optional(number)
    })))
    mode = optional(string)
    vnet_dns_overrides = optional(map(object({
      cache_duration_in_seconds       = optional(number)
      forward_destination             = optional(string)
      forward_policy                  = optional(string)
      max_concurrent                  = optional(number)
      protocol                        = optional(string)
      query_logging                   = optional(string)
      serve_stale                     = optional(string)
      serve_stale_duration_in_seconds = optional(number)
    })))
  })
  default = null
}

variable "max_count" {
  description = "The maximum number of nodes for auto-scaling\n"
  type        = number
  default     = null
}

variable "max_pods" {
  description = "The maximum number of pods that can run on a node.\n"
  type        = number
  default     = null
}

variable "message_of_the_day" {
  description = "Message of the day for Linux nodes, base64-encoded. A base64-encoded string which will be written to /etc/motd after decoding. This allows customization of the message of the day for Linux nodes. It must not be specified for Windows nodes. It must be a static string (i.e., will be printed raw and not be executed as a script).\n"
  type        = string
  default     = null
}

variable "min_count" {
  description = "The minimum number of nodes for auto-scaling\n"
  type        = number
  default     = null
}

variable "mode" {
  description = "The mode of an agent pool. A cluster must have at least one 'System' Agent Pool at all times. For additional information on agent pool restrictions and best practices, see: https://docs.microsoft.com/azure/aks/use-system-pools\n"
  type        = string
  default     = null
}

variable "name" {
  description = "The name of the resource. The name must be 1-12 characters long, and must begin with a lowercase letter followed by lowercase letters or numbers.\nIf create_before_destroy is enabled, the name must be 1-8 characters long.\n"
  type        = string
  default     = ""
}

variable "network_profile" {
  description = "Network settings of an agent pool.\n\n- allowed_host_ports - The port ranges that are allowed to access. The specified ranges are allowed to overlap.\n- application_security_groups - The IDs of the application security groups which agent pool will associate when created.\n- node_public_ip_tags - The list of tags associated with the node public IP address.\n\n"
  type = object({
    allowed_host_ports = optional(list(object({
      port_end   = optional(number)
      port_start = optional(number)
      protocol   = optional(string)
    })))
    application_security_groups = optional(list(string))
    node_public_ip_tags = optional(list(object({
      ip_tag_type = optional(string)
      tag         = optional(string)
    })))
  })
  default = null
}

variable "node_labels" {
  description = "The node labels to be persisted across all nodes in agent pool.\n"
  type        = map(string)
  default     = null
}

variable "node_public_ip_prefix_id" {
  description = "The public IP prefix ID which VM nodes should use IPs from. This is of the form: /subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/publicIPPrefixes/{publicIPPrefixName}\n"
  type        = string
  default     = null
}

variable "node_taints" {
  description = "The taints added to new nodes during node pool create and scale. For example, key=value:NoSchedule.\n"
  type        = list(string)
  default     = null
}

variable "orchestrator_version" {
  description = "The version of Kubernetes specified by the user. Both patch version <major.minor.patch> (e.g. 1.20.13) and <major.minor> (e.g. 1.20) are supported. When <major.minor> is specified, the latest supported GA patch version is chosen automatically. Updating the cluster with the same <major.minor> once it has been created (e.g. 1.14.x -> 1.14) will not trigger an upgrade, even if a newer patch version is available. As a best practice, you should upgrade all node pools in an AKS cluster to the same Kubernetes version. The node pool version must have the same major version as the control plane. The node pool minor version must be within two minor versions of the control plane version. The node pool version cannot be greater than the control plane version. For more information see [upgrading a node pool](https://docs.microsoft.com/azure/aks/use-multiple-node-pools#upgrade-a-node-pool).\n"
  type        = string
  default     = null
}

variable "os_disk_size_gb" {
  description = "OS Disk Size in GB to be used to specify the disk size for every machine in the master/agent pool. If you specify 0, it will apply the default osDisk size according to the vmSize specified.\n"
  type        = number
  default     = null
}

variable "os_disk_type" {
  description = "The OS disk type to be used for machines in the agent pool. The default is 'Ephemeral' if the VM supports it and has a cache disk larger than the requested OSDiskSizeGB. Otherwise, defaults to 'Managed'. May not be changed after creation. For more information see [Ephemeral OS](https://docs.microsoft.com/azure/aks/cluster-configuration#ephemeral-os).\n"
  type        = string
  default     = null
}

variable "os_sku" {
  description = "Specifies the OS SKU used by the agent pool. The default is Ubuntu if OSType is Linux. The default is Windows2019 when Kubernetes <= 1.24 or Windows2022 when Kubernetes >= 1.25 if OSType is Windows.\n"
  type        = string
  default     = null
}

variable "os_type" {
  description = "The operating system type. The default is Linux.\n"
  type        = string
  default     = null
}

variable "output_data_only" {
  description = "Whether to disable creation of the resource and only output a the resource's body properties.\n"
  type        = bool
  default     = false
}

variable "parent_id" {
  description = "The parent resource ID for this resource.\n"
  type        = string
  default     = ""
}

variable "pod_ip_allocation_mode" {
  description = "Pod IP Allocation Mode. The IP allocation mode for pods in the agent pool. Must be used with podSubnetId. The default is 'DynamicIndividual'.\n"
  type        = string
  default     = null
}

variable "pod_subnet_id" {
  description = "The ID of the subnet which pods will join when launched. If omitted, pod IPs are statically assigned on the node subnet (see vnetSubnetID for more details). This is of the form: /subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/virtualNetworks/{virtualNetworkName}/subnets/{subnetName}\n"
  type        = string
  default     = null
}

variable "proximity_placement_group_id" {
  description = "The ID for Proximity Placement Group.\n"
  type        = string
  default     = null
}

variable "scale_down_mode" {
  description = "Describes how VMs are added to or removed from Agent Pools. See [billing states](https://docs.microsoft.com/azure/virtual-machines/states-billing).\n"
  type        = string
  default     = null
}

variable "scale_set_eviction_policy" {
  description = "The Virtual Machine Scale Set eviction policy. The eviction policy specifies what to do with the VM when it is evicted. The default is Delete. For more information about eviction see [spot VMs](https://docs.microsoft.com/azure/virtual-machines/spot-vms)\n"
  type        = string
  default     = null
}

variable "scale_set_priority" {
  description = "The Virtual Machine Scale Set priority.\n"
  type        = string
  default     = null
}

variable "security_profile" {
  description = "The security settings of an agent pool.\n\n- enable_secure_boot - Secure Boot is a feature of Trusted Launch which ensures that only signed operating systems and drivers can boot. For more details, see aka.ms/aks/trustedlaunch.  If not specified, the default is false.\n- enable_vtpm - vTPM is a Trusted Launch feature for configuring a dedicated secure vault for keys and measurements held locally on the node. For more details, see aka.ms/aks/trustedlaunch. If not specified, the default is false.\n- ssh_access - SSH access method of an agent pool.\n\n"
  type = object({
    enable_secure_boot = optional(bool)
    enable_vtpm        = optional(bool)
    ssh_access         = optional(string)
  })
  default = null
}

variable "spot_max_price" {
  description = "The max price (in US Dollars) you are willing to pay for spot instances. Possible values are any decimal value greater than zero or -1 which indicates default price to be up-to on-demand. Possible values are any decimal value greater than zero or -1 which indicates the willingness to pay any on-demand price. For more details on spot pricing, see [spot VMs pricing](https://docs.microsoft.com/azure/virtual-machines/spot-vms#pricing)\n"
  type        = number
  default     = null
}

variable "tags" {
  description = "The tags to be persisted on the agent pool virtual machine scale set.\n"
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "Timeouts for create, read, update, and delete operations.\n"
  type = object({
    create = optional(string)
    read   = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = null
}

variable "type" {
  description = "The type of Agent Pool.\n"
  type        = string
  default     = null
}

variable "upgrade_settings" {
  description = "Settings for upgrading an agentpool\n\n- drain_timeout_in_minutes - The drain timeout for a node. The amount of time (in minutes) to wait on eviction of pods and graceful termination per node. This eviction wait time honors waiting on pod disruption budgets. If this time is exceeded, the upgrade fails. If not specified, the default is 30 minutes.\n- max_surge - The maximum number or percentage of nodes that are surged during upgrade. This can either be set to an integer (e.g. '5') or a percentage (e.g. '50%'). If a percentage is specified, it is the percentage of the total agent pool size at the time of the upgrade. For percentages, fractional nodes are rounded up. If not specified, the default is 10%. For more information, including best practices, see: https://learn.microsoft.com/en-us/azure/aks/upgrade-cluster\n- max_unavailable - The maximum number or percentage of nodes that can be simultaneously unavailable during upgrade. This can either be set to an integer (e.g. '1') or a percentage (e.g. '5%'). If a percentage is specified, it is the percentage of the total agent pool size at the time of the upgrade. For percentages, fractional nodes are rounded up. If not specified, the default is 0. For more information, including best practices, see: https://learn.microsoft.com/en-us/azure/aks/upgrade-cluster\n- node_soak_duration_in_minutes - The soak duration for a node. The amount of time (in minutes) to wait after draining a node and before reimaging it and moving on to next node. If not specified, the default is 0 minutes.\n- undrainable_node_behavior - Defines the behavior for undrainable nodes during upgrade. The most common cause of undrainable nodes is Pod Disruption Budgets (PDBs), but other issues, such as pod termination grace period is exceeding the remaining per-node drain timeout or pod is still being in a running state, can also cause undrainable nodes.\n\n"
  type = object({
    drain_timeout_in_minutes      = optional(number)
    max_surge                     = optional(string)
    max_unavailable               = optional(string, "0")
    node_soak_duration_in_minutes = optional(number)
    undrainable_node_behavior     = optional(string)
  })
  default = null
}

variable "virtual_machines_profile" {
  description = "Specifications on VirtualMachines agent pool.\n\n- scale - Specifications on how to scale a VirtualMachines agent pool.\n  - manual - Specifications on how to scale the VirtualMachines agent pool to a fixed size.\n\n"
  type = object({
    scale = optional(object({
      manual = optional(list(object({
        count = optional(number)
        size  = optional(string)
      })))
    }))
  })
  default = null
}

variable "vm_size" {
  description = "The size of the agent pool VMs. VM size availability varies by region. If a node contains insufficient compute resources (memory, cpu, etc) pods might fail to run correctly. For more details on restricted VM sizes, see: https://docs.microsoft.com/azure/aks/quotas-skus-regions\n"
  type        = string
  default     = null
}

variable "vnet_subnet_id" {
  description = "The ID of the subnet which agent pool nodes and optionally pods will join on startup. If this is not specified, a VNET and subnet will be generated and used. If no podSubnetID is specified, this applies to nodes and pods, otherwise it applies to just nodes. This is of the form: /subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/virtualNetworks/{virtualNetworkName}/subnets/{subnetName}\n"
  type        = string
  default     = null
}

variable "windows_profile" {
  description = "The Windows agent pool's specific profile.\n\n- disable_outbound_nat - Whether to disable OutboundNAT in windows nodes. The default value is false. Outbound NAT can only be disabled if the cluster outboundType is NAT Gateway and the Windows agent pool does not have node public IP enabled.\n\n"
  type = object({
    disable_outbound_nat = optional(bool)
  })
  default = null
}

variable "workload_runtime" {
  description = "Determines the type of workload a node can run.\n"
  type        = string
  default     = null
}
