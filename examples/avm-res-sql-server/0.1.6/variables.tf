variable "administrator_login" {
  description = "(Optional) The administrator login name for the new server. Required unless azuread_authentication_only in the azuread_administrator block is true. When omitted, Azure will generate a default username which cannot be subsequently changed. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "administrator_login_password" {
  description = "(Optional) The password associated with the administrator_login user. Needs to comply with Azure's [Password Policy](https://msdn.microsoft.com/library/ms161959.aspx). Required unless azuread_authentication_only in the azuread_administrator block is true."
  type        = string
  default     = null
}

variable "azuread_administrator" {
  description = "- azuread_authentication_only - (Optional) Specifies whether only AD Users and administrators (e.g. azuread_administrator[0].login_username) can be used to login, or also local database users (e.g. administrator_login). When true, the administrator_login and administrator_login_password properties can be omitted.\n- login_username - (Required) The login username of the Azure AD Administrator of this SQL Server.\n- object_id - (Required) The object id of the Azure AD Administrator of this SQL Server.\n- tenant_id - (Optional) The tenant id of the Azure AD Administrator of this SQL Server.\n"
  type = object({
    azuread_authentication_only = optional(bool)
    login_username              = string
    object_id                   = string
    tenant_id                   = optional(string)
  })
  default = null
}

variable "connection_policy" {
  description = "(Optional) The connection policy the server will use. Possible values are Default, Proxy, and Redirect. Defaults to Default."
  type        = string
  default     = null
}

