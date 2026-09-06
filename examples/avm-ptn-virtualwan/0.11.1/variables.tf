variable "allow_branch_to_branch_traffic" {
  description = "  Boolean toggle to toggle support for VWAN branch to branch traffic. Branches are locations connected over ExpressRoute or Site-to-Site VPNs to a Virtual WAN Hub. Defaults to true.\n\n  For more information review: https://learn.microsoft.com/azure/virtual-wan/virtual-wan-global-transit-network-architecture\n"
  type        = bool
  default     = true
}

variable "create_resource_group" {
  description = "  If true will create a resource group, otherwise (false) will use an existing resource group specified in the variable resource_group_name\"\n\n"
  type        = bool
  default     = false
}

variable "disable_vpn_encryption" {
  description = "  Boolean toggle to disable VPN encryption. Defaults to false (VPN encryption enabled).\n\n"
  type        = bool
  default     = false
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see https://aka.ms/avm/telemetryinfo.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "er_circuit_connections" {
  description = "Map of objects for ExpressRoute Circuit connections to connect to the Virtual WAN ExpressRoute Gateways.\n\nThe key is deliberately arbitrary to avoid issues with known after apply values. The value is an object, of which there can be multiple in the map:\n\n- name: Name for the ExpressRoute Circuit connection.\n- express_route_gateway_key: The arbitrary key specified in the map of objects variable called expressroute_gateways for the object specifying the ExpressRoute Gateway you wish to connect this circuit to.\n- express_route_circuit_peering_id: The Resource ID of the ExpressRoute Circuit Peering to connect to.\n- authorization_key: Optional authorization key for the connection.\n- enable_internet_security: Optional boolean to enable internet security for the connection, e.g. allow 0.0.0.0/0 route to be propagated to this connection. See: https://learn.microsoft.com/azure/virtual-wan/virtual-wan-expressroute-portal#to-advertise-default-route-00000-to-endpoints\n- express_route_gateway_bypass_enabled: Optional boolean to enable bypass for the ExpressRoute Gateway, a.k.a. Fast Path.\n- routing: Optional routing configuration object for the connection, which includes:\n  - associated_route_table_id: The resource ID of the Virtual Hub Route Table you wish to associate with this connection.\n  - propagated_route_table: Optional configuration objection of propagated route table configuration, which includes:\n    - route_table_ids: Optional list of resource IDs of the Virtual Hub Route Tables you wish to propagate this connection to. ()\n    - labels: Optional list of labels you wish to propagate this connection to.\n  - inbound_route_map_id: Optional resource ID of the Virtual Hub inbound route map.\n  - outbound_route_map_id: Optional resource ID of the Virtual Hub outbound route map.\n- routing_weight: Optional routing weight for the connection. Values between 0 and 32000 are allowed.\n\n> Note: There can be multiple objects in this map, one for each ExpressRoute Circuit connection to the Virtual WAN ExpressRoute Gateway you wish to connect together.\n\n"
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
  description = "\nMap of objects for Express Route Gateways to deploy into the Virtual WAN Virtual Hubs that have been defined in the variable virtual_hubs.\n\nThe key is deliberately arbitrary to avoid issues with known after apply values. The value is an object, of which there can be multiple in the map:\n\n- name: Name for the ExpressRoute Gateway to deploy in the Virtual WAN Virtual Hub.\n- virtual_hub_key: The arbitrary key specified in the map of objects variable called virtual_hubs for the object specifying the Virtual Hub you wish to deploy this ExpressRoute Gateway into.\n- tags: Optional tags to apply to the ExpressRoute Gateway resource.\n- allow_non_virtual_wan_traffic: Optional boolean to configures this gateway to accept traffic from non Virtual WAN networks. Defaults to false.\n- scale_units: Optional number of scale units for the ExpressRoute Gateway. Defaults to 1. See: https://learn.microsoft.com/azure/virtual-wan/virtual-wan-expressroute-about#expressroute-gateway-performance for more information on scale units.\n\n> Note: There can be multiple objects in this map, one for each ExpressRoute Gateway you wish to deploy into the Virtual WAN Virtual Hubs that have been defined in the variable virtual_hubs.\n\n"
  type = map(object({
    name                          = string
    virtual_hub_key               = string
    tags                          = optional(map(string))
    allow_non_virtual_wan_traffic = optional(bool, false)
    scale_units                   = optional(number, 1)
  }))
  default = {}
}

