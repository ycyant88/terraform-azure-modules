variable "auto_pause_delay_in_minutes" {
  description = "The time in minutes before the database is automatically paused."
  type        = number
  default     = null
}

variable "collation" {
  description = "The collation of the database."
  type        = string
  default     = null
}

variable "create_mode" {
  description = "The mode to create the database."
  type        = string
  default     = "Default"
}

variable "diagnostic_settings" {
  description = "  A map of diagnostic settings to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n  - name - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.\n  - log_categories - (Optional) A set of log categories to send to the log analytics workspace. Defaults to [].\n  - log_groups - (Optional) A set of log groups to send to the log analytics workspace. Defaults to [\"allLogs\"].\n  - metric_categories - (Optional) A set of metric categories to send to the log analytics workspace. Defaults to [\"AllMetrics\"].\n  - log_analytics_destination_type - (Optional) The destination type for the diagnostic setting. Possible values are Dedicated and AzureDiagnostics. Defaults to Dedicated.\n  - workspace_resource_id - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.\n  - storage_account_resource_id - (Optional) The resource ID of the storage account to send logs and metrics to.\n  - event_hub_authorization_rule_resource_id - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.\n  - event_hub_name - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.\n  - marketplace_partner_resource_id - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic LogsLogs.\n"
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

variable "elastic_pool_id" {
  description = "The ID of the elastic pool containing the database."
  type        = string
  default     = null
}

variable "geo_backup_enabled" {
  description = "Whether geo-backup is enabled for the database."
  type        = bool
  default     = true
}

variable "import" {
  description = "Controls the Import configuration on this resource. The following properties can be specified:\n\n- storage_uri - (Required) Specifies the URI of the storage account to import the database from.\n- storage_key - (Required) Specifies the key of the storage account to import the database from.\n- storage_key_type - (Required) Specifies the type of the storage key. Possible values are StorageAccessKey and SharedAccessKey.\n- administrator_login - (Required) Specifies the login of the administrator.\n- administrator_login_password - (Required) Specifies the password of the administrator.\n- authentication_type - (Required) Specifies the authentication type. Possible values are SQL and Windows.\n- storage_account_id - (Required) Specifies the ID of the storage account to import the database from.\n"
  type = object({
    storage_uri                  = string
    storage_key                  = string
    storage_key_type             = string
    administrator_login          = string
    administrator_login_password = string
    authentication_type          = string
    storage_account_id           = string
  })
  default = null
}

variable "ledger_enabled" {
  description = "Whether ledger is enabled for the database."
  type        = bool
  default     = false
}

variable "license_type" {
  description = "The license type for the database."
  type        = string
  default     = null
}

variable "lock" {
  description = "  Controls the Resource Lock configuration for this resource. The following properties can be specified:\n\n  - kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n  - name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n"
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "long_term_retention_policy" {
  description = "Controls the Long Term Retention Policy configuration on this resource. The following properties can be specified:\n\n- weekly_retention - (Required) Specifies the weekly retention policy.\n- monthly_retention - (Required) Specifies the monthly retention policy.\n- yearly_retention - (Required) Specifies the yearly retention policy.\n- week_of_year - (Required) Specifies the week of the year to apply the yearly retention policy.\n"
  type = object({
    weekly_retention  = string
    monthly_retention = string
    yearly_retention  = string
    week_of_year      = number
  })
  default = null
}

variable "maintenance_configuration_name" {
  description = "The name of the maintenance configuration."
  type        = string
  default     = null
}

variable "managed_identities" {
  description = "  Controls the Managed Identity configuration on this resource. The following properties can be specified:\n\n  - system_assigned - (Optional) Specifies if the System Assigned Managed Identity should be enabled.\n  - user_assigned_resource_ids - (Optional) Specifies a list of User Assigned Managed Identity resource IDs to be assigned to this resource.\n"
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default = {}
}

variable "max_size_gb" {
  description = "The maximum size of the database in gigabytes."
  type        = number
  default     = null
}

variable "min_capacity" {
  description = "The minimum capacity of the database."
  type        = number
  default     = null
}

variable "name" {
  description = "The name of the database."
  type        = string
  default     = ""
}

variable "read_replica_count" {
  description = "The number of read replicas for the database."
  type        = number
  default     = null
}

variable "read_scale" {
  description = "Whether read scale is enabled for the database."
  type        = bool
  default     = null
}

variable "recover_database_id" {
  description = "The ID of the database to recover."
  type        = string
  default     = null
}

variable "restore_dropped_database_id" {
  description = "The ID of the dropped database to restore."
  type        = string
  default     = null
}

variable "restore_point_in_time" {
  description = "The point in time to restore the database to."
  type        = string
  default     = null
}

variable "role_assignments" {
  description = "  A map of role assignments to create on the <RESOURCE>. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n  - role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n  - principal_id - The ID of the principal to assign the role to.\n  - description - (Optional) The description of the role assignment.\n  - skip_service_principal_aad_check - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n  - condition - (Optional) The condition which will be used to scope the role assignment.\n  - condition_version - (Optional) The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\n  - delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\n  - principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n\n  > Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
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

variable "sample_name" {
  description = "The name of the sample database."
  type        = string
  default     = null
}

variable "short_term_retention_policy" {
  description = "Controls the Short Term Retention Policy configuration on this resource. The following properties can be specified:\n\n- retention_days - (Required) Specifies the number of days to keep in the Short Term Retention audit logs.\n- backup_interval_in_hours - (Required) Specifies the interval in hours to keep in the Short Term Retention audit logs.\n"
  type = object({
    retention_days           = number
    backup_interval_in_hours = number
  })
  default = { "backup_interval_in_hours" : 12, "retention_days" : 35 }
}

variable "sku_name" {
  description = "The SKU name for the database."
  type        = string
  default     = "P2"
}

variable "sql_server" {
  description = "The resource ID of the SQL Server to create the database on."
  type = object({
    resource_id = string
  })
  default = ""
}

variable "storage_account_type" {
  description = "The type of storage account for the database."
  type        = string
  default     = "Geo"
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "threat_detection_policy" {
  description = "Controls the Threat Detection Policy configuration on this resource. The following properties can be specified:\n\n- state - (Required) Specifies the state of the policy. Possible values are Enabled and Disabled.\n- disabled_alerts - (Required) Specifies the list of alerts that are disabled.\n- email_account_admins - (Required) Specifies the email address to which the alerts are sent.\n- email_addresses - (Required) Specifies the list of email addresses to which the alerts are sent.\n- retention_days - (Required) Specifies the number of days to keep in the Threat Detection audit logs.\n- storage_account_access_key - (Required) Specifies the access key of the storage account to which the Threat Detection audit logs are sent.\n- storage_endpoint - (Required) Specifies the endpoint of the storage account to which the Threat Detection audit logs are sent.\n"
  type = object({
    state                      = string
    disabled_alerts            = list(string)
    email_account_admins       = string
    email_addresses            = list(string)
    retention_days             = number
    storage_account_access_key = string
    storage_endpoint           = string
  })
  default = null
}

variable "transparent_data_encryption_enabled" {
  description = "Whether transparent data encryption is enabled for the database."
  type        = bool
  default     = true
}

variable "transparent_data_encryption_key_automatic_rotation_enabled" {
  description = "The key vault key name for transparent data encryption."
  type        = bool
  default     = null
}

variable "transparent_data_encryption_key_vault_key_id" {
  description = "The key vault key ID for transparent data encryption."
  type        = string
  default     = null
}

variable "zone_redundant" {
  description = "Whether the database is zone redundant."
  type        = bool
  default     = true
}
