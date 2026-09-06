variable "allow_branch_to_branch_traffic" {
  description = "Switch to flip VWAN branch to branch traffic"
  type        = bool
  default     = ""
}

variable "create_resource_group" {
  description = "If true will create a resource group, otherwise will use the existing resource group supplied in resource_group_name"
  type        = bool
  default     = false
}

variable "disable_vpn_encryption" {
  description = "Switch to flip VWAN vpn encryption"
  type        = bool
  default     = false
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see https://aka.ms/avm/telemetryinfo.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "er_circuit_connections" {
  description = "Mapping object to link ER circuits to ER Gateways for the creation of connection"
  type = map(object({
    name                                 = string
    express_route_gateway_key            = string
    express_route_circuit_peering_id     = string
    authorization_key                    = optional(string)
    enable_internet_security             = optional(bool)
    express_route_gateway_bypass_enabled = optional(bool)
    routing = optional(object({
      associated_route_table_id = string
      propagated_route_table = optional(object({
        route_table_ids = optional(list(string))
        labels          = optional(list(string))
      }))
      inbound_route_map_id  = optional(string)
      outbound_route_map_id = optional(string)
    }))
    routing_weight = optional(number)
  }))
  default = {}
}

variable "expressroute_gateways" {
  description = "Express Route Gateway parameters"
  type = map(object({
    name                          = string
    virtual_hub_key               = string
    tags                          = optional(map(string))
    allow_non_virtual_wan_traffic = optional(bool)
    scale_units                   = optional(number, 1)
  }))
  default = {}
}

variable "firewalls" {
  description = "Azure Firewall parameters"
  type = map(object({
    virtual_hub_key      = string
    sku_name             = string
    sku_tier             = string
    name                 = optional(string)
    dns_servers          = optional(list(string))
    firewall_policy_id   = optional(string)
    private_ip_ranges    = optional(list(string))
    threat_intel_mode    = optional(string, "Alert")
    zones                = optional(list(string))
    vhub_public_ip_count = optional(string)
    tags                 = optional(map(string))
    default_ip_configuration = optional(object({
      name = optional(string)
      public_ip_config = optional(object({
        name       = optional(set(string))
        zones      = optional(set(string))
        ip_version = optional(string)
        sku_tier   = optional(string, "Regional")
      }))
    }))
    management_ip_configuration = optional(object({
      name                 = string
      subnet_id            = string
      public_ip_address_id = string
    }))
    ip_configuration = optional(object({
      name                 = string
      subnet_id            = string
      public_ip_address_id = string
    }))
  }))
  default = {}
}

variable "location" {
  description = "Virtual WAN location"
  type        = string
  default     = ""
}

variable "office365_local_breakout_category" {
  description = "Specifies the Office365 local breakout category. Possible values include: Optimize, OptimizeAndAllow, All, None. Defaults to None "
  type        = string
  default     = "None"
}

variable "p2s_gateway_vpn_server_configurations" {
  description = "P2S VPN Gateway server configuration parameters"
  type = map(object({
    name                     = string
    virtual_hub_key          = string
    vpn_authentication_types = list(string)
    tags                     = optional(map(string))
    client_root_certificate = optional(object({
      name             = string
      public_cert_data = string
    }))
    azure_active_directory_authentication = optional(object({
      audience = string
      issuer   = string
      tenant   = string
    }))
    ipsec_policy = optional(object({
      dh_group               = string
      ike_encryption         = string
      ike_integrity          = string
      ipsec_encryption       = string
      ipsec_integrity        = string
      pfs_group              = string
      sa_lifetime_seconds    = string
      sa_data_size_kilobytes = string
    }))
    vpn_protocols = optional(list(string))
  }))
  default = {}
}

variable "p2s_gateways" {
  description = "P2S VPN Gateway parameters"
  type = map(object({
    name                                     = string
    virtual_hub_key                          = string
    tags                                     = optional(map(string))
    p2s_gateway_vpn_server_configuration_key = string
    connection_configuration = object({
      name = string
      vpn_client_address_pool = object({
        address_prefixes = list(string)
      })
    })
    routing_preference                  = optional(string)
    scale_unit                          = number
    dns_servers                         = optional(list(string))
    routing_preference_internet_enabled = optional(bool)
  }))
  default = {}
}

variable "resource_group_name" {
  description = "Virtual WAN Resource group name"
  type        = string
  default     = ""
}

variable "resource_group_tags" {
  description = "Virtual WAN Resource group tags"
  type        = map(string)
  default     = {}
}