variable "firewalls" {
  description = "\nMap of objects for Azure Firewall resources to deploy into the Virtual WAN Virtual Hubs that have been defined in the variable virtual_hubs.\n\nThe key is deliberately arbitrary to avoid issues with known after apply values. The value is an object, of which there can be multiple in the map:\n\n- virtual_hub_key: The arbitrary key specified in the map of objects variable called virtual_hubs for the object specifying the Virtual Hub you wish to deploy this Azure Firewall into.\n- sku_name: The SKU name for the Azure Firewall. Possible values are: AZFW_VNet, AZFW_Hub. Defaults to AZFW_Hub.\n- sku_tier: The SKU tier for the Azure Firewall. Possible values are: Basic, Standard, Premium.\n- name: The name for the Azure Firewall resource.\n- zones: Optional list of zones to deploy the Azure Firewall into. Defaults to [1, 2, 3].\n- firewall_policy_id: Optional Azure Firewall Policy Resource ID to associate with the Azure Firewall.\n- vhub_public_ip_count: Optional number of public IP addresses to associate with the Azure Firewall.\n- tags: Optional tags to apply to the Azure Firewall resource.\n\n> Note: There can be multiple objects in this map, one for each Azure Firewall you wish to deploy into the Virtual WAN Virtual Hubs that have been defined in the variable virtual_hubs.\n\n"
  type = map(object({
    virtual_hub_key      = string
    sku_name             = optional(string, "AZFW_Hub")
    sku_tier             = string
    name                 = string
    zones                = optional(list(number), [1, 2, 3])
    firewall_policy_id   = optional(string)
    vhub_public_ip_count = optional(string)
    tags                 = optional(map(string))
  }))
  default = {}
}

variable "location" {
  description = "  The Virtual WAN location.\n\n  > Note: This is not the location for the Virtual WAN Hubs, these are defined within the virtual_hubs variable in their own location property of each object.\n"
  type        = string
  default     = ""
}

variable "office365_local_breakout_category" {
  description = "  Specifies the Office 365 local breakout category. Possible values are:\n\n  - Optimize\n  - OptimizeAndAllow\n  - All\n  - None\n\n  Defaults to None.\n\n"
  type        = string
  default     = "None"
}

variable "p2s_gateway_vpn_server_configurations" {
  description = "  Map of objects for Point-to-Site VPN Gateway VPN Server Configurations to deploy into the Virtual WAN Virtual Hubs that have been defined in the variable virtual_hubs.\n\n  > You must use this variable in conjunction with the p2s_gateways variable to deploy Point-to-Site VPN Gateways and specify the key of the VPN Server Configuration you wish to use for each Point-to-Site VPN Gateway in the p2s_gateways variable, in the p2s_gateway_vpn_server_configuration_key property of each object.\n\n  The key is deliberately arbitrary to avoid issues with known after apply values. The value is an object, of which there can be multiple in the map:\n\n  - name: Name for the Point-to-Site VPN Gateway VPN Server Configuration.\n  - virtual_hub_key: The arbitrary key specified in the map of objects variable called virtual_hubs for the object specifying the Virtual Hub you wish to deploy this VPN Server Configuration into.\n  - vpn_authentication_types: List of VPN authentication types to support. Possible values are: AAD, Certificate, Radius.\n  - tags: Optional tags to apply to the VPN Server Configuration resource.\n  - client_root_certificate: Optional object for the client root certificate configuration, which includes:\n    - name: Name for the client root certificate.\n    - public_cert_data: Public certificate data for the client root certificate.\n  - azure_active_directory_authentication: Optional object for the Azure Active Directory (Entra ID) authentication configuration, which includes:\n    - audience: Audience for the Azure Active Directory (Entra ID) authentication.\n    - issuer: Issuer for the Azure Active Directory (Entra ID) authentication.\n    - tenant: Tenant for the Azure Active Directory (Entra ID)authentication.\n\n  > Note: There can be multiple objects in this map, one for each Point-to-Site VPN Gateway VPN Server Configuration you wish to deploy into the Virtual WAN Virtual Hubs that have been defined in the variable virtual_hubs.\n\n"
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
  }))
  default = {}
}

