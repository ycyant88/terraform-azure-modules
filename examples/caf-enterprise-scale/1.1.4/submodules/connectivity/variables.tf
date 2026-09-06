variable "custom_settings_by_resource_type" {
  description = "If specified, allows full customization of common settings for all resources (by type) deployed by this module."
  type        = any
  default     = {}
}

variable "enabled" {
  description = "Controls whether to manage the connectivity landing zone policies and deploy the connectivity resources into the current Subscription context."
  type        = bool
  default     = ""
}

variable "existing_ddos_protection_plan_resource_id" {
  description = "If specified, module will skip creation of DDoS Protection Plan and use existing."
  type        = string
  default     = ""
}

variable "location" {
  description = "Sets the default location used for resource deployments where needed."
  type        = string
  default     = "eastus"
}

variable "resource_prefix" {
  description = "If specified, will set the resource name prefix for connectivity resources (default value determined from \"var.root_id\")."
  type        = string
  default     = ""
}

variable "resource_suffix" {
  description = "If specified, will set the resource name suffix for connectivity resources."
  type        = string
  default     = ""
}

variable "root_id" {
  description = "Specifies the ID of the Enterprise-scale root Management Group, used as a prefix for resources created by this module."
  type        = string
  default     = ""
}

variable "settings" {
  description = ""
  type = object({
    hub_networks = list(
      object({
        enabled = bool
        config = object({
          address_space                = list(string)
          location                     = string
          link_to_ddos_protection_plan = bool
          dns_servers                  = list(string)
          bgp_community                = string
          subnets = list(
            object({
              name                      = string
              address_prefixes          = list(string)
              network_security_group_id = string
              route_table_id            = string
            })
          )
          virtual_network_gateway = object({
            enabled = bool
            config = object({
              address_prefix           = string
              gateway_sku_expressroute = string
              gateway_sku_vpn          = string
            })
          })
          azure_firewall = object({
            enabled = bool
            config = object({
              address_prefix   = string
              enable_dns_proxy = bool
              availability_zones = object({
                zone_1 = bool
                zone_2 = bool
                zone_3 = bool
              })
            })
          })
          spoke_virtual_network_resource_ids      = list(string)
          enable_outbound_virtual_network_peering = bool
        })
      })
    )
    vwan_hub_networks = list(object({}))
    ddos_protection_plan = object({
      enabled = bool
      config = object({
        location = string
      })
    })
    dns = object({
      enabled = bool
      config = object({
        location = string
        enable_private_link_by_service = object({
          azure_automation_webhook             = bool
          azure_automation_dscandhybridworker  = bool
          azure_sql_database_sqlserver         = bool
          azure_synapse_analytics_sqlserver    = bool
          azure_synapse_analytics_sql          = bool
          storage_account_blob                 = bool
          storage_account_table                = bool
          storage_account_queue                = bool
          storage_account_file                 = bool
          storage_account_web                  = bool
          azure_data_lake_file_system_gen2     = bool
          azure_cosmos_db_sql                  = bool
          azure_cosmos_db_mongodb              = bool
          azure_cosmos_db_cassandra            = bool
          azure_cosmos_db_gremlin              = bool
          azure_cosmos_db_table                = bool
          azure_database_for_postgresql_server = bool
          azure_database_for_mysql_server      = bool
          azure_database_for_mariadb_server    = bool
          azure_key_vault                      = bool
          azure_kubernetes_service_management  = bool
          azure_search_service                 = bool
          azure_container_registry             = bool
          azure_app_configuration_stores       = bool
          azure_backup                         = bool
          azure_site_recovery                  = bool
          azure_event_hubs_namespace           = bool
          azure_service_bus_namespace          = bool
          azure_iot_hub                        = bool
          azure_relay_namespace                = bool
          azure_event_grid_topic               = bool
          azure_event_grid_domain              = bool
          azure_web_apps_sites                 = bool
          azure_machine_learning_workspace     = bool
          signalr                              = bool
          azure_monitor                        = bool
          cognitive_services_account           = bool
          azure_file_sync                      = bool
          azure_data_factory                   = bool
          azure_data_factory_portal            = bool
          azure_cache_for_redis                = bool
        })
        private_link_locations                                 = list(string)
        public_dns_zones                                       = list(string)
        private_dns_zones                                      = list(string)
        enable_private_dns_zone_virtual_network_link_on_hubs   = bool
        enable_private_dns_zone_virtual_network_link_on_spokes = bool
      })
    })
  })
  default = ""
}

variable "subscription_id" {
  description = "Specifies the Subscription ID for the Subscription containing all connectivity resources."
  type        = string
  default     = ""
}

variable "tags" {
  description = "If specified, will set the default tags for all resources deployed by this module where supported."
  type        = map(string)
  default     = {}
}