variable "routing_intents" {
  description = "Routing intent for virutal hubs"
  type = map(object({
    name            = string
    virtual_hub_key = string
    routing_policies = list(object({
      name                  = string
      destinations          = list(string)
      next_hop_firewall_key = string
    }))
  }))
  default = {}
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "type" {
  description = "Type of the virtual WAN"
  type        = string
  default     = "Standard"
}

variable "virtual_hubs" {
  description = "Virtual Hub parameters"
  type = map(object({
    name                   = string
    location               = string
    resource_group         = optional(string, null)
    address_prefix         = string
    tags                   = optional(map(string))
    hub_routing_preference = optional(string)
  }))
  default = {}
}

variable "virtual_network_connections" {
  description = "Azure virtual network connections"
  type = map(object({
    name                      = string
    virtual_hub_key           = string
    remote_virtual_network_id = string
    internet_security_enabled = optional(bool, false)
    routing = optional(object({
      associated_route_table_id = string
      propagated_route_table = optional(object({
        route_table_ids = optional(list(string), [])
        labels          = optional(list(string), [])
      }))
      static_vnet_route = optional(object({
        name                = optional(string)
        address_prefixes    = optional(list(string), [])
        next_hop_ip_address = optional(string)
      }))
    }))
  }))
  default = {}
}

variable "virtual_wan_name" {
  description = "Virtual WAN name"
  type        = string
  default     = ""
}

variable "virtual_wan_tags" {
  description = "Virtual WAN tags"
  type        = map(string)
  default     = {}
}

variable "vpn_gateways" {
  description = "S2S VPN Gateway parameters"
  type = map(object({
    name                                  = string
    virtual_hub_key                       = string
    tags                                  = optional(map(string))
    bgp_route_translation_for_nat_enabled = optional(bool)
    bgp_settings = optional(object({
      asn = number
      instance_0_bgp_peering_address = optional(object({
        custom_ips = list(string)
      }))
      instance_1_bgp_peering_address = optional(object({
        custom_ips = list(string)
      }))
      peer_weight = number
    }))
    routing_preference = optional(string)
    scale_unit         = optional(number)
  }))
  default = {}
}

variable "vpn_site_connections" {
  description = "S2S VPN Site Connections parameter"
  type = map(object({
    name                = string
    vpn_gateway_key     = string
    remote_vpn_site_key = string
    vpn_links = list(object({
      name                 = string
      egress_nat_rule_ids  = optional(list(string))
      ingress_nat_rule_ids = optional(list(string))
      # Index of the link on the vpn gateway
      vpn_site_link_number = number
      bandwidth_mbps       = optional(number)
      bgp_enabled          = optional(bool)
      connection_mode      = optional(string)

      ipsec_policy = optional(object({
        dh_group                 = string
        ike_encryption_algorithm = string
        ike_integrity_algorithm  = string
        encryption_algorithm     = string
        integrity_algorithm      = string
        pfs_group                = string
        sa_data_size_kb          = string
        sa_lifetime_sec          = string
      }))
      protocol                              = optional(string)
      ratelimit_enabled                     = optional(bool)
      route_weight                          = optional(number)
      shared_key                            = optional(string)
      local_azure_ip_address_enabled        = optional(bool)
      policy_based_traffic_selector_enabled = optional(bool)
      custom_bgp_address = optional(list(object({
        ip_address          = string
        ip_configuration_id = string
      })))
    }))
    internet_security_enabled = optional(bool)
    routing = optional(object({
      associated_route_table = string
      propagated_route_table = optional(object({
        route_table_ids = optional(list(string))
        labels          = optional(list(string))
      }))
      inbound_route_map_id  = optional(string)
      outbound_route_map_id = optional(string)
    }))
    traffic_selector_policy = optional(object({
      local_address_ranges  = string
      remote_address_ranges = string
    }))
  }))
  default = {}
}

variable "vpn_sites" {
  description = "S2S VPN Sites parameter"
  type = map(object({
    name = string
    # Name of the virtual hub
    virtual_hub_key = string
    links = list(object({
      name = string
      bgp = optional(object({
        asn             = number
        peering_address = string
      }))
      fqdn          = optional(string)
      ip_address    = optional(string)
      provider_name = optional(string)
      speed_in_mbps = optional(number)
      }
    ))
    address_cidrs = optional(list(string))
    device_model  = optional(string)
    device_vendor = optional(string)
    o365_policy = optional(object({
      traffic_category = object({
        allow_endpoint_enabled    = optional(bool)
        default_endpoint_enabled  = optional(bool)
        optimize_endpoint_enabled = optional(bool)
      })
    }))
    tags = optional(map(string))
  }))
  default = {}
}