variable "p2s_gateways" {
  description = "  Map of objects for Point-to-Site VPN Gateways to deploy into the Virtual WAN Virtual Hubs that have been defined in the variable virtual_hubs.\n\n  > You must use this variable in conjunction with the p2s_gateway_vpn_server_configurations variable to deploy Point-to-Site VPN Gateway VPN Server Configurations and specify the key of the VPN Server Configuration you wish to use for each Point-to-Site VPN Gateway in the p2s_gateway_vpn_server_configuration_key property of each object.\n\n  The key is deliberately arbitrary to avoid issues with known after apply values. The value is an object, of which there can be multiple in the map:\n\n  - name: Name for the Point-to-Site VPN Gateway.\n  - virtual_hub_key: The arbitrary key specified in the map of objects variable called virtual_hubs for the object specifying the Virtual Hub you wish to deploy this Point-to-Site VPN Gateway into.\n  - tags: Optional tags to apply to the Point-to-Site VPN Gateway resource.\n  - p2s_gateway_vpn_server_configuration_key: The key of the VPN Server Configuration you wish to use for this Point-to-Site VPN Gateway from the p2s_gateway_vpn_server_configurations variable.\n  - connection_configuration: Object for the connection configuration, which includes:\n    - name: Name for the connection configuration.\n    - vpn_client_address_pool: Object for the VPN client address pool configuration, which includes:\n      - address_prefixes: List of address prefixes for the VPN client address pool.\n  - scale_unit: Number of scale units for the Point-to-Site VPN Gateway. See: https://learn.microsoft.com/azure/virtual-wan/gateway-settings#p2s for more information on scale units.\n\n  > Note: There can be multiple objects in this map, one for each Point-to-Site VPN Gateway you wish to deploy into the Virtual WAN Virtual Hubs that have been defined in the variable virtual_hubs.\n\n"
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
    scale_unit = number
  }))
  default = {}
}

variable "resource_group_name" {
  description = "  Name of the Resource Group where the Virtual WAN and it's child resources, e.g. Virtual WAN Hubs, Gateways etc., will be created.\n\n  The Resource Group will be created if the variable create_resource_group is set to true. If it is set to false the resource group must already exist.\n\n  > Note: Each Virtual WAN Hub can be configured to deploy into different resource groups, that must already exist or be created outside of this module, by specifying the resource_group property in each object in the virtual_hubs variable map input. If you do not do this, the same resource group will be used for all Virtual WAN resources as specified in this variable.\n"
  type        = string
  default     = ""
}

variable "resource_group_tags" {
  description = "  (Optional) Resource group tags to assign, if created by module controlled by variable create_resource_group.\n\n"
  type        = map(string)
  default     = {}
}

variable "routing_intents" {
  description = "  Map of objects for routing intents to deploy into the Virtual WAN Virtual Hubs that have been defined in the variable virtual_hubs.\n\n  The key is deliberately arbitrary to avoid issues with known after apply values. The value is an object, of which there can be multiple in the map:\n\n  - name: Name for the routing intent resource.\n  - virtual_hub_key: The arbitrary key specified in the map of objects variable called virtual_hubs for the object specifying the Virtual Hub you wish to deploy this routing intent into.\n  - routing_policies: List of routing policies for the routing intent, which includes:\n    - name: Name for the routing policy.\n    - destinations: List of destinations for the routing policy. Allowed values are: Internet, PrivateTraffic.\n    - next_hop_firewall_key: The arbitrary key specified in the map of objects variable called firewalls for the object specifying the Azure Firewall you wish to use as the next hop for the routing policy. This is used to get the correct resource ID for the corresponding Azure Firewall.\n\n"
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
  description = "  (Optional) Tags to apply to the Resource Group, if created by module controlled by variable create_resource_group, and the Virtual WAN resource only.\n\n"
  type        = map(string)
  default     = null
}

variable "type" {
  description = "  Type of the Virtual WAN to create. Possible values include:\n\n  - Basic\n  - Standard\n\n  Defaults to Standard and is recommended.\n\n"
  type        = string
  default     = "Standard"
}