variable "databases" {
  description = "A map of objects used to describe any databases that are being created.  The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (required) The name to use for the database\n- auto_pause_delay_in_minutes - (Optional) - Time in minutes after which database is automatically paused.  A value of -1 means that automatic pause is disabled.  This property is only settable for Serverless databases.\n- create_mode - (Optional) - The create mode of the database. Possible values are Copy, Default, OnlineSecondary, PointInTimeRestore, Recovery, Restore, RestoreExternalBackup, RestoreExternalBackupSecondary, RestoreLongTermRetentionBackup, and Secondary.  Mutually exclusive with import.  Changing this forces a new resource to be created.  Defaults to Default.\n- elastic_pool_key - (Optional) - The map key of the elastic pool containing this database.\n- geo_backup_enabled - (Optional) - A boolean that specifies if the Geo Backup Policy is enabled. Default to true.\n- maintenance_configuration_name -  (Optional) The name of the Public Maintenance Configuration window to apply to the database. Valid values include SQL_Default, SQL_EastUS_DB_1, SQL_EastUS2_DB_1, SQL_SoutheastAsia_DB_1, SQL_AustraliaEast_DB_1, SQL_NorthEurope_DB_1, SQL_SouthCentralUS_DB_1, SQL_WestUS2_DB_1, SQL_UKSouth_DB_1, SQL_WestEurope_DB_1, SQL_EastUS_DB_2, SQL_EastUS2_DB_2, SQL_WestUS2_DB_2, SQL_SoutheastAsia_DB_2, SQL_AustraliaEast_DB_2, SQL_NorthEurope_DB_2, SQL_SouthCentralUS_DB_2, SQL_UKSouth_DB_2, SQL_WestEurope_DB_2, SQL_AustraliaSoutheast_DB_1, SQL_BrazilSouth_DB_1, SQL_CanadaCentral_DB_1, SQL_CanadaEast_DB_1, SQL_CentralUS_DB_1, SQL_EastAsia_DB_1, SQL_FranceCentral_DB_1, SQL_GermanyWestCentral_DB_1, SQL_CentralIndia_DB_1, SQL_SouthIndia_DB_1, SQL_JapanEast_DB_1, SQL_JapanWest_DB_1, SQL_NorthCentralUS_DB_1, SQL_UKWest_DB_1, SQL_WestUS_DB_1, SQL_AustraliaSoutheast_DB_2, SQL_BrazilSouth_DB_2, SQL_CanadaCentral_DB_2, SQL_CanadaEast_DB_2, SQL_CentralUS_DB_2, SQL_EastAsia_DB_2, SQL_FranceCentral_DB_2, SQL_GermanyWestCentral_DB_2, SQL_CentralIndia_DB_2, SQL_SouthIndia_DB_2, SQL_JapanEast_DB_2, SQL_JapanWest_DB_2, SQL_NorthCentralUS_DB_2, SQL_UKWest_DB_2, SQL_WestUS_DB_2, SQL_WestCentralUS_DB_1, SQL_FranceSouth_DB_1, SQL_WestCentralUS_DB_2, SQL_FranceSouth_DB_2, SQL_SwitzerlandNorth_DB_1, SQL_SwitzerlandNorth_DB_2, SQL_BrazilSoutheast_DB_1, SQL_UAENorth_DB_1, SQL_BrazilSoutheast_DB_2, SQL_UAENorth_DB_2. Defaults to SQL_Default.\n- ledger_enabled - (Optional) - A boolean that specifies if this is a ledger database. Defaults to false. Changing this forces a new resource to be created.\n- license_type - (Optional) - Specifies the license type applied to this database. Possible values are LicenseIncluded and BasePrice.\n- max_size_gb - (Optional) - The max size of the database in gigabytes.\n- min_capacity - (Optional) - Minimal capacity that database will always have allocated, if not paused. This property is only settable for Serverless databases.\n- restore_point_in_time - (Optional) - Specifies the point in time (ISO8601 format) of the source database that will be restored to create the new database. This property is only settable for create_mode = PointInTimeRestore databases.\n- recover_database_id - (Optional) - The ID of the database to be recovered. This property is only applicable when the create_mode is Recovery.\n- restore_dropped_database_id - (Optional) - The ID of the database to be restored. This property is only applicable when the create_mode is Restore.\n- read_replica_count - (Optional) - The number of readonly secondary replicas associated with the database to which readonly application intent connections may be routed. This property is only settable for Hyperscale edition databases.\n- read_scale - (Optional) - If enabled, connections that have application intent set to readonly in their connection string may be routed to a readonly secondary replica. This property is only settable for Premium and Business Critical databases.\n- sample_name - (Optional) - Specifies the name of the sample schema to apply when creating this database. Possible value is AdventureWorksLT.\n- sku_name - (Optional) - Specifies the name of the SKU used by the database. For example, GP_S_Gen5_2,HS_Gen4_1,BC_Gen5_2, ElasticPool, Basic,S0, P2 ,DW100c, DS100. Changing this from the HyperScale service tier to another service tier will create a new resource.\n- storage_account_type - (Optional) -Specifies the storage account type used to store backups for this database. Possible values are Geo, GeoZone, Local and Zone. Defaults to Geo.\n- transparent_data_encryption_enabled - If set to true, Transparent Data Encryption will be enabled on the database. Defaults to true. transparent_data_encryption_enabled can only be set to false on DW (e.g, DataWarehouse) server SKUs.\n- zone_redundant - Whether or not this database is zone redundant, which means the replicas of this database will be spread across multiple availability zones. This property is only settable for Premium and Business Critical databases.\n\n- import - (Optional(object({\n  - storage_uri - (Required) - Specifies the blob URI of the .bacpac file.\n  - storage_key - (Required) - Specifies the access key for the storage account.\n  - storage_key_type - (Required) - Specifies the type of access key for the storage account. Valid values are StorageAccessKey or SharedAccessKey.\n  - administrator_login - (Required) - Specifies the name of the SQL administrator.\n  - administrator_login_password - (Required) - Specifies the password of the SQL administrator.\n  - authentication_type - (Required) - Specifies the type of authentication used to access the server. Valid values are SQL or ADPassword.\n  - storage_account_id - (Optional) - The resource id for the storage account used to store BACPAC file. If set, private endpoint connection will be created for the storage account. Must match storage account used for storage_uri parameter.\n\n- long_term_retention_policy - (Optional(object({\n  - weekly_retention - (Optional) - The weekly retention policy for an LTR backup in an ISO 8601 format. Valid value is between 1 to 520 weeks. e.g. P1Y, P1M, P1W or P7D.\n  - monthly_retention - (Optional) - The monthly retention policy for an LTR backup in an ISO 8601 format. Valid value is between 1 to 120 months. e.g. P1Y, P1M, P4W or P30D.\n  - yearly_retention - (Optional) - The yearly retention policy for an LTR backup in an ISO 8601 format. Valid value is between 1 to 10 years. e.g. P1Y, P12M, P52W or P365D.\n  - week_of_year - (Optional) - The week of year to take the yearly backup. Value has to be between 1 and 52.\n\n- short_term_retention_policy - (Optional(object({\n  - retention_days - (Required) - Point In Time Restore configuration. Value has to be between 1 and 35.\n  - backup_interval_in_hours - (Optional) - The hours between each differential backup. This is only applicable to live databases but not dropped databases. Value has to be 12 or 24. Defaults to 12 hours.\n\n- threat_detection_policy - (Optional(object({\n  - state - (Optional) - The State of the Policy. Possible values are Enabled or Disabled. Defaults to Disabled.\n  - disabled_alerts - (Optional) - Specifies a list of alerts which should be disabled. Possible values include Access_Anomaly, Sql_Injection and Sql_Injection_Vulnerability.\n  - email_account_admins - (Optional) - Should the account administrators be emailed when this alert is triggered? Possible values are Enabled or Disabled. Defaults to Disabled.\n  - email_addresses - (Optional) - A list of email addresses which alerts should be sent to.\n  - retention_days - (Optional) - Specifies the number of days to keep in the Threat Detection audit logs.\n  - storage_account_access_key - (Optional) - (Optional) Specifies the identifier key of the Threat Detection audit storage account. Required if state is Enabled.\n  - storage_endpoint - (Optional) - Specifies the blob storage endpoint (e.g. https://example.blob.core.windows.net). This blob storage will hold all Threat Detection audit logs. Required if state is Enabled.\n\n- role_assignments - (Optional(map(object({\n  - role_definition_id_or_name - (Required) - The ID or Name of the Role Definition to assign.\n  - principal_id - (Required) - The ID of the Principal to assign the Role Definition to.\n  - description - (Optional) - A description of the Role Assignment.\n  - skip_service_principal_aad_check - (Optional) - Should the AAD check for Service Principals be skipped? Defaults to false.\n  - condition - (Optional) - The condition of the Role Assignment.\n  - condition_version - (Optional) - The condition version of the Role Assignment.\n  - delegated_managed_identity_resource_id - (Optional) - The Resource ID of the Delegated Managed Identity.\n  - principal_type - (Optional) - The type of the Principal. Possible values are User, Group, ServicePrincipal or DirectoryRoleTemplate.\n\n- lock - (Optional(object({\n  - kind - (Required) - The kind of lock. Possible values are ReadOnly and CanNotDelete.\n  - name - (Optional) - The name of the lock.\n\n- diagnostic_settings - (Optional(map(object({\n  - name - (Optional) - The name of the Diagnostic Setting.\n  - event_hub_authorization_rule_id - (Optional) - The ID of the Event Hub Authorization Rule.\n  - event_hub_name - (Optional) - The name of the Event Hub.\n  - log_analytics_destination_type - (Optional) - The type of the Log Analytics Destination. Possible values are Dedicated and Shared.\n  - log_analytics_workspace_id - (Optional) - The ID of the Log Analytics Workspace.\n  - marketplace_partner_resource_id - (Optional) - The ID of the Marketplace Partner Resource.\n  - storage_account_resource_id - (Optional) - The ID of the Storage Account.\n  - log_categories - (Optional) - A list of log categories to send to the destination.\n  - log_groups - (Optional) - A list of log groups to send to the destination.\n\n- managed_identities - (Optional(object({\n  - system_assigned - (Optional) - Is the system assigned managed identity enabled? Defaults to false.\n  - user_assigned_resource_ids - (Optional) - A list of User Assigned Managed Identity Resource IDs.\n\n- tags - Optional - Map of strings for use in tagging this specific object\n\nEXAMPLE INPUT:\n\ndatabases = {\n  example_database = {\n    name = \"example_database\"\n    long_term_retention_policy = {\n      weekly_retention = \"P1W\"\n    }\n    short_term_retention_policy = {\n      retention_days = 35\n      backup_interval_in_hours = 24\n    }\n  }\n}\n\n"
  type = map(object({
    name                                                       = string
    auto_pause_delay_in_minutes                                = optional(number)
    create_mode                                                = optional(string, "Default")
    collation                                                  = optional(string)
    elastic_pool_key                                           = optional(string)
    geo_backup_enabled                                         = optional(bool, true)
    maintenance_configuration_name                             = optional(string)
    ledger_enabled                                             = optional(bool, false)
    license_type                                               = optional(string)
    max_size_gb                                                = optional(number)
    min_capacity                                               = optional(number)
    restore_point_in_time                                      = optional(string)
    recover_database_id                                        = optional(string)
    restore_dropped_database_id                                = optional(string)
    read_replica_count                                         = optional(number)
    read_scale                                                 = optional(bool)
    sample_name                                                = optional(string)
    sku_name                                                   = optional(string)
    storage_account_type                                       = optional(string, "Geo")
    transparent_data_encryption_enabled                        = optional(bool, true)
    transparent_data_encryption_key_vault_key_id               = optional(string)
    transparent_data_encryption_key_automatic_rotation_enabled = optional(bool)
    zone_redundant                                             = optional(bool)

    import = optional(object({
      storage_uri                  = string
      storage_key                  = string
      storage_key_type             = string
      administrator_login          = string
      administrator_login_password = string
      authentication_type          = string
      storage_account_id           = optional(string)
    }))

    long_term_retention_policy = optional(object({
      weekly_retention  = string
      monthly_retention = string
      yearly_retention  = string
      week_of_year      = number
    }))

    short_term_retention_policy = optional(object({
      retention_days           = number
      backup_interval_in_hours = optional(number, 12)
    }))

    threat_detection_policy = optional(object({
      state                      = optional(string, "Disabled")
      disabled_alerts            = optional(list(string))
      email_account_admins       = optional(string, "Disabled")
      email_addresses            = optional(list(string))
      retention_days             = optional(number)
      storage_account_access_key = optional(string)
      storage_endpoint           = optional(string)
    }))

    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
      principal_type                         = optional(string, null)
    })))

    lock = optional(object({
      kind = string
      name = optional(string, null)
    }))

    diagnostic_settings = optional(map(object({
      name                                     = optional(string, null)
      event_hub_authorization_rule_resource_id = optional(string, null)
      event_hub_name                           = optional(string, null)
      log_analytics_destination_type           = optional(string, null)
      workspace_resource_id                    = optional(string, null)
      marketplace_partner_resource_id          = optional(string, null)
      storage_account_resource_id              = optional(string, null)
      log_categories                           = optional(list(string))
      log_groups                               = optional(list(string))
      metric_categories                        = optional(list(string))
    })))

    managed_identities = optional(object({
      system_assigned            = optional(bool, false)
      user_assigned_resource_ids = optional(set(string), [])
    }))

    tags = optional(map(string))
  }))
  default = {}
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

