variable "connectivity_configurations" {
  description = "  A map of connectivity configurations to create on the Network Manager. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  name - (Required) The name of the connectivity configuration.\n  description - (Optional) The description of the connectivity configuration.\n  applies_to_groups - (Required) A list of network groups that the connectivity configuration applies to.\n    - group_connectivity - (Required) The type of connectivity for the group. DirectlyConnected and None.\n    - is_global - (Optional) A boolean value indicating whether this group entry supports global VNet peering (i.e. peering across Azure regions). Defaults to false.\n    - network_group_key - (Required) The map key of the network group (from var.network_groups) that the connectivity configuration applies to.\n    - use_hub_gateway - (Optional) A boolean value indicating whether or not to use a hub gateway for this connectivity configuration. This is only applicable if the topology is set to HubAndSpoke. Defaults to false.\n  connectivity_topology - (Required) The topology of the connectivity configuration. Possible values are HubAndSpoke and Mesh.\n  connectivity_capabilities - (Optional) The connectivity capabilities of the connectivity configuration.\n    - connected_group_address_overlap - (Optional) Possible values are Allowed and Disallowed.\n    - connected_group_private_endpoints_scale - (Optional) Possible values are HighScale and Standard.\n    - peering_enforcement - (Optional) Possible values are Enforced and Unenforced.\n  hubs - (Optional) A list of hubs to associate with the connectivity configuration. This is only applicable if the topology is set to HubAndSpoke.\n    - resource_id - (Required) The resource ID of the hub.\n    - resource_type - (Required) The resource type of the hub. Possible values are Microsoft.Network/virtualNetworks.\n  delete_existing_peering - (Optional) A boolean value indicating whether or not to delete existing peerings.\n  is_global - (Optional) A boolean value indicating whether the connectivity configuration supports global VNet peering (i.e. peering across Azure regions). Defaults to false.\n"
  type = map(object({
    name        = string
    description = optional(string, null)
    applies_to_groups = list(object({
      group_connectivity = string
      is_global          = optional(bool, false)
      network_group_key  = string
      use_hub_gateway    = optional(bool, false)
    }))
    connectivity_topology = string
    connectivity_capabilities = optional(object({
      connected_group_address_overlap         = string
      connected_group_private_endpoints_scale = string
      peering_enforcement                     = string
    }), null)
    hubs = optional(list(object({
      resource_id   = string
      resource_type = string
    })), [])
    delete_existing_peering = optional(bool, false)
    is_global               = optional(bool, false)
  }))
  default = {}
}

variable "description" {
  description = "(Optional) A description of the network manager."
  type        = string
  default     = null
}

