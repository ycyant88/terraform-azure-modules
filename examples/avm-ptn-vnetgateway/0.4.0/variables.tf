variable "default_tags" {
  description = "Tags to apply to all resources."
  type        = map(string)
  default     = {}
}

variable "edge_zone" {
  description = "Specifies the Edge Zone within the Azure Region where this Virtual Network Gateway should exist. Changing this forces a new Virtual Network Gateway to be created."
  type        = string
  default     = null
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see https://aka.ms/avm/telemetryinfo.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "express_route_circuits" {
  description = "Map of Virtual Network Gateway Connections and Peering Configurations to create for existing ExpressRoute circuits.\n\n- id - (Required) The ID of the ExpressRoute circuit.\n\n- connection - (Optional) a connection block as defined below. Used to configure the Virtual Network Gateway Connection between the ExpressRoute Circuit and the Virtual Network Gateway.\n  - authorization_key - (Optional) The authorization key for the ExpressRoute Circuit.\n  - express_route_gateway_bypass - (Optional) Whether to bypass the ExpressRoute Gateway for data forwarding.\n  - name - (Optional) The name of the Virtual Network Gateway Connection.\n  - routing_weight - (Optional) The weight added to routes learned from this Virtual Network Gateway Connection. Defaults to 10.\n  - shared_key - (Optional) The shared key for the Virtual Network Gateway Connection.\n  - tags - (Optional) A mapping of tags to assign to the resource.\n\n- peering - (Optional) a peering block as defined below. Used to configure the ExpressRoute Circuit Peering.\n  - peering_type - (Required) The type of the peering. Possible values are AzurePrivatePeering, AzurePublicPeering or MicrosoftPeering.\n  - vlan_id - (Required) The VLAN ID for the peering.\n  - resource_group_name - (Optional) The name of the resource group in which to put the ExpressRoute Circuit Peering. Defaults to the resource group of the Virtual Network Gateway.\n  - ipv4_enabled - (Optional) Whether IPv4 is enabled on the peering. Defaults to true.\n  - peer_asn - (Optional) The peer ASN.\n  - primary_peer_address_prefix - (Optional) The primary address prefix.\n  - secondary_peer_address_prefix - (Optional) The secondary address prefix.\n  - shared_key - (Optional) The shared key for the peering.\n  - route_filter_id - (Optional) The ID of the route filter to apply to the peering.\n  - microsoft_peering_config - (Optional) a microsoft_peering_config block as defined below. Used to configure the Microsoft Peering.\n    - advertised_communities - (Optional) The list of communities to advertise to the Microsoft Peering.\n    - advertised_public_prefixes - (Required) The list of public prefixes to advertise to the Microsoft Peering.\n    - customer_asn - (Optional) The customer ASN.\n    - routing_registry_name - (Optional) The routing registry name.\n"
  type = map(object({
    id = string
    connection = optional(object({
      authorization_key            = optional(string, null)
      express_route_gateway_bypass = optional(bool, null)
      name                         = optional(string, null)
      routing_weight               = optional(number, null)
      shared_key                   = optional(string, null)
      tags                         = optional(map(string), {})
    }), null)
    peering = optional(object({
      peering_type                  = string
      vlan_id                       = number
      resource_group_name           = optional(string, null)
      ipv4_enabled                  = optional(bool, true)
      peer_asn                      = optional(number, null)
      primary_peer_address_prefix   = optional(string, null)
      secondary_peer_address_prefix = optional(string, null)
      shared_key                    = optional(string, null)
      route_filter_id               = optional(string, null)
      microsoft_peering_config = optional(object({
        advertised_public_prefixes = list(string)
        advertised_communities     = optional(list(string), null)
        customer_asn               = optional(number, null)
        routing_registry_name      = optional(string, null)
      }), null)
    }), null)
  }))
  default = {}
}