variable "elastic_pools" {
  description = "A map of objects containing attributes for each Elastic Pool to be created.\n\n- name - (Required) Specifies the name of the Elastic Pool. Changing this forces a new resource to be created.\n- location - (Optional) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.\n\n- sku - (Optional) Specifies the SKU of the Elastic Pool. Changing this forces a new resource to be created.\n  - name - (Required) Specifies the name of the SKU. Changing this forces a new resource to be created.\n  - capacity - (Required) Specifies the capacity of the SKU. Changing this forces a new resource to be created.\n  - tier - (Required) Specifies the tier of the SKU. Changing this forces a new resource to be created.\n  - family - (Optional) Specifies the family of the SKU. Changing this forces a new resource to be created.\n\n- per_database_settings - (Optional) Specifies the per database settings for the Elastic Pool. Changing this forces a new resource to be created.\n  - min_capacity - (Required) Specifies the minimum capacity of the Elastic Pool. Changing this forces a new resource to be created.\n  - max_capacity - (Required) Specifies the maximum capacity of the Elastic Pool. Changing this forces a new resource to be created.\n\n- maintenance_configuration_name - (Optional) Specifies the name of the maintenance configuration to apply to this Elastic Pool. Changing this forces a new resource to be created.\n- zone_redundant - (Optional) Specifies whether or not this Elastic Pool is zone redundant. Changing this forces a new resource to be created.\n- license_type - (Optional) Specifies the license type for the Elastic Pool. Changing this forces a new resource to be created.\n- max_size_gb - (Optional) Specifies the maximum size of the Elastic Pool in gigabytes. Changing this forces a new resource to be created.\n- max_size_bytes - (Optional) Specifies the maximum size of the Elastic Pool in bytes. Changing this forces a new resource to be created.\n\n- role_assignments - (Optional) Specifies the role assignments for the Elastic Pool. Changing this forces a new resource to be created.\n  - role_definition_id_or_name - (Required) Specifies the ID or name of the role definition to assign to the principal.\n  - principal_id - (Required) Specifies the ID of the principal to assign the role to.\n  - description - (Optional) Specifies the description of the role assignment.\n  - skip_service_principal_aad_check - (Optional) Specifies whether or not to skip the service principal AAD check.\n  - condition - (Optional) Specifies the condition of the role assignment.\n  - condition_version - (Optional) Specifies the condition version of the role assignment.\n  - delegated_managed_identity_resource_id - (Optional) Specifies the delegated managed identity resource ID of the role assignment.\n  - principal_type - (Optional) Specifies the principal type of the role assignment.\n\n- lock - (Optional) Specifies the lock for the Elastic Pool. Changing this forces a new resource to be created.\n\n- diagnostic_settings - (Optional) Specifies the diagnostic settings for the Elastic Pool. Changing this forces a new resource to be created.\n  - name - (Optional) Specifies the name of the diagnostic setting.\n  - event_hub_authorization_rule_id - (Optional) Specifies the ID of the event hub authorization rule.\n  - event_hub_name - (Optional) Specifies the name of the event hub.\n  - log_analytics_destination_type - (Optional) Specifies the destination type of the log analytics.\n  - log_analytics_workspace_id - (Optional) Specifies the ID of the log analytics workspace.\n  - marketplace_partner_resource_id - (Optional) Specifies the ID of the marketplace partner resource.\n  - storage_account_resource_id - (Optional) Specifies the ID of the storage account.\n  - log_categories - (Optional) Specifies the log categories of the diagnostic setting.\n  - log_groups - (Optional) Specifies the log groups of the diagnostic setting.\n\n- tags - (Optional) A mapping of tags to assign to the resource.\n\n"
  type = map(object({
    name     = string
    location = optional(string)
    sku = optional(object({
      name     = string
      capacity = number
      tier     = string
      family   = optional(string)
    }))
    per_database_settings = optional(object({
      min_capacity = number
      max_capacity = number
    }))
    maintenance_configuration_name = optional(string, "SQL_Default")
    zone_redundant                 = optional(bool, "true")
    license_type                   = optional(string)
    max_size_gb                    = optional(number)
    max_size_bytes                 = optional(number)

    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
      principal_type                         = optional(string, null)
    })))

    lock = optional(object({
      kind = string
      name = optional(string, null)
    }))

    diagnostic_settings = optional(map(object({
      name                                     = optional(string, null)
      event_hub_authorization_rule_resource_id = optional(string, null)
      event_hub_name                           = optional(string, null)
      log_analytics_destination_type           = optional(string, null)
      workspace_resource_id                    = optional(string, null)
      marketplace_partner_resource_id          = optional(string, null)
      storage_account_resource_id              = optional(string, null)
      log_categories                           = optional(list(string))
      log_groups                               = optional(list(string))
      metric_categories                        = optional(list(string))
    })))

    tags = optional(map(string))
  }))
  default = {}
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "express_vulnerability_assessment_enabled" {
  description = "(Optional) Whether the Express Vulnerability Assessment feature is enabled for this server. Defaults to false."
  type        = bool
  default     = false
}

