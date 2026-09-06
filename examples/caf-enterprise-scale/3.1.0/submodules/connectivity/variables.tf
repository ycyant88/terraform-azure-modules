variable "custom_azure_backup_geo_codes" {
  description = "If specified, the custom_azure_backup_geo_codes variable will override or append Geo Codes (value) used to generate region-specific DNS zone names for Azure Backup private endpoints.\nFor more information, please refer to: https://docs.microsoft.com/azure/backup/private-endpoints#when-using-custom-dns-server-or-host-files\n"
  type        = map(string)
  default     = {}
}

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

variable "existing_virtual_wan_resource_group_name" {
  description = "If specified, module will skip creation of the Virtual WAN resource group and use existing. All Virtual Hubs created by the module will be created in the specified Virtual WAN resource group."
  type        = string
  default     = ""
}

variable "existing_virtual_wan_resource_id" {
  description = "If specified, module will skip creation of the Virtual WAN and use existing. All Virtual Hubs created by the module will be associated with the specified Virtual WAN."
  type        = string
  default     = ""
}

variable "location" {
  description = "Sets the default location used for resource deployments where needed."
  type        = string
  default     = "eastus"
}

variable "resource_group_per_virtual_hub_location" {
  description = "If set to true, module will place each Virtual Hub (and associated resources) in a location-specific Resource Group. Default behaviour is to colocate Virtual Hub resources in the same Resource Group as the Virtual WAN resource."
  type        = bool
  default     = false
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
  description = "If specified, will customize the \"Connectivity\" landing zone settings and resources."
  type = object({
    hub_networks = optional(list(
      object({
        enabled = optional(bool, true)
        config = object({
          address_space                = list(string)
          location                     = optional(string, "")
          link_to_ddos_protection_plan = optional(bool, false)
          dns_servers                  = optional(list(string), [])
          bgp_community                = optional(string, "")
          subnets = optional(list(
            object({
              name                      = string
              address_prefixes          = list(string)
              network_security_group_id = optional(string, "")
              route_table_id            = optional(string, "")
            })
          ), [])
          virtual_network_gateway = optional(object({
            enabled = optional(bool, false)
            config = optional(object({
              address_prefix           = optional(string, "")
              gateway_sku_expressroute = optional(string, "")
              gateway_sku_vpn          = optional(string, "")
              advanced_vpn_settings = optional(object({
                enable_bgp                       = optional(bool, null)
                active_active                    = optional(bool, null)
                private_ip_address_allocation    = optional(string, "")
                default_local_network_gateway_id = optional(string, "")
                vpn_client_configuration = optional(list(
                  object({
                    address_space = list(string)
                    aad_tenant    = optional(string, null)
                    aad_audience  = optional(string, null)
                    aad_issuer    = optional(string, null)
                    root_certificate = optional(list(
                      object({
                        name             = string
                        public_cert_data = string
                      })
                    ), [])
                    revoked_certificate = optional(list(
                      object({
                        name             = string
                        public_cert_data = string
                      })
                    ), [])
                    radius_server_address = optional(string, null)
                    radius_server_secret  = optional(string, null)
                    vpn_client_protocols  = optional(list(string), [])
                    vpn_auth_types        = optional(list(string), [])
                  })
                ), [])
                bgp_settings = optional(list(
                  object({
                    asn         = optional(number, null)
                    peer_weight = optional(number, null)
                    peering_addresses = optional(list(
                      object({
                        ip_configuration_name = optional(string, null)
                        apipa_addresses       = optional(list(string), [])
                      })
                    ), [])
                  })
                ), [])
                custom_route = optional(list(
                  object({
                    address_prefixes = optional(list(string), [])
                  })
                ), [])
              }), {})
            }), {})
          }), {})
          azure_firewall = optional(object({
            enabled = optional(bool, false)
            config = optional(object({
              address_prefix                = optional(string, "")
              enable_dns_proxy              = optional(bool, true)
              dns_servers                   = optional(list(string), [])
              sku_tier                      = optional(string, "Standard")
              base_policy_id                = optional(string, "")
              private_ip_ranges             = optional(list(string), [])
              threat_intelligence_mode      = optional(string, "Alert")
              threat_intelligence_allowlist = optional(list(string), [])
              availability_zones = optional(object({
                zone_1 = optional(bool, true)
                zone_2 = optional(bool, true)
                zone_3 = optional(bool, true)
              }), {})
            }), {})
          }), {})
          spoke_virtual_network_resource_ids      = optional(list(string), [])
          enable_outbound_virtual_network_peering = optional(bool, false)
          enable_hub_network_mesh_peering         = optional(bool, false)
        })
      })
    ), [])
    vwan_hub_networks = optional(list(
      object({
        enabled = optional(bool, true)
        config = object({
          address_prefix = string
          location       = string
          sku            = optional(string, "")
          routes = optional(list(
            object({
              address_prefixes    = list(string)
              next_hop_ip_address = string
            })
          ), [])
          expressroute_gateway = optional(object({
            enabled = optional(bool, false)
            config = optional(object({
              scale_unit = optional(number, 1)
            }), {})
          }), {})
          vpn_gateway = optional(object({
            enabled = optional(bool, false)
            config = optional(object({
              bgp_settings = optional(list(
                object({
                  asn         = number
                  peer_weight = number
                  instance_0_bgp_peering_address = optional(list(
                    object({
                      custom_ips = list(string)
                    })
                  ), [])
                  instance_1_bgp_peering_address = optional(list(
                    object({
                      custom_ips = list(string)
                    })
                  ), [])
                })
              ), [])
              routing_preference = optional(string, "Microsoft Network")
              scale_unit         = optional(number, 1)
            }), {})
          }), {})
          azure_firewall = optional(object({
            enabled = optional(bool, false)
            config = optional(object({
              enable_dns_proxy              = optional(bool, true)
              dns_servers                   = optional(list(string), [])
              sku_tier                      = optional(string, "Standard")
              base_policy_id                = optional(string, "")
              private_ip_ranges             = optional(list(string), [])
              threat_intelligence_mode      = optional(string, "Alert")
              threat_intelligence_allowlist = optional(list(string), [])
              availability_zones = optional(object({
                zone_1 = optional(bool, true)
                zone_2 = optional(bool, true)
                zone_3 = optional(bool, true)
              }), {})
            }), {})
          }), {})
          spoke_virtual_network_resource_ids        = optional(list(string), [])
          secure_spoke_virtual_network_resource_ids = optional(list(string), [])
          enable_virtual_hub_connections            = optional(bool, false)
        })
      })
    ), [])
    ddos_protection_plan = optional(object({
      enabled = optional(bool, false)
      config = optional(object({
        location = optional(string, "")
      }), {})
    }), {})
    dns = optional(object({
      enabled = optional(bool, true)
      config = optional(object({
        location = optional(string, "")
        enable_private_link_by_service = optional(object({
          azure_api_management                 = optional(bool, true)
          azure_app_configuration_stores       = optional(bool, true)
          azure_arc                            = optional(bool, true)
          azure_automation_dscandhybridworker  = optional(bool, true)
          azure_automation_webhook             = optional(bool, true)
          azure_backup                         = optional(bool, true)
          azure_batch_account                  = optional(bool, true)
          azure_bot_service_bot                = optional(bool, true)
          azure_bot_service_token              = optional(bool, true)
          azure_cache_for_redis                = optional(bool, true)
          azure_cache_for_redis_enterprise     = optional(bool, true)
          azure_container_registry             = optional(bool, true)
          azure_cosmos_db_cassandra            = optional(bool, true)
          azure_cosmos_db_gremlin              = optional(bool, true)
          azure_cosmos_db_mongodb              = optional(bool, true)
          azure_cosmos_db_sql                  = optional(bool, true)
          azure_cosmos_db_table                = optional(bool, true)
          azure_data_explorer                  = optional(bool, true)
          azure_data_factory                   = optional(bool, true)
          azure_data_factory_portal            = optional(bool, true)
          azure_data_health_data_services      = optional(bool, true)
          azure_data_lake_file_system_gen2     = optional(bool, true)
          azure_database_for_mariadb_server    = optional(bool, true)
          azure_database_for_mysql_server      = optional(bool, true)
          azure_database_for_postgresql_server = optional(bool, true)
          azure_digital_twins                  = optional(bool, true)
          azure_event_grid_domain              = optional(bool, true)
          azure_event_grid_topic               = optional(bool, true)
          azure_event_hubs_namespace           = optional(bool, true)
          azure_file_sync                      = optional(bool, true)
          azure_hdinsights                     = optional(bool, true)
          azure_iot_dps                        = optional(bool, true)
          azure_iot_hub                        = optional(bool, true)
          azure_key_vault                      = optional(bool, true)
          azure_key_vault_managed_hsm          = optional(bool, true)
          azure_kubernetes_service_management  = optional(bool, true)
          azure_machine_learning_workspace     = optional(bool, true)
          azure_managed_disks                  = optional(bool, true)
          azure_media_services                 = optional(bool, true)
          azure_migrate                        = optional(bool, true)
          azure_monitor                        = optional(bool, true)
          azure_purview_account                = optional(bool, true)
          azure_purview_studio                 = optional(bool, true)
          azure_relay_namespace                = optional(bool, true)
          azure_search_service                 = optional(bool, true)
          azure_service_bus_namespace          = optional(bool, true)
          azure_site_recovery                  = optional(bool, true)
          azure_sql_database_sqlserver         = optional(bool, true)
          azure_synapse_analytics_dev          = optional(bool, true)
          azure_synapse_analytics_sql          = optional(bool, true)
          azure_synapse_studio                 = optional(bool, true)
          azure_web_apps_sites                 = optional(bool, true)
          azure_web_apps_static_sites          = optional(bool, true)
          cognitive_services_account           = optional(bool, true)
          microsoft_power_bi                   = optional(bool, true)
          signalr                              = optional(bool, true)
          signalr_webpubsub                    = optional(bool, true)
          storage_account_blob                 = optional(bool, true)
          storage_account_file                 = optional(bool, true)
          storage_account_queue                = optional(bool, true)
          storage_account_table                = optional(bool, true)
          storage_account_web                  = optional(bool, true)
        }), {})
        private_link_locations                                 = optional(list(string), [])
        public_dns_zones                                       = optional(list(string), [])
        private_dns_zones                                      = optional(list(string), [])
        enable_private_dns_zone_virtual_network_link_on_hubs   = optional(bool, true)
        enable_private_dns_zone_virtual_network_link_on_spokes = optional(bool, true)
        virtual_network_resource_ids_to_link                   = optional(list(string), [])
      }), {})
    }), {})
  })
  default = {}
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
