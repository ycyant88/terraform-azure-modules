variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "inbound_endpoints" {
  description = "A map of inbound endpoints to create on this resource. \nMultiple endpoints can be created by providing multiple entries in the map.\nFor each endpoint, the subnet_name is required, it points to a subnet in the virtual network provided in the \"virtual_network_resource_id\" variable.\n"
  type = map(object({
    name                         = optional(string)
    subnet_name                  = string
    private_ip_allocation_method = optional(string, "Dynamic")
    private_ip_address           = optional(string, null)
  }))
  default = {}
}

variable "location" {
  description = "Azure region where the resource should be deployed."
  type        = string
  default     = ""
}

variable "lock" {
  description = "  Controls the Resource Lock configuration for this resource. The following properties can be specified:\n  \n  - kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n  - name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n"
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "name" {
  description = "The name of the dns resolver."
  type        = string
  default     = ""
}

variable "outbound_endpoints" {
  description = "A map of outbound endpoints to create on this resource.\n- name - (Optional) The name for the endpoint \n- link_with_outbound_endpoint_virtual_network - (Optional) Whether to link the outbound endpoint with the virtual network. Defaults to true.\n- metadata_for_outbound_endpoint_virtual_network_link - (Optional) A map of metadata to associate with the virtual network link.\n- additional_virtual_network_links - (Optional) A map of additional virtual network links to create.\n  - vnet_id - (Required) The ID of the virtual network to link to.\n  - metadata - (Optional) A map of metadata to associate with the virtual network link.\n- subnet_name - (Required) The subnet name from the virtual network provided. \n- forwarding_ruleset - (Optional) A map of forwarding rulesets to create on the outbound endpoint.\n  - name - (Optional) The name of the forwarding ruleset\n  - rules - (Optional) A map of forwarding rules to create on the forwarding ruleset.\n    - name - (Optional) The name of the forwarding rule\n    - domain_name - (Required) The domain name to forward\n    - enabled - (Optional) Whether the forwarding rule is enabled. Defaults to true.\n    - metadata - (Optional) A map of metadata to associate with the forwarding rule\n    - destination_ip_addresses - (Required) a map of string, the key is the IP address and the value is the port\n"
  type = map(object({
    name        = optional(string)
    subnet_name = string
    forwarding_ruleset = optional(map(object({
      name                                                = optional(string)
      link_with_outbound_endpoint_virtual_network         = optional(bool, true)
      metadata_for_outbound_endpoint_virtual_network_link = optional(map(string), null)
      additional_virtual_network_links = optional(map(object({
        vnet_id  = string
        metadata = optional(map(string), null)
      })), {})
      rules = optional(map(object({
        name                     = optional(string)
        domain_name              = string
        destination_ip_addresses = map(string)
        enabled                  = optional(bool, true)
        metadata                 = optional(map(string), null)
      })))
    })))
  }))
  default = {}
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "  A map of role assignments to create on the <RESOURCE>. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  \n  - role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n  - principal_id - The ID of the principal to assign the role to.\n  - description - (Optional) The description of the role assignment.\n  - skip_service_principal_aad_check - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n  - condition - (Optional) The condition which will be used to scope the role assignment.\n  - condition_version - (Optional) The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\n  - delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\n  - principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n  \n  > Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
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

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "virtual_network_resource_id" {
  description = "The ID of the virtual network to deploy the inbound and outbound endpoints into. The vnet should have appropriate subnets for the endpoints.\nFor more information on how to configure subnets for inbound and outbounbd endpoints, see the modules readme.\n"
  type        = string
  default     = ""
}
