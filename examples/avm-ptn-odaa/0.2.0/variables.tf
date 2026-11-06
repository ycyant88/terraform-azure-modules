variable "cloud_exadata_infrastructure" {
  description = "  Cloud Exadata Infrastructure resources  \n\n  - name - The name of the Cloud Exadata Infrastructure.\n  - location - The location of the Cloud Exadata Infrastructure.\n  - zone - (Optional) The availability zone of the Cloud Exadata Infrastructure.\n  - compute_count - The number of compute nodes in the Cloud Exadata Infrastructure.\n  - display_name - The display name of the Cloud Exadata Infrastructure.\n  - maintenance_window_loadtime_in_weeks - The maintenance window load time in weeks.\n  - maintenance_window_preference - The maintenance window preference.\n  - maintenance_window_patching_mode - The maintenance window patching mode.\n  - shape - The shape of the Cloud Exadata Infrastructure.\n  - storage_count - The number of storage servers in the Cloud Exadata Infrastructure.\n  - tags - (Optional) A mapping of tags to assign to the Cloud Exadata Infrastructure.\n"
  type = map(object({
    name                                 = string
    location                             = string
    zone                                 = string
    compute_count                        = number
    display_name                         = string
    maintenance_window_loadtime_in_weeks = optional(string, 0)
    maintenance_window_preference        = optional(string, "NoPreference")
    maintenance_window_patching_mode     = optional(string, "Rolling")
    shape                                = optional(string, "Exadata.X9M")
    storage_count                        = number
    tags                                 = optional(map(string))
  }))
  default = ""
}

variable "cloud_exadata_vm_cluster" {
  description = "  Cloud Exadata VM Cluster resources\n\n  - cluster_name - The name of the Cloud Exadata VM Cluster.\n  - display_name - The display name of the Cloud Exadata VM Cluster.\n  - data_storage_size_in_tbs - The data storage size in TBs.\n  - dbnode_storage_size_in_gbs - The DB node storage size in GBs.\n  - time_zone - The time zone of the Cloud Exadata VM Cluster.\n  - hostname - The hostname of the Cloud Exadata VM Cluster.\n  - domain - The domain of the Cloud Exadata VM Cluster.\n  - cpu_core_count - The CPU core count of the Cloud Exadata VM Cluster.\n  - ocpu_count - The OCPU count of the Cloud Exadata VM Cluster.\n  - data_storage_percentage - The data storage percentage of the Cloud Exadata VM Cluster.\n  - is_local_backup_enabled - The local backup enabled status of the Cloud Exadata VM Cluster.\n  - cloud_exadata_infra_name - This is a reference to the Cloud Infrastructure object specified in parameters\n  - is_sparse_diskgroup_enabled - The sparse diskgroup enabled status of the Cloud Exadata VM Cluster.\n  - ssh_public_keys - The SSH public keys of the Cloud Exadata VM Cluster.\n  - nsg_cidrs - (Optional) A set of NSG CIDRs of the Cloud Exadata VM Cluster.\n  - license_model - The license model of the Cloud Exadata VM Cluster.\n  - vnet_name - This is a reference to the VNET object specified in the Virtual networks parameter\n  - client_subnet_name - This is a reference to the Subnet object specified in the Subnet attribute in Vnet parameters\n  - gi_version - The GI version of the Cloud Exadata VM Cluster.\n  - backup_subnet_cidr - The backup subnet CIDR of the Cloud Exadata VM Cluster.\n  - is_diagnostic_events_enabled - (Optional) The diagnostic events enabled status of the Cloud Exadata VM Cluster.\n  - is_health_monitoring_enabled - (Optional) The health monitoring enabled status of the Cloud Exadata VM Cluster.\n  - is_incident_logs_enabled - (Optional) The incident logs enabled status of the Cloud Exadata VM Cluster.\n\n"
  type = map(object({
    cluster_name               = string
    display_name               = string
    cloud_exadata_infra_name   = string
    location                   = string
    data_storage_size_in_tbs   = number
    dbnode_storage_size_in_gbs = number
    hostname                   = string
    cpu_core_count             = number
    data_storage_percentage    = number
    memory_size_in_gbs         = number

    ssh_public_keys = list(string)
    nsg_cidrs = optional(set(object({
      source = string
      destination_port_range = optional(object({
        min = string
        max = string
      }), null)
    })))
    license_model                = optional(string, "LicenseIncluded")
    vnet_name                    = string
    client_subnet_name           = string
    backup_subnet_cidr           = string
    gi_version                   = optional(string, "19.0.0.0")
    time_zone                    = string
    is_local_backup_enabled      = optional(bool, true)
    is_sparse_diskgroup_enabled  = optional(bool, true)
    is_diagnostic_events_enabled = optional(bool, false)
    is_health_monitoring_enabled = optional(bool, false)
    is_incident_logs_enabled     = optional(bool, false)
    tags                         = optional(map(string))
  }))
  default = ""
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "location" {
  description = "Azure region where the resource should be deployed."
  type        = string
  default     = ""
}

variable "odaa_vnet_peerings" {
  description = "List of virtual network peerings to be setup"
  type = map(object({
    vnet_source_resource_group      = string
    vnet_destination_resource_group = string
    vnet_source_name                = string
    vnet_destination_name           = string
    }
  ))
  default = ""
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "virtual_networks" {
  description = "Virtual Network(s) for hosting Exadata appliances"
  type = map(object({
    address_space = list(string)
    name          = string
    ddos_protection_plan = optional(object({
      enable = bool
      id     = string
    }), null)
    encryption = optional(object({
      enforcement = string
    }), null)
    flow_timeout_in_minutes = optional(number, null)
    resource_group_name     = optional(string, null)
    subnet = optional(set(object({
      delegate_to_oracle = bool
      address_prefixes   = list(string)
      name               = string
      security_group     = optional(string, null)
    })), null)
    diagnostic_settings = optional(map(object({
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
    })), null)
    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
      principal_type                         = optional(string, null)
    })), null)
    lock = optional(object({
      kind = string
      name = optional(string, null)
    }), null)
  }))
  default = { "primaryvnet" : { "address_space" : ["10.0.0.0/16"], "name" : "vnet-odaa", "subnet" : [{ "address_prefixes" : ["10.0.0.0/24"], "delegate_to_oracle" : true, "name" : "client" }, { "address_prefixes" : ["10.0.1.0/24"], "delegate_to_oracle" : false, "name" : "backup" }] } }
}
