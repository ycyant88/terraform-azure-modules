variable "bgp_route_propagation_enabled" {
  description = "Whether BGP route propagation is enabled.\n"
  type        = bool
  default     = true
}

variable "location" {
  description = "The location of the route table.\n"
  type        = string
  default     = ""
}

variable "name" {
  description = "The name of the route table to create.\n"
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "The ID of the parent resource to which this user-assigned managed identity."
  type        = string
  default     = ""
}

variable "routes" {
  description = "A list of objects defining route tables and their associated routes to be created:\n\n- name (required): The name of the route.\n- address_prefix (required): The address prefix for the route.\n- next_hop_type (required): The next hop type, must be one of: 'Internet', 'None', 'VirtualAppliance', 'VirtualNetworkGateway', 'VnetLocal'.\n- next_hop_in_ip_address (optional): The next hop IP address for the route. Required if next hop type is 'VirtualAppliance'.\n"
  type = list(object({
    name                   = string
    address_prefix         = string
    next_hop_type          = string
    next_hop_in_ip_address = optional(string)
  }))
  default = []
}

variable "tags" {
  description = "A map of tags to assign to the route table.\n"
  type        = map(string)
  default     = {}
}
