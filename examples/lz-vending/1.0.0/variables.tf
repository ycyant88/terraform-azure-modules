variable "disable_telemetry" {
  description = "To disable tracking, we have included this variable with a simple boolean flag.\nThe default value is false which does not disable the telemetry.\nIf you would like to disable this tracking, then simply set this value to true and this module will not create the telemetry tracking resources and therefore telemetry tracking will be disabled.\n\nFor more information, see the [wiki](https://aka.ms/lz-vending/tf/telemetry)\n\nE.g.\n\nterraform\nmodule \"lz_vending\" {\n  source  = \"Azure/lz-vending/azurerm\"\n  version = \"<version>\" # change this to your desired version, https://www.terraform.io/language/expressions/version-constraints\n\n  # ... other module variables\n\n  disable_telemetry = true\n}\n\n"
  type        = bool
  default     = false
}

variable "hub_network_resource_id" {
  description = "The resource ID of the virtual network in the hub to which the created virtual network will be peered.\n\nE.g. /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/my-rg/providers/Microsoft.Network/virtualNetworks/my-vnet\n\nLeave blank to create the virtual network without peering.\n"
  type        = string
  default     = ""
}

variable "location" {
  description = "The location of resources deployed by this module.\n"
  type        = string
  default     = ""
}

variable "role_assignment_enabled" {
  description = "Whether to create role assignments.\nIf enabled, supply the list of role assignments in var.role_assignments.\n"
  type        = bool
  default     = false
}

variable "role_assignments" {
  description = "Supply a list of objects containing the details of the role assignments to create.\n\nObject fields:\n\n- principal_id: The directory/object id of the principal to assign the role to.\n- definition: The role definition to assign. Either use the name or the role definition resource id.\n- relative_scope: Scope relative to the created subscription. Leave blank for subscription scope.\n\nE.g.\n\nterraform\nrole_assignments = [\n  # Example using role definition name:\n  {\n    principal_id   = \"00000000-0000-0000-0000-000000000000\",\n    definition     = \"Contributor\",\n    relative_scope = \"\",\n  },\n  # Example using role definition id and RG scope:\n  {\n    principal_id   = \"11111111-1111-1111-1111-111111111111\",\n    definition     = \"/providers/Microsoft.Management/managementGroups/mymg/providers/Microsoft.Authorization/roleDefinitions/aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa\",\n    relative_scope = \"/resourceGroups/MyRg\",\n  }\n]\n\n"
  type = list(object({
    principal_id   = string,
    definition     = string,
    relative_scope = string,
  }))
  default = []
}

variable "subscription_alias_enabled" {
  description = "Whether to create a new subscription using the subscription alias resource.\n\nIf enabled, the following must also be supplied:\n\n- subscription_alias_name\n- subscription_display_name\n- subscription_billing_scope\n- subscription_workload\n\nOptionally, supply the following to enable the placement of the subscription into a management group:\n\n- subscription_management_group_id\n- subscription_management_group_association_enabled\n\nIf disabled, supply the subscription_id variable instead.\n"
  type        = bool
  default     = false
}

variable "subscription_alias_name" {
  description = "The name of the subscription alias.\n\nThe string must be comprised of a-z, A-Z, 0-9, - and _.\nThe maximum length is 63 characters.\n\nYou may also supply an empty string if you do not want to create a new subscription alias.\nIn this scenario, subscription_enabled should be set to false and subscription_id must be supplied.\n"
  type        = string
  default     = ""
}

variable "subscription_billing_scope" {
  description = "The billing scope for the new subscription alias.\n\nA valid billing scope starts with /providers/Microsoft.Billing/billingAccounts/ and is case sensitive.\n\nYou may also supply an empty string if you do not want to create a new subscription alias.\nIn this scenario, subscription_enabled should be set to false and subscription_id must be supplied.\n"
  type        = string
  default     = ""
}

