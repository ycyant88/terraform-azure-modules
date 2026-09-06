variable "applies_to_groups" {
  description = "  (Required) A list of network groups that the connectivity configuration applies to.\n  - group_connectivity - (Required) The type of connectivity for the group. DirectlyConnected and None.\n  - is_global - (Optional) A boolean value indicating whether the connectivity configuration applies to all network groups in the Network Manager. If set to true, then the connectivity configuration applies to all network groups and the network_group_id property is ignored. Defaults to false.\n  - network_group_id - (Required) The resource ID of the network group that the connectivity configuration applies to. This property is required if is_global is set to false.\n  - use_hub_gateway - (Optional) A boolean value indicating whether or not to use a hub gateway for this connectivity configuration. This is only applicable if the topology is set to HubAndSpoke. Defaults to false.\n"
  type = list(object({
    group_connectivity = string
    is_global          = optional(bool, false)
    network_group_id   = string
    use_hub_gateway    = optional(bool, false)
  }))
  default = ""
}

variable "connectivity_capabilities" {
  description = "  (Optional) A set of connectivity capabilities for the connectivity configuration.\n  - connected_group_address_overlap - (Optional) The connectivity configuration's capability for connected group address overlap. Possible values are Allowed and Disallowed.\n  - connected_group_private_endpoints_scale - (Optional) The connectivity configuration's capability for connected group private endpoint scale. Possible values are HighScale and Standard.\n  - peering_enforcement - (Optional) The connectivity configuration's capability for peering enforcement. Possible values are Enforced and Unenforced.\n"
  type = object({
    connected_group_address_overlap         = string
    connected_group_private_endpoints_scale = string
    peering_enforcement                     = string
  })
  default = null
}

variable "connectivity_topology" {
  description = "  (Required) The connectivity topology of the connectivity configuration. Possible values are HubAndSpoke and Mesh.\n"
  type        = string
  default     = ""
}

variable "delete_existing_peering" {
  description = "  (Optional) A boolean value indicating whether to delete existing peering connections. Defaults to false.\n"
  type        = bool
  default     = false
}

variable "description" {
  description = "  (Optional) The description of the connectivity configuration.\n"
  type        = string
  default     = null
}

variable "hubs" {
  description = "  (Optional) A list of hubs for the connectivity configuration. This is only applicable if the topology is set to HubAndSpoke.\n  - resource_id - (Required) The resource ID of the hub.\n  - resource_type - (Required) The resource type of the hub. Possible values are Microsoft.Network/virtualNetworks.\n"
  type = list(object({
    resource_id   = string
    resource_type = string
  }))
  default = []
}

variable "is_global" {
  description = "  (Optional) A boolean value indicating whether the connectivity configuration applies to all network groups in the Network Manager. Defaults to false.\n"
  type        = bool
  default     = false
}

variable "name" {
  description = "  (Required) The name of the connectivity configuration.\n"
  type        = string
  default     = ""
}

variable "network_manager_id" {
  description = "  (Required) The ID of the Network Manager.\n"
  type        = string
  default     = ""
}
