variable "compute_count" {
  description = "The number of compute nodes in the infrastructure."
  type        = number
  default     = ""
}

variable "display_name" {
  description = "The display name of the infrastructure."
  type        = string
  default     = ""
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "location" {
  description = "Azure region where the resource should be deployed."
  type        = string
  default     = ""
}

variable "maintenance_window_leadtime_in_weeks" {
  description = "The maintenance window load time in weeks."
  type        = number
  default     = 0
}

variable "maintenance_window_patching_mode" {
  description = "The maintenance window patching mode."
  type        = string
  default     = "Rolling"
}

variable "maintenance_window_preference" {
  description = "The maintenance window preference."
  type        = string
  default     = "NoPreference"
}

variable "name" {
  description = "The name of the the Oracle Exatada Infrastructure resource."
  type        = string
  default     = ""
}

variable "resource_group_id" {
  description = "The resource group ID where the resources will be deployed."
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "A map of role assignments to create on this resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n- principal_id - The ID of the principal to assign the role to.\n- description - The description of the role assignment.\n- skip_service_principal_aad_check - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n- condition - The condition which will be used to scope the role assignment.\n- condition_version - The version of the condition syntax. Valid values are '2.0'.\n- delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\n- principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n  \n\n> Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
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

variable "shape" {
  description = "The shape of the infrastructure."
  type        = string
  default     = "Exadata.X9M"
}

variable "storage_count" {
  description = "The number of storage servers in the infrastructure."
  type        = number
  default     = ""
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "zone" {
  description = "The Availability Zone for the resource."
  type        = string
  default     = ""
}
