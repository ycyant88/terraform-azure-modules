variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see https://aka.ms/avm/telemetryinfo.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "location" {
  description = "The Azure location where the resources will be deployed."
  type        = string
  default     = ""
}

variable "lock" {
  description = "The lock level to apply to the ddos protection plan. Default is None. Possible values are None, CanNotDelete, and ReadOnly."
  type = object({
    name = optional(string, null)
    kind = optional(string, "None")
  })
  default = {}
}

variable "name" {
  description = "the name of the ddos protection plan"
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = ""
  type = map(object({
    role_definition_id_or_name             = string
    principal_id                           = string
    description                            = optional(string, null)
    skip_service_principal_aad_check       = optional(bool, false)
    condition                              = optional(string, null)
    condition_version                      = optional(string, null)
    delegated_managed_identity_resource_id = optional(string, null)
  }))
  default = {}
}

variable "tags" {
  description = "Map of tags to assign to the ddos protection plan."
  type        = map(any)
  default     = null
}