variable "diagnostic_settings" {
  description = "  A map of diagnostic settings to create on the Network Manager. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n  - name - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.\n  - log_categories - (Optional) A set of log categories to send to the log analytics workspace. Defaults to [].\n  - log_groups - (Optional) A set of log groups to send to the log analytics workspace. Defaults to [\"allLogs\"].\n  - metric_categories - (Optional) A set of metric categories to send to the log analytics workspace. Defaults to [\"AllMetrics\"].\n  - log_analytics_destination_type - (Optional) The destination type for the diagnostic setting. Possible values are Dedicated and AzureDiagnostics. Defaults to Dedicated.\n  - workspace_resource_id - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.\n  - storage_account_resource_id - (Optional) The resource ID of the storage account to send logs and metrics to.\n  - event_hub_authorization_rule_resource_id - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.\n  - event_hub_name - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.\n  - marketplace_partner_resource_id - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic Logs.\n"
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

variable "location" {
  description = "(Required) Specifies the Azure Region where the Network Managers should exist. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "lock" {
  description = "  Controls the Resource Lock configuration for this resource. The following properties can be specified:\n\n  - kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n  - name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n"
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "name" {
  description = "(Required) Specifies the name which should be used for this Network Managers. Changing this forces a new Network Managers to be created."
  type        = string
  default     = ""
}

variable "network_groups" {
  description = "  A map of network groups to create on the Network Manager. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  name - (Required) The name of the network group.\n  description - (Optional) The description of the network group.\n  member_type - (Optional) The type of the group member. Subnet member type is used for routing configurations. Possible values are Subnet and VirtualNetwork.\n  static_members - (Optional) A map of static members to add to the network group.\n    - name - (Required) The name of the static member.\n    - target_resource_id - (Required) The ID of the target resource to associate with the static member.\n"
  type = map(object({
    name        = string
    description = optional(string)
    member_type = optional(string)
    static_members = optional(list(object({
      name               = string
      target_resource_id = string
    })), [])
  }))
  default = {}
}

variable "network_manager_scope" {
  description = "  - management_group_ids - (Optional) A list of management group IDs.\n  - subscription_ids - (Optional) A list of subscription IDs.\n"
  type = object({
    management_group_ids = optional(list(string))
    subscription_ids     = optional(list(string))
  })
  default = ""
}

variable "network_manager_scope_accesses" {
  description = "(Required) Scope Access (Also known as features). A list of configuration deployment type. Possible values are Connectivity, SecurityAdmin, and Routing. The connectivity feature allows you to create network topologies at scale. The security admin feature lets you create high-priority security rules, which take precedence over NSGs. The routing feature allows you to describe your desired routing behavior and orchestrate user-defined routes (UDRs) to create and maintain the desired routing behavior. If none of the features are required, then this parameter does not need to be specified, which then only enables features like IPAM and Virtual Network Verifier."
  type        = list(string)
  default     = ""
}

variable "network_manager_timeouts" {
  description = "  - create - (Defaults to 30 minutes) Used when creating the Network Managers.\n  - delete - (Defaults to 30 minutes) Used when deleting the Network Managers.\n  - read - (Defaults to 5 minutes) Used when retrieving the Network Managers.\n  - update - (Defaults to 30 minutes) Used when updating the Network Managers.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}

variable "resource_group_name" {
  description = "(Required) Specifies the name of the Resource Group where the Network Managers should exist. Changing this forces a new Network Managers to be created."
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "  A map of role assignments to create on the Network Manager. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n  - role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n  - principal_id - The ID of the principal to assign the role to.\n  - description - (Optional) The description of the role assignment.\n  - skip_service_principal_aad_check - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n  - condition - (Optional) The condition which will be used to scope the role assignment.\n  - condition_version - (Optional) The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\n  - delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\n  - principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n\n  > Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
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

variable "routing_configurations" {
  description = "  A map of routing configurations to create on the Network Manager. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  name - (Required) The name of the routing configuration.\n  description - (Optional) The description of the routing configuration.\n  route_table_usage_mode - (Optional) The route table usage mode for the routing configuration. Possible values are ManagedOnly and UseExisting.\n  rule_collections - (Optional) A map of rule collections to create on the routing configuration.\n    - name - (Required) The name of the rule collection.\n    - description - (Optional) The description of the rule collection.\n    - applies_to - (Required) A list of network groups that the rule collection applies to.\n      - network_group_key - (Required) The map key of the network group (from var.network_groups) that the rule collection applies to.\n    - disable_bgp_route_propagation - (Optional) A boolean value indicating whether or not to disable BGP route propagation for this rule collection. Defaults to true.\n    - rules - (Required) A map of rules to create on the rule collection.\n      - name - (Required) The name of the rule.\n      - description - (Optional) The description of the rule.\n      - destination - (Required) The destination for the route.\n        - type - (Required) The type of destination. Possible values are AddressPrefix and ServiceTag.\n        - destination_address - (Required) The destination address. If the destination type is AddressPrefix, then this must be a valid CIDR notation. If the destination type is ServiceTag, then this must be a valid service tag.\n      - next_hop - (Required) The next hop for the route.\n        - next_hop_type - (Required) The type of next hop. Possible values are VirtualAppliance, Internet, VirtualNetworkGateway, VnetLocal, and NoNextHop.\n        - next_hop_address - (Conditional) The next hop address. This is only applicable if the next hop type is VirtualAppliance, in which case this must be a valid IP address.\n"
  type = map(object({
    name                   = string
    description            = optional(string, null)
    route_table_usage_mode = optional(string, "ManagedOnly")
    rule_collections = optional(map(object({
      name        = string
      description = optional(string, null)
      applies_to = list(object({
        network_group_key = string
      }))
      disable_bgp_route_propagation = optional(bool, true)
      rules = map(object({
        name        = string
        description = optional(string, null)
        destination = object({
          type                = string
          destination_address = string
        })
        next_hop = object({
          next_hop_type    = string
          next_hop_address = optional(string, null)
        })
      }))
    })), {})
  }))
  default = {}
}

variable "scope_connections" {
  description = "  (Optional) A map of scope connections to create on the Network Manager. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time. Scope Connections to create for the network manager. Allows network manager to manage resources from another tenant. Supports management groups or subscriptions from another tenant.\n  name - (Required) The name of the scope connection.\n  description - (Optional) The description of the scope connection.\n  resource_id - (Required) The resource ID of the scope to connect to. Can be a management group or subscription.\n  tenant_id - (Required) The tenant ID of the scope to connect to.\n"
  type = map(object({
    name        = string
    description = optional(string, null)
    resource_id = string
    tenant_id   = string
  }))
  default = {}
}

variable "security_admin_configurations" {
  description = "  A map of security admin configurations to create on the Network Manager. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  name - (Required) The name of the security admin configuration.\n  description - (Optional) The description of the security admin configuration.\n  apply_on_network_intent_policy_based_services - (Required) A list of network intent policy-based services that the security admin configuration applies to. Possible values are All, AllowRulesOnly and None.\n  network_group_address_space_aggregation_option - (Optional) The network group address space aggregation option for the security admin configuration. Possible values are None, and Manual.\n  rule_collections - (Optional) A map of rule collections to create on the security admin configuration.\n    - name - (Required) The name of the rule collection.\n    - description - (Optional) The description of the rule collection.\n    - applies_to_groups - (Required) A list of network groups that the rule collection applies to.\n      - network_group_key - (Required) The map key of the network group (from var.network_groups) that the rule collection applies to.\n    - rules - (Required) A map of rules to create on the rule collection.\n      - name - (Required) The name of the rule.\n      - access - (Required) The access type of the rule. Possible values are Allow, AlwaysAllow and Deny.\n      - description - (Optional) The description of the rule.\n      - destination_port_ranges - (Optional) A list of destination port ranges for the rule. This is only applicable for security rules. Each item in the list must be either a single port number or a port range in the format \"start-end\".\n      - destinations - (Optional) A list of destinations for the rule. This is only applicable for security rules.\n        - address_prefix_type - (Required) The type of address prefix. Possible values are IPPrefix, ServiceTag.\n        - address_prefix - (Required) The address prefix. If the address prefix type is IPPrefix, then this must be a valid CIDR notation. If the address prefix type is ServiceTag, then this must be a valid service tag.\n      - direction - (Required) The direction of the rule. Possible values are Inbound and Outbound.\n      - priority - (Required) The priority of the rule. Must be an integer between 1 and 4096, inclusive. Rules with a lower priority number are processed before rules with a higher priority number.\n      - protocol - (Required) The protocol of the rule. Possible values are Ah, Any, Esp, Icmp, Tcp, and Udp.\n      - source_port_ranges - (Optional) A list of source port ranges for the rule. This is only applicable for security rules. Each item in the list must be either a single port number or a port range in the format \"start-end\".\n      - sources - (Optional) A list of sources for the rule. This is only applicable for security rules.\n        - address_prefix_type - (Required) The type of address prefix. Possible values are IPPrefix, ServiceTag.\n        - address_prefix - (Required) The address prefix. If the address prefix type is IPPrefix, then this must be a valid CIDR notation. If the address prefix type is ServiceTag, then this must be a valid service tag.\n"
  type = map(object({
    name                                           = string
    description                                    = optional(string, null)
    apply_on_network_intent_policy_based_services  = list(string)
    network_group_address_space_aggregation_option = optional(string, "None")
    rule_collections = optional(map(object({
      name        = string
      description = optional(string, null)
      applies_to_groups = list(object({
        network_group_key = string
      }))
      rules = map(object({
        name                    = string
        access                  = string
        description             = optional(string, null)
        destination_port_ranges = optional(list(string), null)
        destinations = optional(list(object({
          address_prefix_type = string
          address_prefix      = string
        })), null)
        direction          = string
        priority           = number
        protocol           = string
        source_port_ranges = optional(list(string), null)
        sources = optional(list(object({
          address_prefix_type = string
          address_prefix      = string
        })), null)
      }))
    })), {})
  }))
  default = {}
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}
