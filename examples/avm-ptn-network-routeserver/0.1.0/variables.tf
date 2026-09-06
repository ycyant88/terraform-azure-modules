variable "bgp_connections" {
  description = "A map of bgp connections to make on each route server.\"\n- <map key> - An arbitrary map key to differentiate each instance of the map.\n  - name - (Required) - The name to use for the bgp connection\n  - peer_asn - (Required) - The ASN for the peer NVA\n  - peer_ip - (Required) - The IP address for the peer NVA\n"
  type = map(object({
    name     = string
    peer_asn = string
    peer_ip  = string
  }))
  default = {}
}

variable "enable_branch_to_branch" {
  description = "Should the branch to branch feature be enabled. Defaults to false."
  type        = bool
  default     = false
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "hub_routing_preference" {
  description = "The routing preference for this route server.  Valid values are ASPath, ExpressRoute, or VpnGateway. Defaults to ExpressRoute"
  type        = string
  default     = "ExpressRoute"
}

variable "location" {
  description = "Azure region where the resource should be deployed."
  type        = string
  default     = ""
}

variable "lock" {
  description = "Controls the Resource Lock configuration for this resource. The following properties can be specified:\n\n- kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n- name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n"
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "name" {
  description = "The name of the this route server resource."
  type        = string
  default     = ""
}

variable "private_ip_address" {
  description = "The private ip address to use for the route server IP_configuration if the private_ip_allocation_method is set to Static."
  type        = string
  default     = null
}

variable "private_ip_allocation_method" {
  description = "The private IP Address allocation method for this route server. Valid values are Static or Dynamic. Defaults to Dynamic."
  type        = string
  default     = "Dynamic"
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "resource_group_resource_id" {
  description = "The Azure Resource ID for the resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "A map of role assignments to create on the <RESOURCE>. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n- principal_id - The ID of the principal to assign the role to.\n- description - (Optional) The description of the role assignment.\n- skip_service_principal_aad_check - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n- condition - (Optional) The condition which will be used to scope the role assignment.\n- condition_version - (Optional) The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\n- delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\n- principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n\n> Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
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

variable "route_server_subnet_resource_id" {
  description = "The Azure resource ID for the route server subnet where this route server resource will be deployed."
  type        = string
  default     = ""
}

variable "routeserver_public_ip_name" {
  description = "The name for the public ip address resource associated with the route server."
  type        = string
  default     = null
}

variable "tags" {
  description = "(Optional) - The map of tags to be applied to the resource"
  type        = map(string)
  default     = null
}