variable "virtual_hubs" {
  description = "  Map of objects for Virtual Hubs to deploy into the Virtual WAN.\n\n  The key is deliberately arbitrary to avoid issues with known after apply values. The value is an object, of which there can be multiple in the map:\n\n  - name: Name for the Virtual Hub resource.\n  - location: Location for the Virtual Hub resource.\n  - resource_group: Optional resource group name to deploy the Virtual Hub into. If not specified, the Virtual Hub will be deployed into the resource group specified in the variable resource_group_name, e.g. the same as the Virtual WAN itself.\n  - address_prefix: Address prefix for the Virtual Hub. Recommend using a /23 CIDR block.\n  - tags: Optional tags to apply to the Virtual Hub resource.\n  - hub_routing_preference: Optional hub routing preference for the Virtual Hub. Possible values are: ExpressRoute, ASPath, VpnGateway. Defaults to ExpressRoute. See https://learn.microsoft.com/azure/virtual-wan/hub-settings#routing-preference for more information.\n  - virtual_router_auto_scale_min_capacity: Optional minimum capacity for the Virtual Router auto scale. Defaults to 2. See https://learn.microsoft.com/azure/virtual-wan/hub-settings#capacity for more information.\n\n  > Note: There can be multiple objects in this map, one for each Virtual Hub you wish to deploy into the Virtual WAN. Multiple Virtual Hubs in the same region/location can be deployed into the same Virtual WAN also.\n\n"
  type = map(object({
    name                                   = string
    location                               = string
    resource_group                         = optional(string, null)
    address_prefix                         = string
    tags                                   = optional(map(string))
    hub_routing_preference                 = optional(string, "ExpressRoute")
    virtual_router_auto_scale_min_capacity = optional(number, 2)
  }))
  default = {}
}

variable "virtual_network_connections" {
  description = "  Map of objects for Virtual Network connections to connect Virtual Networks to the Virtual WAN Virtual Hubs that have been defined in the variable virtual_hubs.\n\n  The key is deliberately arbitrary to avoid issues with known after apply values. The value is an object, of which there can be multiple in the map:\n\n  - name: Name for the Virtual Network connection.\n  - virtual_hub_key: The arbitrary key specified in the map of objects variable called virtual_hubs for the object specifying the Virtual Hub you wish to connect this Virtual Network to.\n  - remote_virtual_network_id: The Resource ID of the Virtual Network you wish to connect to the Virtual Hub.\n  - internet_security_enabled: Optional boolean to enable internet security for the connection, e.g. allow 0.0.0.0/0 route to be propagated to this connection.\n  - routing: Optional routing configuration object for the connection, which includes:\n    - associated_route_table_id: The resource ID of the Virtual Hub Route Table you wish to associate with this connection.\n    - propagated_route_table: Optional configuration objection of propagated route table configuration, which includes:\n      - route_table_ids: Optional list of resource IDs of the Virtual Hub Route Tables you wish to propagate this connections routes to.\n      - labels: Optional list of labels you wish to propagate this connections routes to.\n    - static_vnet_route: Optional configuration object for static VNet route configuration, which includes:\n      - name: Optional name for the static VNet route.\n      - address_prefixes: Optional list of address prefixes for the static VNet route.\n      - next_hop_ip_address: Optional next hop IP address for the static VNet route.\n\n  > Note: There can be multiple objects in this map, one for each Virtual Network connection you wish to connect to the Virtual WAN Virtual Hubs that have been defined in the variable virtual_hubs.\n\n"
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
  description = "Name of the Virtual WAN resource itself."
  type        = string
  default     = ""
}

variable "virtual_wan_tags" {
  description = "  (Optional) Tags to apply to the Virtual WAN resource only.\n\n"
  type        = map(string)
  default     = {}
}