variable "ip_configurations" {
  description = "Map of IP Configurations to create for the Virtual Network Gateway.\n\n- name - (Optional) The name of the IP Configuration.\n- apipa_addresses - (Optional) The list of APPIPA addresses.\n- private_ip_address_allocation - (Optional) The private IP allocation method. Possible values are Static or Dynamic. Defaults to Dynamic.\n- public_ip - (Optional) a public_ip block as defined below. Used to configure the Public IP Address for the IP Configuration.\n  - id - (Optional) The resource id of an existing public ip address to use for the IP Configuration.\n  - name - (Optional) The name of the Public IP Address.\n  - allocation_method - (Optional) The allocation method of the Public IP Address. Possible values are Static or Dynamic. Defaults to Dynamic.\n  - sku - (Optional) The SKU of the Public IP Address. Possible values are Basic or Standard. Defaults to Standard.\n  - tags - (Optional) A mapping of tags to assign to the resource.\n  - zones - (Optional) The list of availability zones for the Public IP Address.\n  - edge_zone - (Optional) Specifies the Edge Zone within the Azure Region where this Public IP should exist. Changing this forces a new Public IP to be created.\n  - ddos_protection_mode - (Optional) The DDoS protection mode of the Public IP Address. Possible values are Disabled, Enabled or VirtualNetworkInherited. Defaults to VirtualNetworkInherited.\n  - ddos_protection_plan_id - (Optional) The ID of the DDoS protection plan for the Public IP Address.\n  - domain_name_label - (Optional) The domain name label for the Public IP Address.\n  - idle_timeout_in_minutes - (Optional) The idle timeout in minutes for the Public IP Address.\n  - ip_tags - (Optional) A mapping of IP tags to assign to the resource.\n  - ip_version - (Optional) The IP version of the Public IP Address. Possible values are IPv4 or IPv6. Defaults to IPv4.\n  - public_ip_prefix_id - (Optional) The ID of the Public IP Prefix for the Public IP Address.\n  - reverse_fqdn - (Optional) The reverse FQDN for the Public IP Address.\n  - sku_tier - (Optional) The tier of the Public IP Address. Possible values are Regional or Global. Defaults to Regional.\n"
  type = map(object({
    name                          = optional(string, null)
    apipa_addresses               = optional(list(string), null)
    private_ip_address_allocation = optional(string, "Dynamic")
    public_ip = optional(object({
      id                      = optional(string, null)
      name                    = optional(string, null)
      allocation_method       = optional(string, "Static")
      sku                     = optional(string, "Standard")
      tags                    = optional(map(string), {})
      zones                   = optional(list(number), [1, 2, 3])
      edge_zone               = optional(string, null)
      ddos_protection_mode    = optional(string, "VirtualNetworkInherited")
      ddos_protection_plan_id = optional(string, null)
      domain_name_label       = optional(string, null)
      idle_timeout_in_minutes = optional(number, null)
      ip_tags                 = optional(map(string), {})
      ip_version              = optional(string, "IPv4")
      public_ip_prefix_id     = optional(string, null)
      reverse_fqdn            = optional(string, null)
      sku_tier                = optional(string, "Regional")
    }), {})
  }))
  default = {}
}

