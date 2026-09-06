variable "disable_telemetry" {
  description = "To disable tracking, we have included this variable with a simple boolean flag.\nThe default value is false which does not disable the telemetry.\nIf you would like to disable this tracking, then simply set this value to true and this module will not create the telemetry tracking resources and therefore telemetry tracking will be disabled.\n\nFor more information, see the [wiki](https://aka.ms/lz-vending/tf/telemetry)\n\nE.g.\n\nterraform\nmodule \"lz_vending\" {\n  source  = \"Azure/lz-vending/azurerm\"\n  version = \"<version>\" # change this to your desired version, https://www.terraform.io/language/expressions/version-constraints\n\n  # ... other module variables\n\n  disable_telemetry = true\n}\n\n"
  type        = bool
  default     = false
}

variable "location" {
  description = "The default location of resources created by this module.\nVirtual networks will be created in this location unless overridden by the location attribute.\n"
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
  description = "Whether to create a new subscription using the subscription alias resource.\n\nIf enabled, the following must also be supplied:\n\n- subscription_alias_name\n- subscription_display_name\n- subscription_billing_scope\n- subscription_workload\n\nOptionally, supply the following to enable the placement of the subscription into a management group:\n\n- subscription_management_group_id\n- subscription_management_group_association_enabled\n\nIf disabled, supply the subscription_id variable to use an existing subscription instead.\n\n> **Note**: When the subscription is destroyed, this module will try to remove the NetworkWatcherRG resource group using az cli.\n> This requires the az cli tool be installed and authenticated.\n> If the command fails for any reason, the provider will attempt to cancel the subscription anyway.\n"
  type        = bool
  default     = false
}

variable "subscription_alias_name" {
  description = "The name of the subscription alias.\n\nThe string must be comprised of a-z, A-Z, 0-9, - and _.\nThe maximum length is 63 characters.\n\nYou may also supply an empty string if you do not want to create a new subscription alias.\nIn this scenario, subscription_enabled should be set to false and subscription_id must be supplied.\n"
  type        = string
  default     = ""
}

