variable "copy_paste_enabled" {
  description = "Specifies whether copy-paste functionality is enabled for the Azure Bastion Host."
  type        = bool
  default     = true
}

variable "diagnostic_settings" {
  description = "A map of diagnostic settings to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\r\n- name - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.\r\n- log_categories - (Optional) A set of log categories to send to the log analytics workspace. Defaults to [].\r\n- log_groups - (Optional) A set of log groups to send to the log analytics workspace. Defaults to [\"allLogs\"].\r\n- metric_categories - (Optional) A set of metric categories to send to the log analytics workspace. Defaults to [\"AllMetrics\"].\r\n- log_analytics_destination_type - (Optional) The destination type for the diagnostic setting. Possible values are Dedicated and AzureDiagnostics. Defaults to Dedicated.\r\n- workspace_resource_id - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.\r\n- storage_account_resource_id - (Optional) The resource ID of the storage account to send logs and metrics to.\r\n- event_hub_authorization_rule_resource_id - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.\r\n- event_hub_name - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.\r\n- marketplace_partner_resource_id - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic LogsLogs.\r\n\r\nExample usage:\r\nhcl\r\n\r\ndiagnostic_settings = {\r\n  setting1 = {\r\n    log_analytics_destination_type = \"Dedicated\"\r\n    workspace_resource_id = \"logAnalyticsWorkspaceResourceId\"\r\n  }\r\n}\r\n\r\n"
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

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\r\nFor more information see https://aka.ms/avm/telemetryinfo.\r\nIf it is set to false, then no telemetry will be collected.\r\n\r\nExample usage:\r\nenable_telemetry = false\r\n"
  type        = bool
  default     = true
}

variable "file_copy_enabled" {
  description = "Specifies whether file copy functionality is enabled for the Azure Bastion Host."
  type        = bool
  default     = false
}

variable "ip_configuration" {
  description = "The IP configuration for the Azure Bastion Host.\r\n\r\n- name - The name of the IP configuration.\r\n- subnet_id - The ID of the subnet where the Azure Bastion Host will be deployed.\r\n- public_ip_address_id - The ID of the public IP address associated with the Azure Bastion Host.\r\n"
  type = object({
    name                 = string
    subnet_id            = string
    public_ip_address_id = string
  })
  default = ""
}

variable "ip_connect_enabled" {
  description = "Specifies whether IP connect functionality is enabled for the Azure Bastion Host."
  type        = bool
  default     = false
}

variable "kerberos_enabled" {
  description = "Specifies whether Kerberos authentication is enabled for the Azure Bastion Host."
  type        = bool
  default     = false
}

variable "location" {
  description = "The location of the Azure Bastion Host."
  type        = string
  default     = ""
}

variable "lock" {
  description = "Controls the Resource Lock configuration for this resource. The following properties can be specified:\r\n\r\n- kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\r\n- name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\r\n"
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "name" {
  description = "The name of the Azure Bastion Host."
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "The name of the resource group where the Azure Bastion Host is located."
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "A map of role assignments to create on the <RESOURCE>. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\r\n\r\n- role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\r\n- principal_id - The ID of the principal to assign the role to.\r\n- description - (Optional) The description of the role assignment.\r\n- skip_service_principal_aad_check - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\r\n- condition - (Optional) The condition which will be used to scope the role assignment.\r\n- condition_version - (Optional) The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\r\n- delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\r\n- principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\r\n\r\n> Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\r\n"
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

variable "scale_units" {
  description = "The number of scale units for the Azure Bastion Host."
  type        = number
  default     = 2
}

variable "shareable_link_enabled" {
  description = "Specifies whether shareable link functionality is enabled for the Azure Bastion Host."
  type        = bool
  default     = false
}

variable "sku" {
  description = "The SKU of the Azure Bastion Host."
  type        = string
  default     = "Basic"
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "tunneling_enabled" {
  description = "Specifies whether tunneling functionality is enabled for the Azure Bastion Host."
  type        = bool
  default     = false
}
