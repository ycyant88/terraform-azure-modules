variable "hub_network_resource_id" {
  description = "The resource ID of the virtual network in the hub to which the created virtual network will be peered.\nThe module will fully establish the peering by creating both sides of the peering connection.\n\nYou must also set virtual_network_peering_enabled = true.\n\nE.g. /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/my-rg/providers/Microsoft.Network/virtualNetworks/my-vnet\n\nLeave blank and set virtual_network_peering_enabled = false (the default) to create the virtual network without peering.\n"
  type        = string
  default     = ""
}

variable "subscription_id" {
  description = "The subscription ID of the subscription to create the virtual network in.\n"
  type        = string
  default     = ""
}

variable "virtual_network_address_space" {
  description = "The address space of the virtual network, supplied as multiple CIDR blocks, e.g. [\"10.0.0.0/16\",\"172.16.0.0/12\"].\n"
  type        = list(string)
  default     = ""
}

variable "virtual_network_location" {
  description = "The location of the virtual network.\n"
  type        = string
  default     = ""
}

variable "virtual_network_name" {
  description = "The name of the virtual network.\n"
  type        = string
  default     = ""
}

variable "virtual_network_peering_enabled" {
  description = "Whether to enable peering with the supplied hub virtual network.\nEnables a hub & spoke networking topology.\n\nIf enabled the hub_network_resource_id must also be suppled.\n"
  type        = bool
  default     = false
}

variable "virtual_network_resource_group_name" {
  description = "The name of the resource group to create the virtual network in.\n"
  type        = string
  default     = ""
}

variable "virtual_network_use_remote_gateways" {
  description = "Enables the use of remote gateways for the virtual network.\n\nApplies to hub and spoke (vnet peerings).\n"
  type        = bool
  default     = true
}

variable "virtual_network_vwan_connection_enabled" {
  description = "The resource ID of the vwan hub to which the virtual network will be connected.\nE.g. /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/my-rg/providers/Microsoft.Network/virtualHubs/my-hub\n\nYou must also set virtual_network_vwan_connection_enabled = true.\n\nLeave blank to and set virtual_network_vwan_connection_enabled = false (the default) to create a virtual network without a vwan hub connection.\n"
  type        = bool
  default     = false
}

variable "virtual_network_vwan_propagated_routetables_labels" {
  description = "The list of virtual WAN labels to advertise the routes to.\n\nLeave blank to use the default label.\n"
  type        = list(string)
  default     = []
}

variable "virtual_network_vwan_propagated_routetables_resource_ids" {
  description = "The list of route table resource ids to advertise routes to.\n\nLeave blank to use the defaultRouteTable.\n"
  type        = list(string)
  default     = []
}

variable "virtual_network_vwan_routetable_resource_id" {
  description = "The resource ID of the virtual network route table to use for the virtual network.\n\nLeave blank to use the defaultRouteTable.\n\nE.g. /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/my-rg/providers/Microsoft.Network/virtualHubs/my-vhub/hubRouteTables/defaultRouteTable\n"
  type        = string
  default     = ""
}

variable "vwan_hub_resource_id" {
  description = "The resource ID of the vwan hub to which the virtual network will be connected.\n\nE.g. /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/my-rg/providers/Microsoft.Network/virtualHubs/my-hub\n\nLeave blank to create a virtual network without a vwan hub connection.\n"
  type        = string
  default     = ""
}