variable "subscription_billing_scope" {
  description = "The billing scope for the new subscription alias.\n\nA valid billing scope starts with /providers/Microsoft.Billing/billingAccounts/ and is case sensitive.\n\nE.g.\n\n- For CustomerLed and FieldLed, e.g. MCA - /providers/Microsoft.Billing/billingAccounts/{billingAccountName}/billingProfiles/{billingProfileName}/invoiceSections/{invoiceSectionName}\n- For PartnerLed, e.g. MPA - /providers/Microsoft.Billing/billingAccounts/{billingAccountName}/customers/{customerName}\n- For Legacy EA - /providers/Microsoft.Billing/billingAccounts/{billingAccountName}/enrollmentAccounts/{enrollmentAccountName}\n\nYou may also supply an empty string if you do not want to create a new subscription alias.\nIn this scenario, subscription_enabled should be set to false and subscription_id must be supplied.\n"
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

variable "virtual_network_enabled" {
  description = "Enables and disables the virtual network submodule."
  type        = bool
  default     = false
}

variable "virtual_networks" {
  description = "A map of the virtual networks to create. The map key must be known at the plan stage, e.g. must not be calculated and known only after apply.\n\n### Required fields\n\n- name: The name of the virtual network. [required]\n- address_space: The address space of the virtual network as a list of strings in CIDR format, e.g. [\"192.168.0.0/24\", \"10.0.0.0/24\"]. [required]\n- resource_group_name: The name of the resource group to create the virtual network in. [required]\n\n### Location\n\n- location: The location of the virtual network (and resource group if creation is enabled). [optional, will use var.location if not specified or empty string]\n\n> Note at least one of location or var.location must be specified.\n> If both are empty then the module will fail.\n\n### Hub network peering values\n\nThe following values configure bi-directional hub & spoke peering for the given virtual network.\n\n- hub_peering_enabled: Whether to enable hub peering. [optional]\n- hub_network_resource_id: The resource ID of the hub network to peer with. [optional - but required if hub_peering_enabled is true]\n- hub_peering_name_tohub: The name of the peering to the hub network. [optional - leave empty to use calculated name]\n- hub_peering_name_fromhub: The name of the peering from the hub network. [optional - leave empty to use calculated name]\n- hub_peering_use_remote_gateways: Whether to use remote gateways for the hub peering. [optional - default true]\n\n### Mesh peering values\n\nMesh peering is the capability to create a bi-directional peerings between all supplied virtual networks in var.virtual_networks.\nPeerings will only be created between virtual networks with the mesh_peering_enabled value set to true.\n\n- mesh_peering_enabled: Whether to enable mesh peering for this virtual network. Must be enabled on more than one virtual network for any peerings to be created. [optional]\n- mesh_peering_allow_forwarded_traffic: Whether to allow forwarded traffic for the mesh peering. [optional - default false]\n\n### Resource group values\n\nA resource group will be created for\n\n- resource_group_creation_enabled: Whether to create a resource group for the virtual network. [optional - default true]\n- resource_group_lock_enabled: Whether to create a CanNotDelete resource lock on the resource group. [optional - default true]\n- resource_group_lock_name: The name of the resource lock. [optional - leave empty to use calculated name]\n- resource_group_tags: A map of tags to apply to the resource group, e.g. { mytag = \"myvalue\", mytag2 = \"myvalue2\" }. [optional - default empty]\n\n### Virtual WAN values\n\n- vwan_associated_routetable_resource_id: The resource ID of the route table to associate with the virtual network. [optional - leave empty to use defaultRouteTable on hub]\n- vwan_connection_enabled: Whether to create a connection to a Virtual WAN. [optional - default false]\n- vwan_connection_name: The name of the connection to the Virtual WAN. [optional - leave empty to use calculated name]\n- vwan_hub_resource_id: The resource ID of the hub to connect to. [optional - but required if vwan_connection_enabled is true]\n- vwan_propagated_routetables_labels: A list of labels of route tables to propagate to the virtual network. [optional - leave empty to use [\"default\"]]\n- vwan_propagated_routetables_resource_ids: A list of resource IDs of route tables to propagate to the virtual network. [optional - leave empty to use defaultRouteTable on hub]\n\n### Tags\n\n- tags: A map of tags to apply to the virtual network. [optional - default empty]\n"
  type = map(object({
    name                = string
    address_space       = list(string)
    location            = string
    resource_group_name = string

    hub_network_resource_id         = optional(string, "")
    hub_peering_enabled             = optional(bool, false)
    hub_peering_name_tohub          = optional(string, "")
    hub_peering_name_fromhub        = optional(string, "")
    hub_peering_use_remote_gateways = optional(bool, true)

    mesh_peering_enabled                 = optional(bool, false)
    mesh_peering_allow_forwarded_traffic = optional(bool, false)

    # Reserved for future capability
    #
    # other_peerings = optional(map(object({
    #   remote_network_resource_id            = string
    #   name_inbound                          = optional(string, "")
    #   name_outbound                         = optional(string, "")
    #   outbound_only                         = optional(bool, false)
    #   allow_forwarded_traffic_inbound       = optional(bool, true)
    #   allow_forwarded_traffic_outbound      = optional(bool, true)
    #   allow_gateway_transit_inbound         = optional(bool, false)
    #   allow_gateway_transit_outbound        = optional(bool, false)
    #   allow_virtual_network_access_inbound  = optional(bool, true)
    #   allow_virtual_network_access_outbound = optional(bool, true)
    #   use_remote_gateways_inbound           = optional(bool, false)
    #   use_remote_gateways_outbound          = optional(bool, false)
    # })), {})

    resource_group_creation_enabled = optional(bool, true)
    resource_group_lock_enabled     = optional(bool, true)
    resource_group_lock_name        = optional(string, "")
    resource_group_tags             = optional(map(string), {})

    vwan_associated_routetable_resource_id   = optional(string, "")
    vwan_connection_enabled                  = optional(bool, false)
    vwan_connection_name                     = optional(string, "")
    vwan_hub_resource_id                     = optional(string, "")
    vwan_propagated_routetables_labels       = optional(list(string), [])
    vwan_propagated_routetables_resource_ids = optional(list(string), [])

    tags = optional(map(string), {})
  }))
  default = {}
}
