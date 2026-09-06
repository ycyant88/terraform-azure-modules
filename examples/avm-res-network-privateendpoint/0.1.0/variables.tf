variable "application_security_group_association_ids" {
  description = "(Optional) The resource ids of application security group to associate."
  type        = set(string)
  default     = []
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "ip_configurations" {
  description = "  (Optional) An ip_configuration block as defined below\n  map(object({\n    private_ip_address = \"(Required) Specifies the static IP address within the private endpoint's subnet to be used. Changing this forces a new resource to be created.\"\n    subresource_name   = \"(Required) Specifies the subresource this IP address applies to.\"\n    member_name        = \"(Optional) Specifies the member name this IP address applies to.\"\n  }))\n\n  Example Input:\n\n  terraform\n  ip_configurations ={\n    \"object1\" = {\n      name               = \"<name_of_the_ip_configuration>\"\n      private_ip_address = \"<value_of_the_static_IP >\"\n      subresource_name   = \"<subresource_name>\"\n    }\n  }\n   \n"
  type = map(object({
    name               = string
    private_ip_address = string
    subresource_name   = string
    member_name        = optional(string, "default")
  }))
  default = {}
}

variable "location" {
  description = "(Required) Azure region where the resource should be deployed.  If null, the location will be inferred from the resource group location."
  type        = string
  default     = ""
}

variable "lock" {
  description = "The lock level to apply. Default is None. Possible values are None, CanNotDelete, and ReadOnly."
  type = object({
    name = optional(string, null)
    kind = string
  })
  default = null
}

variable "name" {
  description = "(Required) The name of the this resource."
  type        = string
  default     = ""
}

variable "network_interface_name" {
  description = "(Optional) The custom name of the network interface attached to the private endpoint. Changing this forces a new resource to be created"
  type        = string
  default     = ""
}

variable "private_connection_resource_id" {
  description = "(Required) The ID of the Private Link Enabled Remote Resource which this Private Endpoint should be connected to."
  type        = string
  default     = ""
}

variable "private_dns_zone_group_name" {
  description = "(Optional) Specifies the Name of the Private DNS Zone Group."
  type        = string
  default     = null
}

variable "private_dns_zone_resource_ids" {
  description = "(Optional) Specifies the list of Private DNS Zones to include within the private_dns_zone_group."
  type        = list(string)
  default     = []
}

variable "private_service_connection_name" {
  description = "(Optional) Specifies the  Specifies the Name of the Private Service Connection."
  type        = string
  default     = null
}

variable "resource_group_name" {
  description = "(Required) The resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "A map of role assignments to create on this resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n- principal_id - The ID of the principal to assign the role to.\n- description - The description of the role assignment.\n- skip_service_principal_aad_check - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n- condition - The condition which will be used to scope the role assignment.\n- condition_version - The version of the condition syntax. Valid values are '2.0'.\n- delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\n- principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.  \n\n> Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n\nExample Input:\n\n  terraform\n  role_assignments ={\n    \"object1\" = {\n      role_definition_id_or_name = \"<role_definition_1_name>\"\n      principal_id               = \"<object_id_of_the_principal>\"\n    },\n    \"object2\" = {\n      role_definition_id_or_name = \"<role_definition_2_name>\"\n      principal_id               = \"<object_id_of_the_principal>\"\n      description                = \"<description>\"\n    },\n  }\n   \n"
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

variable "subnet_resource_id" {
  description = "(Required) Azure resource ID of the Subnet from which Private IP Addresses will be allocated for this Private Endpoint. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "subresource_names" {
  description = "(Optional) A list of subresource names which the Private Endpoint is able to connect to. [https://learn.microsoft.com/en-us/azure/private-link/private-endpoint-overview#private-link-resource]"
  type        = list(string)
  default     = null
}

variable "tags" {
  description = "Tags to be applied to the resource"
  type        = map(string)
  default     = null
}