variable "vpn_gateways" {
  description = "  Map of objects for S2S VPN Gateways to deploy into the Virtual WAN Virtual Hubs that have been defined in the variable virtual_hubs.\n\n  The key is deliberately arbitrary to avoid issues with known after apply values. The value is an object, of which there can be multiple in the map:\n\n  - name: Name for the S2S VPN Gateway resource.\n  - virtual_hub_key: The arbitrary key specified in the map of objects variable called virtual_hubs for the object specifying the Virtual Hub you wish to deploy this S2S VPN Gateway into.\n  - tags: Optional tags to apply to the S2S VPN Gateway resource.\n  - bgp_route_translation_for_nat_enabled: Optional boolean to enable BGP route translation for NAT.\n  - bgp_settings: Optional BGP settings object for the S2S VPN Gateway, which includes:\n    - instance_0_bgp_peering_address: Optional object for the instance 0 BGP peering address, which includes:\n      - custom_ips: List of custom IPs for the instance 0 BGP peering address.\n    - instance_1_bgp_peering_address: Optional object for the instance 1 BGP peering address, which includes:\n      - custom_ips: List of custom IPs for the instance 1 BGP peering address.\n    - peer_weight: BGP peer weight for the S2S VPN Gateway.\n    - asn: BGP ASN for the BGP Speaker.\n  - routing_preference: Optional Azure routing preference lets you to choose how your traffic routes between Azure and the internet. You can choose to route traffic either via the Microsoft network (default value, Microsoft Network), or via the ISP network (public internet, set to Internet). More context of the configuration can be found in the Microsoft Docs to create a VPN Gateway. Defaults to Microsoft Network if not set. Changing this forces a new resource to be created.\n  - scale_unit: Optional number of scale units for the S2S VPN Gateway. See https://learn.microsoft.com/azure/virtual-wan/gateway-settings#s2s for more information on scale units.\n\n  > Note: There can be multiple objects in this map, one for each S2S VPN Gateway you wish to deploy into the Virtual WAN Virtual Hubs that have been defined in the variable virtual_hubs.\n\n"
  type = map(object({
    name                                  = string
    virtual_hub_key                       = string
    tags                                  = optional(map(string))
    bgp_route_translation_for_nat_enabled = optional(bool)
    bgp_settings = optional(object({
      instance_0_bgp_peering_address = optional(object({
        custom_ips = list(string)
      }))
      instance_1_bgp_peering_address = optional(object({
        custom_ips = list(string)
      }))
      peer_weight = number
      asn         = number
    }))
    routing_preference = optional(string)
    scale_unit         = optional(number)
  }))
  default = {}
}

