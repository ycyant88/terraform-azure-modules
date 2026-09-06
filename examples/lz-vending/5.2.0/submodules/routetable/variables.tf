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

variable "resource_group_name" {
  description = "The name of the resource group to create the virtual network in.\nThe resource group must exist, this module will not create it.\n"
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

variable "subscription_id" {
  description = "The subscription ID of the subscription to create the virtual network in.\n"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to assign to the route table.\n"
  type        = map(string)
  default     = {}
}
