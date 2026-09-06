variable "arc_setting_id" {
  description = "The resource ID for the Azure Arc setting."
  type        = string
  default     = ""
}

variable "azurerm_monitor_data_collection_rule_association_name" {
  description = "The name of the Azure Monitor Data Collection Rule Association."
  type        = string
  default     = ""
}

variable "create_data_collection_resources" {
  description = "Whether to create the data collection resources."
  type        = bool
  default     = false
}

variable "data_collection_endpoint_name" {
  description = "The name of the Azure Log Analytics data collection endpoint."
  type        = string
  default     = null
}

variable "data_collection_rule_name" {
  description = "The name of the Azure Log Analytics data collection rule."
  type        = string
  default     = null
}

variable "data_collection_rule_resource_id" {
  description = "The id of the Azure Log Analytics data collection rule."
  type        = string
  default     = null
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
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
  description = "The name of the this resource."
  type        = string
  default     = "AzureMonitorWindowsAgent"
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "A map of role assignments to create on this resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n- principal_id - The ID of the principal to assign the role to.\n- description - The description of the role assignment.\n- skip_service_principal_aad_check - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n- condition - The condition which will be used to scope the role assignment.\n- condition_version - The version of the condition syntax. Valid values are '2.0'.\n\n> Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
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

variable "server_names" {
  description = "A list of servers with their names."
  type        = list(string)
  default     = ""
}

variable "workspace_name" {
  description = "The name of the Azure Log Analytics workspace."
  type        = string
  default     = null
}
