variable "allow_classic_operations" {
  description = "(Optional) Allow the circuit to interact with classic (RDFE) resources. Defaults to false.\n"
  type        = bool
  default     = false
}

variable "authorization_key" {
  description = "(Optional) The authorization key. This can be used to set up an ExpressRoute Circuit with an ExpressRoute Port from another subscription.\n"
  type        = string
  default     = null
}

variable "bandwidth_in_gbps" {
  description = "(Optional) The bandwidth in Gbps of the circuit being created on the Express Route Port, should be set when the circuit is created with ER Direct.\n"
  type        = number
  default     = null
}

variable "bandwidth_in_mbps" {
  description = "(Optional) The bandwidth in Mbps of the circuit being created on the Service Provider, should be set when the circuit is created with a provider.\n"
  type        = number
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

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "er_gw_connections" {
  description = "(Optional) A map of association objects to create connections between the created circuit and the designated gateways. \n\n- name - (Required) The name of the connection.\n- express_route_circuit_peering_resource_id - (Optional) The id of the peering to associate to. Note: Either express_route_circuit_peering_resource_id or peering_map_key must be set.\n- peering_map_key - (Optional) The key of the peering variable to associate to. Note: Either peering_map_key or express_route_circuit_peering_resource_id or must be set.\n- express_route_gateway_resource_id - (Required) Resource ID of the Express Route Gateway.\n- authorization_key - (Optional) The authorization key to establish the Express Route Connection.\n- enable_internet_security - (Optional) Set Internet security for this Express Route Connection.\n- express_route_gateway_bypass_enabled - (Optional) Specified whether Fast Path is enabled for Virtual Wan Firewall Hub. Defaults to false.\n- routing_weight - (Optional) The routing weight associated to the Express Route Connection. Possible value is between 0 and 32000. Defaults to 0.\n- routing - (Optional) A routing block.\n  - associated_route_table_resource_id - (Optional) The ID of the Virtual Hub Route Table associated with this Express Route Connection.\n  - inbound_route_map_resource_id - (Optional) The ID of the Route Map associated with this Express Route Connection for inbound routes.\n  - outbound_route_map_resource_id - (Optional) The ID of the Route Map associated with this Express Route Connection for outbound routes.\n  - propagated_route_table - (Optional) A propagated_route_table block.\n    - labels - (Optional) The list of labels to logically group route tables.\n    - route_table_resource_ids - (Optional) A list of IDs of the Virtual Hub Route Table to propagate routes from Express Route Connection to the route table.\n\nExample Input:\n\nterraform\ner_gw_connections = {\n  connection1er = {\n    name                                      = \"ExRConnection-westus2-er\"\n    express_route_gateway_resource_id         = local.same_rg_er_gw_resource_id\n    express_route_circuit_peering_resource_id = local.same_rg_er_peering_resource_id\n    peering_map_key                           = \"firstPeeringConfig\"\n    routeting_weight                          = 0\n    routing = {\n      inbound_route_map_resource_id         = azurerm_route_map.in.id\n      outbound_route_map_resource_id        = azurerm_route_map.out.id\n      propagated_route_table = {\n        route_table_resource_ids = [\n          azurerm_virtual_hub_route_table.example.id,\n          azurerm_virtual_hub_route_table.additional.id\n        ]\n      }\n    }\n  }\n}\n\n"
  type = map(object({
    name                                      = optional(string, "")
    express_route_circuit_peering_resource_id = optional(string, null)
    peering_map_key                           = optional(string, null)
    express_route_gateway_resource_id         = string
    authorization_key                         = optional(string, null)
    enable_internet_security                  = optional(bool, false)
    express_route_gateway_bypass_enabled      = optional(bool, false)
    routing_weight                            = optional(number, 0)
    routing = optional(object({
      associated_route_table_resource_id = optional(string)
      inbound_route_map_resource_id      = optional(string)
      outbound_route_map_resource_id     = optional(string)
      propagated_route_table = object({
        labels                   = optional(list(string), null)
        route_table_resource_ids = optional(list(string), null)
      })
    }), null)
  }))
  default = {}
}

variable "express_route_circuit_authorizations" {
  description = "(Optional) A map of authorization objects to create authorizations for the ExpressRoute Circuits. \n\n- name - (Required) The name of the authorization.\n\nExample Input:\n\nterraform\nexpress_route_circuit_authorizations = {\n  authorization1 = {\n    name              = \"authorization1\"\n  },\n  authorization2 = {\n    name              = \"azurerm_express_route_gateway.some_gateway.name-authorization\" \n  }\n}\n\n"
  type = map(object({
    name = string
  }))
  default = {}
}

variable "express_route_port_resource_id" {
  description = "(Optional) The ID of the Express Route Port this Express Route Circuit is based on. Changing this forces a new resource to be created.\n"
  type        = string
  default     = null
}

variable "exr_circuit_tags" {
  description = "(Optional) A mapping of tags to assign to the ExpressRoute Circuit.\n"
  type        = map(string)
  default     = null
}

variable "location" {
  description = "(Required) The location of the ExpressRoute Circuit. Changing this forces a new resource to be created.\n"
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

variable "name" {
  description = "(Required) The name of the ExpressRoute Circuit. Changing this forces a new resource to be created.\n"
  type        = string
  default     = ""
}

variable "peering_location" {
  description = "(Optional) The name of the peering location and not the Azure resource location. Changing this forces a new resource to be created.\nDon't set this parameter if the circuit is created with an ER Direct.\n"
  type        = string
  default     = null
}

variable "peerings" {
  description = "(Optional) A map of association objects to create peerings between the created circuit and the designated gateways. \n\n- peering_type - (Required) The type of peering. Possible values are AzurePrivatePeering, AzurePublicPeering, and MicrosoftPeering.\n- vlan_id - (Required) The VLAN ID for the peering.\n- primary_peer_address_prefix - (Optional) The primary peer address prefix.\n- secondary_peer_address_prefix - (Optional) The secondary peer address prefix.\n- ipv4_enabled - (Optional) Is IPv4 enabled for this peering. Defaults to true.\n- shared_key - (Optional) The shared key for the peering.\n- peer_asn - (Optional) The peer ASN.\n- route_filter_resource_id - (Optional) The ID of the route filter to associate with the peering.\n- microsoft_peering_config - (Optional) A map of Microsoft peering configuration settings.\n  - advertised_public_prefixes - (Required) A list of public prefixes to advertise.\n  - customer_asn - (Optional) The customer ASN.\n  - routing_registry_name - (Optional) The routing registry name. Defaults to NONE.\n  - advertised_communities - (Optional) A list of advertised communities.\n- ipv6 - (Optional) A map of IPv6 peering configuration settings.\n  - primary_peer_address_prefix - (Required) The primary peer address prefix.\n  - secondary_peer_address_prefix - (Required) The secondary peer address prefix.\n  - enabled - (Optional) Is IPv6 enabled for this peering. Defaults to true.\n  - route_filter_resource_id - (Optional) The ID of the route filter to associate with the peering.\n  - microsoft_peering - (Optional) A map of Microsoft peering configuration settings.\n    - advertised_public_prefixes - (Optional) A list of public prefixes to advertise.\n    - customer_asn - (Optional) The customer ASN.\n    - routing_registry_name - (Optional) The routing registry name. Defaults to NONE.\n    - advertised_communities - (Optional) A list of advertised communities.\n\nExample Input:\n\nterraform\npeerings = {\n  PrivatePeering = {\n    peering_type                  = \"AzurePrivatePeering\"\n    peer_asn                      = 100\n    primary_peer_address_prefix   = \"10.0.0.0/30\"\n    secondary_peer_address_prefix = \"10.0.0.4/30\"\n    ipv4_enabled                  = true\n    vlan_id                       = 300\n\n    ipv6 {\n      primary_peer_address_prefix   = \"2002:db01::/126\"\n      secondary_peer_address_prefix = \"2003:db01::/126\"\n      enabled                       = true\n    }\n  },\n  MicrosoftPeering = {\n    peering_type                  = \"MicrosoftPeering\"\n    peer_asn                      = 200\n    primary_peer_address_prefix   = \"123.0.0.0/30\"\n    secondary_peer_address_prefix = \"123.0.0.4/30\"\n    ipv4_enabled                  = true\n    vlan_id                       = 400\n\n    microsoft_peering_config {\n      advertised_public_prefixes = [\"123.1.0.0/24\"]\n    }\n\n    ipv6 {\n      primary_peer_address_prefix   = \"2002:db01::/126\"\n      secondary_peer_address_prefix = \"2003:db01::/126\"\n      enabled                       = true\n\n      microsoft_peering {\n        advertised_public_prefixes = [\"2002:db01::/126\"]\n      }\n    }\n  }\n}\n\n"
  type = map(object({
    peering_type                  = string
    vlan_id                       = number
    primary_peer_address_prefix   = optional(string, null)
    secondary_peer_address_prefix = optional(string, null)
    ipv4_enabled                  = optional(bool, true)
    shared_key                    = optional(string, null)
    peer_asn                      = optional(number, null)
    route_filter_resource_id      = optional(string, null)
    microsoft_peering_config = optional(object({
      advertised_public_prefixes = list(string)
      customer_asn               = optional(number, null)
      routing_registry_name      = optional(string, "NONE")
      advertised_communities     = optional(list(string), null)
    }), null)
    ipv6 = optional(object({
      primary_peer_address_prefix   = string
      secondary_peer_address_prefix = string
      enabled                       = optional(bool, true)
      route_filter_resource_id      = optional(string, null)
      microsoft_peering = optional(object({
        advertised_public_prefixes = optional(list(string))
        customer_asn               = optional(number, null)
        routing_registry_name      = optional(string, "NONE")
        advertised_communities     = optional(list(string), null)
      }), null)
    }), null)
  }))
  default = {}
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group where the resources will be deployed. \n"
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "A map of role assignments to create on this resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n- principal_id - The ID of the principal to assign the role to.\n- description - The description of the role assignment.\n- skip_service_principal_aad_check - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n- condition - The condition which will be used to scope the role assignment.\n- condition_version - The version of the condition syntax. Valid values are '2.0'.\n\n> Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
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

variable "service_provider_name" {
  description = "(Optional) The name of the ExpressRoute Service Provider. Changing this forces a new resource to be created.\n"
  type        = string
  default     = null
}

variable "sku" {
  description = "(Required) A sku block for the ExpressRoute circuit.\n"
  type = object({
    tier   = string
    family = string
  })
  default = ""
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "vnet_gw_connections" {
  description = "(Optional) A map of association objects to create connections between the created circuit and the designated gateways. \n\n- name - (Optional) The name of the connection.\n- resource_group_name - (Required) The name of the resource group in which to create the connection Changing this forces a new resource to be created.\n- location - (Required) The location/region where the connection is located. \n- virtual_network_gateway_resource_id - (Required) The ID of the Virtual Network Gateway in which the connection will be created.\n- authorization_key - (Optional) The authorization key associated with the Express Route Circuit.\n- routing_weight - (Optional) The routing weight. Defaults to 0.\n- express_route_gateway_bypass - (Optional) If true, data packets will bypass ExpressRoute Gateway for data forwarding.\n- private_link_fast_path_enabled - (Optional) Bypass the Express Route gateway when accessing private-links. When enabled express_route_gateway_bypass must be set to true. Defaults to false.\n- tags - (Optional) A mapping of tags to assign to the resource.\n\nExample Input:\n\nterraform\nvnet_gw_connections = {\n  connection1gw = {\n    name                       = local.same_rg_conn_name\n    virtual_network_gateway_resource_id = local.same_rg_gw_resource_id\n    location                   = local.location\n    resource_group_name        = local.resource_group_name\n  }\n}\n\n"
  type = map(object({
    name                                = optional(string, "")
    resource_group_name                 = string
    location                            = string
    virtual_network_gateway_resource_id = string
    authorization_key                   = optional(string, null)
    routing_weight                      = optional(number, 0)
    express_route_gateway_bypass        = optional(bool, false)
    private_link_fast_path_enabled      = optional(bool, false)
    shared_key                          = optional(string, null)
    tags                                = optional(map(string), null)
  }))
  default = {}
}
