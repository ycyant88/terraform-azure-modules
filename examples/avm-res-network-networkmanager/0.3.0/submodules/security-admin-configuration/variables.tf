variable "apply_on_network_intent_policy_based_services" {
  description = "  (Required) A list of network intent policy-based services that the security admin configuration applies to. Possible values are All, AllowRulesOnly and None.\n"
  type        = list(string)
  default     = ""
}

variable "description" {
  description = "  (Optional) The description of the Security Admin Configuration. The description must be between 0 and 500 characters, and can contain letters, numbers, underscores, periods, and hyphens. The description must start with a letter or a number, and end with a letter, a number, or an underscore.\n"
  type        = string
  default     = ""
}

variable "name" {
  description = "  (Required) The name of the Security Admin Configuration. The name must be between 1 and 64 characters, and can contain letters, numbers, underscores, periods, and hyphens. The name must start with a letter or a number, and end with a letter, a number, or an underscore.\n"
  type        = string
  default     = ""
}

variable "network_group_address_space_aggregation_option" {
  description = "  (Optional) The network group address space aggregation option for the security admin configuration. Possible values are None, and Manual.\n"
  type        = string
  default     = "None"
}

variable "network_manager_id" {
  description = "  (Required) The ID of the Network Manager to which this Security Admin Configuration belongs.\n"
  type        = string
  default     = ""
}

variable "rule_collections" {
  description = "  (Optional) A map of rule collections to create on the security admin configuration. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n    - name - (Required) The name of the rule collection.\n    - description - (Optional) The description of the rule collection.\n    - applies_to_groups - (Required) A list of network groups that the rule collection applies to.\n      - network_group_id - (Required) The resource ID of the network group that the rule collection applies to.\n    - rules - (Required) A map of rules to create on the rule collection. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n      - name - (Required) The name of the rule.\n      - access - (Required) The access type of the rule. Possible values are Allow, AlwaysAllow and Deny.\n      - description - (Optional) The description of the rule.\n      - destination_port_ranges - (Optional) A list of destination port ranges for the rule. This is only applicable for security rules. Each item in the list must be either a single port number or a port range in the format \"start-end\".\n      - destinations - (Optional) A list of destinations for the rule. This is only applicable for security rules.\n        - address_prefix_type - (Required) The type of address prefix. Possible values are IPPrefix, ServiceTag.\n        - address_prefix - (Required) The address prefix. If the address prefix type is IPPrefix, then this must be a valid CIDR notation. If the address prefix type is ServiceTag, then this must be a valid service tag.\n      - direction - (Required) The direction of the rule. Possible values are Inbound and Outbound.\n      - priority - (Required) The priority of the rule. Must be an integer between 1 and 4096, inclusive. Rules with a lower priority number are processed before rules with a higher priority number.\n      - protocol - (Required) The protocol of the rule. Possible values are Ah, Any, Esp, Icmp, Tcp, and Udp.\n      - source_port_ranges - (Optional) A list of source port ranges for the rule. This is only applicable for security rules. Each item in the list must be either a single port number or a port range in the format \"start-end\".\n      - sources - (Optional) A list of sources for the rule. This is only applicable for security rules.\n        - address_prefix_type - (Required) The type of address prefix. Possible values are IPPrefix, ServiceTag.\n        - address_prefix - (Required) The address prefix. If the address prefix type is IPPrefix, then this must be a valid CIDR notation. If the address prefix type is ServiceTag, then this must be a valid service tag.\n"
  type = map(object({
    name        = string
    description = optional(string, null)
    applies_to_groups = list(object({
      network_group_id = string
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
  }))
  default = {}
}
