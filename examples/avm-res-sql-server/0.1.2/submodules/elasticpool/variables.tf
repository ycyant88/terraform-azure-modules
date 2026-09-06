variable "diagnostic_settings" {
  description = "A map of diagnostic settings to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  \n- name - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.\n- log_categories - (Optional) A set of log categories to send to the log analytics workspace. Defaults to [].\n- log_groups - (Optional) A set of log groups to send to the log analytics workspace. Defaults to [\"allLogs\"].\n- metric_categories - (Optional) A set of metric categories to send to the log analytics workspace. Defaults to [\"AllMetrics\"].\n- log_analytics_destination_type - (Optional) The destination type for the diagnostic setting. Possible values are Dedicated and AzureDiagnostics. Defaults to Dedicated.\n- workspace_resource_id - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.\n- storage_account_resource_id - (Optional) The resource ID of the storage account to send logs and metrics to.\n- event_hub_authorization_rule_resource_id - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.\n- event_hub_name - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.\n- marketplace_partner_resource_id - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic LogsLogs.\n"
  type = map(object({
    name                                     = optional(string, null)
    log_categories                           = optional(set(string), [])
    log_groups                               = optional(set(string), ["allLogs"])
    metric_categories                        = optional(set(string), ["AllMetrics"])
    log_analytics_destination_type           = optional(string, "Dedicated")
    workspace_resource_id                    = optional(string, null)
    storage_account_resource_id              = optional(string, null)
    event_hub_authorization_rule_resource_id = optional(string, null)
    event_hub_name                           = optional(string, null)
    marketplace_partner_resource_id          = optional(string, null)
  }))
  default = {}
}

variable "license_type" {
  description = "The license type for the elastic pool."
  type        = string
  default     = "LicenseIncluded"
}

variable "location" {
  description = "The location of the elastic pool."
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

variable "maintenance_configuration_name" {
  description = "The name of the maintenance configuration."
  type        = string
  default     = "SQL_Default"
}

variable "max_size_bytes" {
  description = "The maximum size of the elastic pool in bytes."
  type        = number
  default     = null
}

variable "max_size_gb" {
  description = "The maximum size of the elastic pool in GB."
  type        = number
  default     = 50
}

variable "name" {
  description = "The name of the elastic pool."
  type        = string
  default     = ""
}

variable "per_database_settings" {
  description = "The per database settings for the elastic pool.\n\n- min_capacity - The minimum capacity of the elastic pool in DTUs or vCores.\n- max_capacity - The maximum capacity of the elastic pool in DTUs or vCores.\n\n"
  type = object({
    min_capacity = number
    max_capacity = number
  })
  default = { "max_capacity" : 25, "min_capacity" : 0 }
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

variable "sku" {
  description = "The SKU of the elastic pool.\n\n- name - The name of the SKU.\n- capacity - The capacity of the SKU.\n- tier - The tier of the SKU.\n- family - The family of the SKU.\n"
  type = object({
    name     = string
    capacity = number
    tier     = string
    family   = optional(string)
  })
  default = { "capacity" : 125, "family" : null, "name" : "PremiumPool", "tier" : "Premium" }
}

variable "sql_server" {
  description = "The resource ID of the SQL Server to create the elastic pool on."
  type = object({
    resource_id = string
  })
  default = ""
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "zone_redundant" {
  description = "Specifies if the elastic pool is zone redundant."
  type        = bool
  default     = true
}
