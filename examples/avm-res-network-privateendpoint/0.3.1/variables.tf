variable "application_security_group_association_ids" {
  description = "(Optional) The resource ids of application security group to associate."
  type        = set(string)
  default     = []
}

variable "avm_managed_migration_enabled" {
  description = "Enables module-owned migration helpers for upgrading from earlier AzureRM-backed versions. Set to true only during the upgrade apply, then set back to false."
  type        = bool
  default     = false
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "ignore_body_changes" {
  description = "Body-relative dot-notation paths the AzAPI provider ignores for each resource. Ignored configuration is not sent to Azure until the path is removed. Changes take effect only after apply. A non-empty value requires Terraform 1.11 or later.\n\n- authorization_locks - Ignored paths for the lock.\n- authorization_role_assignments - Ignored paths for role assignments.\n- network_private_endpoints - Ignored paths for the private endpoint.\n- network_private_endpoints_private_dns_zone_groups - Override slot for the DNS zone group submodule.\n  - network_private_endpoints_private_dns_zone_groups - Ignored paths for the DNS zone group.\n"
  type = object({
    authorization_locks            = optional(list(string), [])
    authorization_role_assignments = optional(list(string), [])
    network_private_endpoints      = optional(list(string), [])
    network_private_endpoints_private_dns_zone_groups = optional(object({
      network_private_endpoints_private_dns_zone_groups = optional(list(string), [])
    }), {})
  })
  default = {}
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
  description = "Controls the resource lock configuration for this private endpoint.\n\n- kind - (Required) The type of lock. Possible values are CanNotDelete and ReadOnly.\n- name - (Optional) The lock name. If omitted, the module preserves the previous lock-<kind> name.\n- notes - (Optional) Notes written to Microsoft.Authorization/locks.properties.notes. The module preserves its previous default notes when omitted.\n"
  type = object({
    kind  = string
    name  = optional(string, null)
    notes = optional(string, null)
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

variable "parent_id" {
  description = "The Azure resource ID of the parent resource group, in the form /subscriptions/{subscription_id}/resourceGroups/{resource_group_name}."
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

variable "resource_types" {
  description = "AzAPI resource types and API versions used by this module and its submodule. Supply only the keys to override.\n\n- authorization_locks - The management lock.\n- authorization_role_assignments - Role assignments on the private endpoint.\n- network_private_endpoints - The private endpoint.\n- network_private_endpoints_private_dns_zone_groups - Overrides for the private DNS zone group submodule.\n  - network_private_endpoints_private_dns_zone_groups - The private DNS zone group managed by the submodule.\n"
  type = object({
    authorization_locks            = optional(string, "Microsoft.Authorization/locks@2020-05-01")
    authorization_role_assignments = optional(string, "Microsoft.Authorization/roleAssignments@2022-04-01")
    network_private_endpoints      = optional(string, "Microsoft.Network/privateEndpoints@2025-07-01")
    network_private_endpoints_private_dns_zone_groups = optional(object({
      network_private_endpoints_private_dns_zone_groups = optional(string)
    }), {})
  })
  default = {}
}

variable "retry" {
  description = "Retry configuration applied to every AzAPI resource in this module and its submodule. Defaults to provider retry behavior.\n\n- error_message_regex - (Optional) Error-message patterns that trigger a retry.\n- interval_seconds - (Optional) Initial interval between retries in seconds.\n- max_interval_seconds - (Optional) Maximum interval between retries in seconds.\n\nSee the AzAPI provider retry documentation for full semantics.\n"
  type = object({
    error_message_regex  = optional(list(string))
    interval_seconds     = optional(number)
    max_interval_seconds = optional(number)
  })
  default = null
}

variable "role_assignments" {
  description = "A map of role assignments to create on this private endpoint. The map key is deliberately arbitrary to avoid issues where map keys may be unknown at plan time.\n\n- name - (Optional) The role assignment GUID. If omitted, the interfaces module generates one. During migration, existing AzureRM names are preserved.\n- role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n- principal_id - The ID of the principal to assign the role to.\n- description - The description of the role assignment.\n- skip_service_principal_aad_check - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n- condition - The condition which will be used to scope the role assignment.\n- condition_version - The version of the condition syntax. Valid values are '2.0'.\n- delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\n- principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.  \n\n> Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n\nExample Input:\n\n  terraform\n  role_assignments ={\n    \"object1\" = {\n      role_definition_id_or_name = \"<role_definition_1_name>\"\n      principal_id               = \"<object_id_of_the_principal>\"\n    },\n    \"object2\" = {\n      role_definition_id_or_name = \"<role_definition_2_name>\"\n      principal_id               = \"<object_id_of_the_principal>\"\n      description                = \"<description>\"\n    },\n  }\n   \n"
  type = map(object({
    name                                   = optional(string, null)
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

variable "timeouts" {
  description = "Default per-operation timeouts applied to every AzAPI resource in this module and its submodule. Defaults to provider timeouts. Values are Go duration strings such as 30m or 1h.\n\n- create - (Optional) Timeout for create operations.\n- read - (Optional) Timeout for read operations.\n- update - (Optional) Timeout for update operations.\n- delete - (Optional) Timeout for delete operations.\n"
  type = object({
    create = optional(string)
    read   = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = null
}
