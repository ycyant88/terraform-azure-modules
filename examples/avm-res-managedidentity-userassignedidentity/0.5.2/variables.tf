variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "federated_identity_credentials" {
  description = "A map of federated identity credentials to create on the user assigned identity. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- audiences - (Required) Specifies the audience for this Federated Identity Credential.\n- issuer - (Required) Specifies the issuer of this Federated Identity Credential.\n- name - (Required) Specifies the name of this Federated Identity Credential. Changing this forces a new resource to be created.\n- subject - (Required) Specifies the subject for this Federated Identity Credential.\n"
  type = map(object({
    audience = list(string)
    issuer   = string
    name     = string
    subject  = string
  }))
  default = {}
}

variable "isolation_scope" {
  description = "(Optional) The isolation scope for the user assigned identity. The only possible value is Regional."
  type        = string
  default     = null
}

variable "location" {
  description = "Azure region where the resource should be deployed.  If null, the location will be inferred from the resource group location."
  type        = string
  default     = ""
}

variable "lock" {
  description = "  Controls the Resource Lock configuration for this resource. The following properties can be specified:\n\n  - kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n  - name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n"
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "name" {
  description = "The name of the this resource."
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "A map of role assignments to create for the user assigned identity. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n- scope - The ID of the scope to assign the role to.\n- condition_version - (Optional) The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\n- condition - (Optional) The condition which will be used to scope the role assignment.\n- delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\n- description - (Optional) The description of the role assignment.\n- skip_service_principal_aad_check - (Optional) Skip validating the Service Principal in AAD before applying the Role Assignment. Defaults to false. Changing this forces a new resource to be created.\n"
  type = map(object({
    role_definition_id_or_name             = string
    scope                                  = string
    condition                              = optional(string, null)
    condition_version                      = optional(string, null)
    delegated_managed_identity_resource_id = optional(string, null)
    description                            = optional(string, null)
    skip_service_principal_aad_check       = optional(bool, null)
  }))
  default = {}
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}