variable "firewall_rules" {
  description = "- end_ip_address - (Required) Specifies the End IP Address associated with this Firewall Rule.\n- start_ip_address - (Required) Specifies the Start IP Address associated with this Firewall Rule.\n\n---\ntimeouts block supports the following:\n- create - (Defaults to 30 minutes) Used when creating the MySQL Firewall Rule.\n- delete - (Defaults to 30 minutes) Used when deleting the MySQL Firewall Rule.\n- read - (Defaults to 5 minutes) Used when retrieving the MySQL Firewall Rule.\n- update - (Defaults to 30 minutes) Used when updating the MySQL Firewall Rule.\n"
  type = map(object({
    end_ip_address   = string
    start_ip_address = string
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
  default = {}
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

variable "managed_identities" {
  description = "  Controls the Managed Identity configuration on this resource. The following properties can be specified:\n\n  - system_assigned - (Optional) Specifies if the System Assigned Managed Identity should be enabled.\n  - user_assigned_resource_ids - (Optional) Specifies a list of User Assigned Managed Identity resource IDs to be assigned to this resource.\n"
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default = {}
}

variable "name" {
  description = "The name of the this resource."
  type        = string
  default     = null
}

variable "outbound_network_restriction_enabled" {
  description = "(Optional) Whether outbound network traffic is restricted for this server. Defaults to false."
  type        = bool
  default     = null
}

variable "primary_user_assigned_identity_id" {
  description = "(Optional) Specifies the primary user managed identity id. Required if type within the identity block is set to either SystemAssigned, UserAssigned or UserAssigned and should be set at same time as setting identity_ids."
  type        = string
  default     = null
}

variable "private_endpoints" {
  description = "  A map of private endpoints to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n  - name - (Optional) The name of the private endpoint. One will be generated if not set.\n  - role_assignments - (Optional) A map of role assignments to create on the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time. See var.role_assignments for more information.\n    - role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n    - principal_id - The ID of the principal to assign the role to.\n    - description - (Optional) The description of the role assignment.\n    - skip_service_principal_aad_check - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n    - condition - (Optional) The condition which will be used to scope the role assignment.\n    - condition_version - (Optional) The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\n    - delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\n    - principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n  - lock - (Optional) The lock level to apply to the private endpoint. Default is None. Possible values are None, CanNotDelete, and ReadOnly.\n    - kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n    - name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n  - tags - (Optional) A mapping of tags to assign to the private endpoint.\n  - subnet_resource_id - The resource ID of the subnet to deploy the private endpoint in.\n  - subresource_name - The name of the sub resource for the private endpoint.\n  - private_dns_zone_group_name - (Optional) The name of the private DNS zone group. One will be generated if not set.\n  - private_dns_zone_resource_ids - (Optional) A set of resource IDs of private DNS zones to associate with the private endpoint. If not set, no zone groups will be created and the private endpoint will not be associated with any private DNS zones. DNS records must be managed external to this module.\n  - application_security_group_resource_ids - (Optional) A map of resource IDs of application security groups to associate with the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  - private_service_connection_name - (Optional) The name of the private service connection. One will be generated if not set.\n  - network_interface_name - (Optional) The name of the network interface. One will be generated if not set.\n  - location - (Optional) The Azure location where the resources will be deployed. Defaults to the location of the resource group.\n  - resource_group_name - (Optional) The resource group where the resources will be deployed. Defaults to the resource group of the Key Vault.\n  - ip_configurations - (Optional) A map of IP configurations to create on the private endpoint. If not specified the platform will create one. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n    - name - The name of the IP configuration.\n    - private_ip_address - The private IP address of the IP configuration.\n"
  type = map(object({
    name = optional(string, null)
    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
      principal_type                         = optional(string, null)
    })), {})
    lock = optional(object({
      kind = string
      name = optional(string, null)
    }), null)
    tags                                    = optional(map(string), null)
    subnet_resource_id                      = string
    subresource_name                        = string # NOTE: `subresource_name` can be excluded if the resource does not support multiple sub resource types (e.g. storage account supports blob, queue, etc)
    private_dns_zone_group_name             = optional(string, "default")
    private_dns_zone_resource_ids           = optional(set(string), [])
    application_security_group_associations = optional(map(string), {})
    private_service_connection_name         = optional(string, null)
    network_interface_name                  = optional(string, null)
    location                                = optional(string, null)
    resource_group_name                     = optional(string, null)
    ip_configurations = optional(map(object({
      name               = string
      private_ip_address = string
    })), {})
  }))
  default = {}
}

variable "private_endpoints_manage_dns_zone_group" {
  description = "Whether to manage private DNS zone groups with this module. If set to false, you must manage private DNS zone groups externally, e.g. using Azure Policy."
  type        = bool
  default     = true
}

variable "public_network_access_enabled" {
  description = "(Optional) Whether public network access is allowed for this server. Defaults to false."
  type        = bool
  default     = false
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
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

variable "server_version" {
  description = "(Required) The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server). Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "transparent_data_encryption_key_vault_key_id" {
  description = "(Optional) The fully versioned Key Vault Key URL (e.g. 'https://<YourVaultName>.vault.azure.net/keys/<YourKeyName>/<YourKeyVersion>) to be used as the Customer Managed Key(CMK/BYOK) for the Transparent Data Encryption(TDE) layer."
  type        = string
  default     = null
}