variable "local_network_gateways" {
  description = "Map of Local Network Gateways and Virtual Network Gateway Connections to create for the Virtual Network Gateway.\n\n- id - (Optional) The ID of the pre-exisitng Local Network Gateway.\n- name - (Optional) The name of the Local Network Gateway to create.\n- address_space - (Optional) The list of address spaces for the Local Network Gateway.\n- gateway_fqdn - (Optional) The gateway FQDN for the Local Network Gateway.\n- gateway_address - (Optional) The gateway IP address for the Local Network Gateway.\n- tags - (Optional) A mapping of tags to assign to the resource.\n- bgp_settings - (Optional) a bgp_settings block as defined below. Used to configure the BGP settings for the Local Network Gateway.\n  - asn - (Required) The ASN of the Local Network Gateway.\n  - bgp_peering_address - (Required) The BGP peering address of the Local Network Gateway.\n  - peer_weight - (Optional) The weight added to routes learned from this BGP speaker.\n\n- connection - (Optional) a connection block as defined below. Used to configure the Virtual Network Gateway Connection for the Local Network Gateway.\n  - name - (Optional) The name of the Virtual Network Gateway Connection.\n  - type - (Required) The type of Virtual Network Gateway Connection. Possible values are IPsec or Vnet2Vnet.\n  - connection_mode - (Optional) The connection mode.\n  - connection_protocol - (Optional) The connection protocol. Possible values are IKEv2 or IKEv1.\n  - dpd_timeout_seconds - (Optional) The dead peer detection timeout in seconds.\n  - egress_nat_rule_ids - (Optional) The list of egress NAT rule IDs.\n  - enable_bgp - (Optional) Whether or not BGP is enabled for this Virtual Network Gateway Connection.\n  - ingress_nat_rule_ids - (Optional) The list of ingress NAT rule IDs.\n  - local_azure_ip_address_enabled - (Optional) Whether or not the local Azure IP address is enabled.\n  - peer_virtual_network_gateway_id - (Optional) The ID of the peer Virtual Network Gateway.\n  - routing_weight - (Optional) The routing weight.\n  - shared_key - (Optional) The shared key.\n  - tags - (Optional) A mapping of tags to assign to the resource.\n  - use_policy_based_traffic_selectors - (Optional) Whether or not to use policy based traffic selectors.\n  - custom_bgp_addresses - (Optional) a custom_bgp_addresses block as defined below. Used to configure the custom BGP addresses for the Virtual Network Gateway Connection.\n    - primary - (Required) The primary custom BGP address.\n    - secondary - (Required) The secondary custom BGP address.\n  - ipsec_policy - (Optional) a ipsec_policy block as defined below. Used to configure the IPsec policy for the Virtual Network Gateway Connection.\n    - dh_group - (Required) The DH Group used in IKE Phase 1 for initial SA.\n    - ike_encryption - (Required) The IKE encryption algorithm (IKE phase 2).\n    - ike_integrity - (Required) The IKE integrity algorithm (IKE phase 2).\n    - ipsec_encryption - (Required) The IPSec encryption algorithm (IKE phase 1).\n    - ipsec_integrity - (Required) The IPSec integrity algorithm (IKE phase 1).\n    - pfs_group - (Required) The Pfs Group used in IKE Phase 2 for new child SA.\n    - sa_datasize - (Optional) The IPSec Security Association (also called Quick Mode or Phase 2 SA) data size specified in KB for a policy.\n    - sa_lifetime - (Optional) The IPSec Security Association (also called Quick Mode or Phase 2 SA) lifetime specified in seconds for a policy.\n  - traffic_selector_policy - (Optional) a traffic_selector_policy block as defined below. Used to configure the traffic selector policy for the Virtual Network Gateway Connection.\n    - local_address_prefixes - (Required) The list of local address prefixes.\n    - remote_address_prefixes - (Required) The list of remote address prefixes.\n"
  type = map(object({
    id              = optional(string, null)
    name            = optional(string, null)
    address_space   = optional(list(string), null)
    gateway_fqdn    = optional(string, null)
    gateway_address = optional(string, null)
    tags            = optional(map(string), {})
    bgp_settings = optional(object({
      asn                 = number
      bgp_peering_address = string
      peer_weight         = optional(number, null)
    }), null)
    connection = optional(object({
      name                               = optional(string, null)
      type                               = string
      connection_mode                    = optional(string, null)
      connection_protocol                = optional(string, null)
      dpd_timeout_seconds                = optional(number, null)
      egress_nat_rule_ids                = optional(list(string), null)
      enable_bgp                         = optional(bool, null)
      ingress_nat_rule_ids               = optional(list(string), null)
      local_azure_ip_address_enabled     = optional(bool, null)
      peer_virtual_network_gateway_id    = optional(string, null)
      routing_weight                     = optional(number, null)
      shared_key                         = optional(string, null)
      tags                               = optional(map(string), null)
      use_policy_based_traffic_selectors = optional(bool, null)
      custom_bgp_addresses = optional(object({
        primary   = string
        secondary = string
      }), null)
      ipsec_policy = optional(object({
        dh_group         = string
        ike_encryption   = string
        ike_integrity    = string
        ipsec_encryption = string
        ipsec_integrity  = string
        pfs_group        = string
        sa_datasize      = optional(number, null)
        sa_lifetime      = optional(number, null)
      }), null)
      traffic_selector_policy = optional(list(
        object({
          local_address_prefixes  = list(string)
          remote_address_prefixes = list(string)
        })
      ), null)
    }), null)
  }))
  default = {}
}