variable "vpn_site_connections" {
  description = "  Map of objects for VPN Site connections to connect VPN Sites to the Virtual WAN VPN Gateways that have been defined in the variable vpn_gateways.\n\n  The key is deliberately arbitrary to avoid issues with known after apply values. The value is an object, of which there can be multiple in the map:\n\n  - name: Name for the VPN Site connection.\n  - vpn_gateway_key: The arbitrary key specified in the map of objects variable called vpn_gateways for the object specifying the VPN Gateway you wish to connect this VPN Site to.\n  - remote_vpn_site_key: The arbitrary key specified in the map of objects variable called vpn_sites for the object specifying the VPN Site you wish to connect this VPN Site connection to.\n  - vpn_links: List of VPN links for the VPN Site connection, which includes:\n    - name: Name for the VPN link.\n    - egress_nat_rule_ids: Optional list of egress NAT rule IDs.\n    - ingress_nat_rule_ids: Optional list of ingress NAT rule IDs.\n    - vpn_site_link_number: Index of the link on the VPN Gateway.\n    - bandwidth_mbps: Optional bandwidth in Mbps for the VPN link.\n    - bgp_enabled: Optional boolean to enable BGP for the VPN link.\n    - connection_mode: Optional connection mode for the VPN link. Allowed values are: Default, InitiatorOnly, ResponderOnly. Defaults to Default.\n    - ipsec_policy: Optional IPsec policy object for the VPN link, which includes:\n      - dh_group: DH group for the IPsec policy. Allowed values are: DHGroup1, DHGroup2, DHGroup14, DHGroup24, DHGroup2048, ECP256, ECP384.\n      - ike_encryption_algorithm: IKE encryption algorithm for the IPsec policy. Allowed values are: AES128, AES192, AES256, DES, DES3, GCMAES128, GCMAES256.\n      - ike_integrity_algorithm: IKE integrity algorithm for the IPsec policy. Allowed values are: MD5, SHA1, SHA256, SHA384, SHA512, GCMAES128, GCMAES256.\n      - encryption_algorithm: Encryption algorithm for the IPsec policy. Allowed values are: AES128, AES192, AES256, DES, DES3, GCMAES128, GCMAES192, GCMAES256, None.\n      - integrity_algorithm: Integrity algorithm for the IPsec policy. Allowed values are: MD5, SHA1, SHA256, GCMAES128, GCMAES192, GCMAES256.\n      - pfs_group: PFS group for the IPsec policy. Allowed values are: None, PFS1, PFS2, PFS14, PFS24, PFS2048, PFSMM, ECP256, ECP384.\n      - sa_data_size_kb: SA data size in KB for the IPsec policy.\n      - sa_lifetime_sec: SA lifetime in seconds for the IPsec policy.\n    - protocol: Optional protocol for the VPN link. Allowed values are: IKEv2, IKEv1. Defaults to IKEv2.\n    - ratelimit_enabled: Optional boolean to enable rate limiting for the VPN link. Defaults to false.\n    - route_weight: Optional route weight for the VPN link.\n    - shared_key: Optional shared key for the VPN link.\n    - local_azure_ip_address_enabled: Optional boolean to enable local Azure IP address for the VPN link.\n    - policy_based_traffic_selector_enabled: Optional boolean to enable policy based traffic selector for the VPN link.\n    - custom_bgp_addresses: Optional list of custom BGP addresses for the VPN link, which includes:\n      - ip_address: IP address for the custom BGP address.\n      - instance: Instance number for the custom BGP address. Must be 0 or 1.\n  - internet_security_enabled: Optional boolean to enable internet security for the connection, e.g. allow 0.0.0.0/0 route to be propagated to this connection to a branch/VPN site.\n  - routing: Optional routing configuration object for the connection, which includes:\n    - associated_route_table: The resource ID of the Virtual Hub Route Table you wish to associate with this connection.\n    - propagated_route_table: Optional configuration objection of propagated route table configuration, which includes:\n      - route_table_ids: Optional list of resource IDs of the Virtual Hub Route Tables you wish to propagate this connections routes to.\n      - labels: Optional list of labels you wish to propagate this connections routes to.\n    - inbound_route_map_id: Optional resource ID of the Virtual Hub inbound route map.\n    - outbound_route_map_id: Optional resource ID of the Virtual Hub outbound route map.\n  - traffic_selector_policy: Optional traffic selector policy object for the connection, which includes:\n    - local_address_ranges: Local address ranges (CIDR) for the traffic selector policy.\n    - remote_address_ranges: Remote address ranges (CIDR) for the traffic selector policy.\n\n  > Note: There can be multiple objects in this map, one for each VPN Site connection you wish to connect to the Virtual WAN VPN Gateways that have been defined in the variable vpn_gateways.\n\n"
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
      vpn_site_key         = string
      bandwidth_mbps       = optional(number)
      bgp_enabled          = optional(bool)
      connection_mode      = optional(string, "Default")

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
      protocol                              = optional(string, "IKEv2")
      ratelimit_enabled                     = optional(bool, false)
      route_weight                          = optional(number)
      shared_key                            = optional(string)
      local_azure_ip_address_enabled        = optional(bool)
      policy_based_traffic_selector_enabled = optional(bool)
      custom_bgp_addresses = optional(list(object({
        ip_address = string
        instance   = number
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
  description = "  Map of objects for VPN Sites to deploy into the Virtual WAN Virtual Hubs that have been defined in the variable virtual_hubs.\n\n  The key is deliberately arbitrary to avoid issues with known after apply values. The value is an object, of which there can be multiple in the map:\n\n  - name: Name for the VPN Site resource.\n  - virtual_hub_key: The arbitrary key specified in the map of objects variable called virtual_hubs for the object specifying the Virtual Hub you wish to deploy this VPN Site into.\n  - links: List of links for the VPN Site, which includes:\n    - name: Name for the link.\n    - bgp: Optional BGP object for the link, which includes:\n      - asn: ASN for the BGP.\n      - peering_address: Peering address for the BGP.\n    - fqdn: Optional FQDN for the link.\n    - ip_address: Optional IP address for the link.\n    - provider_name: Optional provider name for the link.\n    - speed_in_mbps: Optional speed in Mbps for the link.\n  - address_cidrs: Optional list of address CIDRs for the VPN Site. Must be set if links.bgp is not set.\n  - device_model: Optional device model for the VPN Site.\n  - device_vendor: Optional device vendor for the VPN Site.\n  - o365_policy: Optional O365 policy object for the VPN Site, which includes:\n    - traffic_category: Optional traffic category object for the O365 policy, which includes:\n      - allow_endpoint_enabled: Optional boolean. Is allow endpoint enabled? The Allow endpoint is required for connectivity to specific O365 services and features, but are not as sensitive to network performance and latency as other endpoint types.\n      - default_endpoint_enabled: Optional boolean. Is default endpoint enabled? The Default endpoint represents O365 services and dependencies that do not require any optimization, and can be treated by customer networks as normal Internet bound traffic.\n      - optimize_endpoint_enabled: Optional boolean. Is optimize endpoint enabled? The Optimize endpoint is required for connectivity to every O365 service and represents the O365 scenario that is the most sensitive to network performance, latency, and availability.\n  - tags: Optional tags to apply to the VPN Site resource.\n\n  > Note: There can be multiple objects in this map, one for each VPN Site you wish to deploy into the Virtual WAN Virtual Hubs that have been defined in the variable virtual_hubs.\n\n"
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