variable "subscription_display_name" {
  description = "The display name of the subscription alias.\n\nThe string must be comprised of a-z, A-Z, 0-9, -, _ and space.\nThe maximum length is 63 characters.\n\nYou may also supply an empty string if you do not want to create a new subscription alias.\nIn this scenario, subscription_enabled should be set to false and subscription_id must be supplied.\n"
  type        = string
  default     = ""
}

variable "subscription_id" {
  description = "An existing subscription id.\n\nUse this when you do not want the module to create a new subscription.\nBut do want to manage the management group membership.\n\nA GUID should be supplied in the format xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx.\nAll letters must be lowercase.\n\nWhen using this, subscription_management_group_association_enabled should be enabled,\nand subscription_management_group_id should be supplied.\n\nYou may also supply an empty string if you want to create a new subscription alias.\nIn this scenario, subscription_alias_enabled should be set to true and the following other variables must be supplied:\n\n- subscription_alias_name\n- subscription_alias_display_name\n- subscription_alias_billing_scope\n- subscription_alias_workload\n"
  type        = string
  default     = ""
}

variable "subscription_management_group_association_enabled" {
  description = "Whether to create the azurerm_management_group_association resource.\n\nIf enabled, the subscription_management_group_id must also be supplied.\n"
  type        = bool
  default     = false
}

variable "subscription_management_group_id" {
  description = "  The destination management group ID for the new subscription.\n\n**Note:** Do not supply the display name.\nThe management group ID forms part of the Azure resource ID. E.g.,\n/providers/Microsoft.Management/managementGroups/{managementGroupId}.\n"
  type        = string
  default     = ""
}

variable "subscription_tags" {
  description = "A map of tags to assign to the newly created subscription.\nOnly valid when subsciption_alias_enabled is set to true.\n\nExample value:\n\nterraform\nsubscription_tags = {\n  mytag  = \"myvalue\"\n  mytag2 = \"myvalue2\"\n}\n\n"
  type        = map(string)
  default     = {}
}

variable "subscription_workload" {
  description = "The billing scope for the new subscription alias.\n\nThe workload type can be either Production or DevTest and is case sensitive.\n\nYou may also supply an empty string if you do not want to create a new subscription alias.\nIn this scenario, subscription_enabled should be set to false and subscription_id must be supplied.\n"
  type        = string
  default     = ""
}

variable "virtual_network_address_space" {
  description = "The address space of the virtual network, supplied as multiple CIDR blocks, e.g. [\"10.0.0.0/8\",\"172.16.0.0/12\"].\n"
  type        = list(string)
  default     = []
}

variable "virtual_network_enabled" {
  description = "Enables and disables the virtual network submodule.\n"
  type        = bool
  default     = false
}

variable "virtual_network_location" {
  description = "The location of the virtual network.\n\nUse this to override the default location defined by var.location.\nLeave blank to use the default location.\n"
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

variable "virtual_network_resource_lock_enabled" {
  description = "Enables the deployment of resource locks to the virtual network's resource group.\nCurrently only CanNotDelete locks are supported.\n"
  type        = bool
  default     = true
}

variable "virtual_network_use_remote_gateways" {
  description = "Enables the use of remote gateways for the virtual network.\n\nApplies to hub and spoke (vnet peerings).\n"
  type        = bool
  default     = true
}

variable "virtual_network_vwan_associated_routetable_resource_id" {
  description = "The resource ID of the virtual network route table to use for the virtual network.\n\nLeave blank to use the defaultRouteTable.\n\nE.g. /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/my-rg/providers/Microsoft.Network/virtualHubs/my-vhub/hubRouteTables/defaultRouteTable\n"
  type        = string
  default     = ""
}

variable "virtual_network_vwan_connection_enabled" {
  description = "Whether to enable connection with supplied vwan hub.\nEnables a vwan networking topology.\n\nIf enabled the vwan_hub_resource_id must also be supplied.\n"
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

variable "vwan_hub_resource_id" {
  description = "The resource ID of the vwan hub to which the virtual network will be connected.\nE.g. /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/my-rg/providers/Microsoft.Network/virtualHubs/my-hub\n\nLeave blank to create a virtual network without a vwan hub connection.\n"
  type        = string
  default     = ""
}