variable "location" {
  description = "The Azure region where the resources will be deployed."
  type        = string
  default     = ""
}

variable "name" {
  description = "The name of the Virtual Network Gateway."
  type        = string
  default     = ""
}

variable "route_table_bgp_route_propagation_enabled" {
  description = "Whether or not to enable BGP route propagation on the Route Table."
  type        = bool
  default     = true
}

variable "route_table_creation_enabled" {
  description = "Whether or not to create a Route Table associated with the Virtual Network Gateway Subnet."
  type        = bool
  default     = false
}

variable "route_table_name" {
  description = "Name of the Route Table associated with Virtual Network Gateway Subnet."
  type        = string
  default     = null
}

variable "route_table_tags" {
  description = "Tags for the Route Table."
  type        = map(string)
  default     = {}
}

variable "sku" {
  description = "The SKU (size) of the Virtual Network Gateway."
  type        = string
  default     = "ErGw1AZ"
}

variable "subnet_address_prefix" {
  description = "The address prefix for the gateway subnet. Required if subnet_creation_enabled = true."
  type        = string
  default     = ""
}

variable "subnet_creation_enabled" {
  description = "Whether or not to create a subnet for the Virtual Network Gateway."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to apply to the Virtual Network Gateway."
  type        = map(string)
  default     = null
}

variable "type" {
  description = "The type of the Virtual Network Gateway, ExpressRoute or Vpn."
  type        = string
  default     = "ExpressRoute"
}

variable "virtual_network_id" {
  description = "The resource id of the Virtual Network to which the Virtual Network Gateway will be attached."
  type        = string
  default     = ""
}

variable "vpn_active_active_enabled" {
  description = "Enable active-active mode for the Virtual Network Gateway."
  type        = bool
  default     = false
}

variable "vpn_bgp_enabled" {
  description = "Enable BGP for the Virtual Network Gateway."
  type        = bool
  default     = false
}

variable "vpn_bgp_settings" {
  description = "BGP settings for the Virtual Network Gateway."
  type = object({
    asn         = optional(number, null)
    peer_weight = optional(number, null)
  })
  default = null
}

variable "vpn_generation" {
  description = "value for the Generation for the Gateway, Valid values are 'Generation1', 'Generation2'. Options differ depending on SKU."
  type        = string
  default     = null
}

variable "vpn_point_to_site" {
  description = "Point to site configuration for the virtual network gateway.\n\n- address_space - (Required) Address space for the virtual network gateway.\n- aad_tenant - (Optional) The AAD tenant to use for authentication.\n- aad_audience - (Optional) The AAD audience to use for authentication.\n- aad_issuer - (Optional) The AAD issuer to use for authentication.\n- radius_server_address - (Optional) The address of the radius server.\n- radius_server_secret - (Optional) The secret of the radius server.\n- root_certificate - (Optional) The root certificate of the virtual network gateway.\n  - name - (Required) The name of the root certificate.\n  - public_cert_data - (Required) The public certificate data.\n- revoked_certificate - (Optional) The revoked certificate of the virtual network gateway.\n  - name - (Required) The name of the revoked certificate.\n  - thumbprint - (Required) The thumbprint of the revoked certificate.\n- vpn_client_protocols - (Optional) The VPN client protocols.\n- vpn_auth_types - (Optional) The VPN authentication types.\n"
  type = object({
    address_space         = list(string)
    aad_tenant            = optional(string, null)
    aad_audience          = optional(string, null)
    aad_issuer            = optional(string, null)
    radius_server_address = optional(string, null)
    radius_server_secret  = optional(string, null)
    root_certificate = optional(map(object({
      name             = string
      public_cert_data = string
    })), {})
    revoked_certificate = optional(map(object({
      name       = string
      thumbprint = string
    })), {})
    vpn_client_protocols = optional(list(string), null)
    vpn_auth_types       = optional(list(string), null)
  })
  default = null
}

variable "vpn_private_ip_address_enabled" {
  description = "Enable private IP address for the Virtual Network Gateway for Virtual Network Gateway Connections. Only supported for AZ SKUs."
  type        = bool
  default     = null
}

variable "vpn_type" {
  description = "The VPN type of the Virtual Network Gateway."
  type        = string
  default     = "RouteBased"
}
