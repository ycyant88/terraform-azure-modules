variable "description" {
  description = "  (Optional) The description of the Routing Configuration. The description must be between 0 and 500 characters, and can contain letters, numbers, underscores, periods, and hyphens. The description must start with a letter or a number, and end with a letter, a number, or an underscore.\n"
  type        = string
  default     = ""
}

variable "name" {
  description = "  (Required) The name of the Routing Configuration. The name must be between 1 and 64 characters, and can contain letters, numbers, underscores, periods, and hyphens. The name must start with a letter or a number, and end with a letter, a number, or an underscore.\n"
  type        = string
  default     = ""
}

variable "network_manager_id" {
  description = "  (Required) The ID of the Network Manager to which this Routing Configuration belongs.\n"
  type        = string
  default     = ""
}

variable "route_table_usage_mode" {
  description = "  (Optional) The route table usage mode for the Routing Configuration. Possible values are ManagedOnly and UseExisting. If not specified, the default value is ManagedOnly.\n"
  type        = string
  default     = "ManagedOnly"
}

variable "rule_collections" {
  description = "  (Optional) A map of rule collections to create on the routing configuration.\n  - name - (Required) The name of the rule collection.\n  - description - (Optional) The description of the rule collection.\n  - applies_to - (Required) A list of network groups that the rule collection applies to.\n    - network_group_id - (Required) The ID of the network group that the rule collection applies to.\n  - disable_bgp_route_propagation - (Optional) A boolean value indicating whether or not to disable BGP route propagation for this rule collection. Defaults to true.\n  - rules - (Required) A map of rules to create on the rule collection.\n    - name - (Required) The name of the rule.\n    - description - (Optional) The description of the rule.\n    - destination - (Required) The destination for the route.\n      - type - (Required) The type of destination. Possible values are AddressPrefix and ServiceTag.\n      - destination_address - (Required) The destination address. If the destination type is AddressPrefix, then this must be a valid CIDR notation. If the destination type is ServiceTag, then this must be a valid service tag.\n    - next_hop - (Required) The next hop for the route.\n      - next_hop_type - (Required) The type of next hop. Possible values are VirtualAppliance, Internet, VirtualNetworkGateway, VnetLocal, and NoNextHop.\n      - next_hop_address - (Conditional) The next hop address. This is only applicable if the next hop type is VirtualAppliance, in which case this must be a valid IP address.\n"
  type = map(object({
    name        = string
    description = optional(string, null)
    applies_to = list(object({
      network_group_id = string
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
  }))
  default = {}
}
