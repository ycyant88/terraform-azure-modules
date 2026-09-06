variable "active_directory_administrator" {
  description = "- login_username - (Required) The login name of the principal to set as the Managed Instance Administrator.\n- object_id - (Required) The Object ID of the principal to set as the Managed Instance Administrator.\n- principal_type - (Required) The type of the principal. Possible values are Application, Group, and User.\n- tenant_id - (Required) The Azure Active Directory Tenant ID.\n"
  type = object({
    login_username = optional(string)
    object_id      = optional(string)
    principal_type = optional(string)
    tenant_id      = optional(string)
  })
  default = {}
}

variable "administrator_login" {
  description = "(Required) The administrator login name for the new SQL Managed Instance. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "administrator_login_password" {
  description = "(Required) The password associated with the administrator_login user. Needs to comply with Azure's [Password Policy](https://msdn.microsoft.com/library/ms161959.aspx)"
  type        = string
  default     = ""
}

variable "advanced_threat_protection_enabled" {
  description = "(Optional) Whether to enabled Defender for SQL Advanced Threat Protection."
  type        = bool
  default     = true
}

variable "collation" {
  description = "(Optional) Specifies how the SQL Managed Instance will be collated. Default value is SQL_Latin1_General_CP1_CI_AS. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "databases" {
  description = "- name - (Required) The name of the Managed Database to create. Changing this forces a new resource to be created.\n- short_term_retention_days - (Optional) The backup retention period in days. This is how many days Point-in-Time Restore will be supported.\n- tags - (Optional) A mapping of tags to assign to the managed database.\n\n---\nlong_term_retention_policy block supports the following:\n- monthly_retention - (Optional) The monthly retention policy for an LTR backup in an ISO 8601 format. Valid value is between 1 to 120 months. e.g. P1Y, P1M, P4W or P30D.\n- week_of_year - (Optional) The week of year to take the yearly backup. Value has to be between 1 and 52.\n- weekly_retention - (Optional) The weekly retention policy for an LTR backup in an ISO 8601 format. Valid value is between 1 to 520 weeks. e.g. P1Y, P1M, P1W or P7D.\n- yearly_retention - (Optional) The yearly retention policy for an LTR backup in an ISO 8601 format. Valid value is between 1 to 10 years. e.g. P1Y, P12M, P52W or P365D.\n\n---\npoint_in_time_restore block supports the following:\n- restore_point_in_time - (Required) The point in time for the restore from source_database_id. Changing this forces a new resource to be created.\n- source_database_id - (Required) The source database id that will be used to restore from. Changing this forces a new resource to be created.\n\n---\ntimeouts block supports the following:\n- create - (Defaults to 30 minutes) Used when creating the Mssql Managed Database.\n- delete - (Defaults to 30 minutes) Used when deleting the Mssql Managed Database.\n- read - (Defaults to 5 minutes) Used when retrieving the Mssql Managed Database.\n- update - (Defaults to 30 minutes) Used when updating the Mssql Managed Database.\n"
  type = map(object({
    name                      = string
    short_term_retention_days = optional(number)
    tags                      = optional(map(string))
    long_term_retention_policy = optional(object({
      monthly_retention = optional(string)
      week_of_year      = optional(number)
      weekly_retention  = optional(string)
      yearly_retention  = optional(string)
    }))
    point_in_time_restore = optional(object({
      restore_point_in_time = string
      source_database_id    = string
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
  default = {}
}

variable "diagnostic_settings" {
  description = "A map of diagnostic settings to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.\n- log_categories - (Optional) A set of log categories to send to the log analytics workspace. Defaults to [].\n- log_groups - (Optional) A set of log groups to send to the log analytics workspace. Defaults to [\"allLogs\"].\n- metric_categories - (Optional) A set of metric categories to send to the log analytics workspace. Defaults to [\"AllMetrics\"].\n- log_analytics_destination_type - (Optional) The destination type for the diagnostic setting. Possible values are Dedicated and AzureDiagnostics. Defaults to Dedicated.\n- workspace_resource_id - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.\n- storage_account_resource_id - (Optional) The resource ID of the storage account to send logs and metrics to.\n- event_hub_authorization_rule_resource_id - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.\n- event_hub_name - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.\n- marketplace_partner_resource_id - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic LogsLogs.\n"
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

variable "dns_zone_partner_id" {
  description = "(Optional) The ID of the SQL Managed Instance which will share the DNS zone. This is a prerequisite for creating an azurerm_mssql_managed_instance_failover_group. Setting this after creation forces a new resource to be created."
  type        = string
  default     = null
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "failover_group" {
  description = "\nMap of failover groups.  There can only be one failover group in the map.\n\n - location - (Required) The Azure Region where the Managed Instance Failover Group should exist. Changing this forces a new resource to be created.\n - name - (Required) The name which should be used for this Managed Instance Failover Group. Changing this forces a new resource to be created.\n - partner_managed_instance_id - (Required) The ID of the Azure SQL Managed Instance which will be replicated to. Changing this forces a new resource to be created.\n - readonly_endpoint_failover_policy_enabled - (Optional) Failover policy for the read-only endpoint. Defaults to true.\n\n ---\n read_write_endpoint_failover_policy block supports the following:\n - grace_minutes - (Optional) Applies only if mode is Automatic. The grace period in minutes before failover with data loss is attempted.\n - mode - (Required) The failover mode. Possible values are Automatic or Manual.\n\n ---\n timeouts block supports the following:\n - create - (Defaults to 30 minutes) Used when creating the Managed Instance Failover Group.\n - delete - (Defaults to 30 minutes) Used when deleting the Managed Instance Failover Group.\n - read - (Defaults to 5 minutes) Used when retrieving the Managed Instance Failover Group.\n - update - (Defaults to 30 minutes) Used when updating the Managed Instance Failover Group.\n"
  type = map(object({
    location                                  = optional(string)
    name                                      = optional(string)
    partner_managed_instance_id               = optional(string)
    readonly_endpoint_failover_policy_enabled = optional(bool)
    read_write_endpoint_failover_policy = optional(object({
      grace_minutes = optional(number)
      mode          = optional(string)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
  default = {}
}

variable "is_general_purpose_v2" {
  description = "(Optional) Whether or not this is a GPv2 (Next-gen General Purpose) variant of General Purpose edition.\n\nNext-gen General Purpose offers:\n- Up to 500 databases per instance and max 32 TB storage\n- 3 free IOPS per GB of storage\n- Independent scaling of vCores, memory, storage, and IOPS\n- Uses Elastic SAN for improved performance\n\nNote: Zone redundancy is not available for GPv2. Only available for General Purpose tier.\n\nSee: https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/service-tiers-next-gen-general-purpose-use\n\nDefaults to false.\n"
  type        = bool
  default     = false
}

variable "license_type" {
  description = "(Required) What type of license the Managed Instance will use. Possible values are LicenseIncluded and BasePrice."
  type        = string
  default     = ""
}

variable "location" {
  description = "Azure region where the resource should be deployed."
  type        = string
  default     = ""
}

variable "lock" {
  description = "Controls the Resource Lock configuration for this resource. The following properties can be specified:\n\n- kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n- name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n"
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "maintenance_configuration_name" {
  description = "(Optional) The name of the Public Maintenance Configuration window to apply to the SQL Managed Instance. Valid values include SQL_Default or an Azure Location in the format SQL_{Location}_MI_{Size}(for example SQL_EastUS_MI_1). Defaults to SQL_Default."
  type        = string
  default     = null
}

variable "managed_identities" {
  description = "Controls the Managed Identity configuration on this resource. The following properties can be specified:\n\n- system_assigned - (Optional) Specifies if the System Assigned Managed Identity should be enabled.\n- user_assigned_resource_ids - (Optional) Specifies a list of User Assigned Managed Identity resource IDs to be assigned to this resource.\n"
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default = {}
}

variable "memory_size_in_gb" {
  description = "(Optional) Memory size in GB for the SQL Managed Instance.\n\nAllows flexible memory allocation, particularly useful for Next-gen General Purpose (GPv2) instances.\nThis is an improvement over standard General Purpose which has fixed memory allocation based on vCores.\n\nFlexible memory is currently available to locally redundant instances on premium-series hardware.\n\nSee: https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/resource-limits#flexible-memory\n\nDefaults to null (uses Azure's default based on vCores).\n"
  type        = number
  default     = null
}

variable "minimum_tls_version" {
  description = "(Optional) The Minimum TLS Version. Default value is 1.2 Valid values include 1.0, 1.1, 1.2."
  type        = string
  default     = "1.2"
}

variable "name" {
  description = "The name of the this resource."
  type        = string
  default     = ""
}

variable "private_endpoints" {
  description = "A map of private endpoints to create on this resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (Optional) The name of the private endpoint. One will be generated if not set.\n- role_assignments - (Optional) A map of role assignments to create on the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time. See var.role_assignments for more information.\n- lock - (Optional) The lock level to apply to the private endpoint. Default is None. Possible values are None, CanNotDelete, and ReadOnly.\n- tags - (Optional) A mapping of tags to assign to the private endpoint.\n- subnet_resource_id - The resource ID of the subnet to deploy the private endpoint in.\n- private_dns_zone_group_name - (Optional) The name of the private DNS zone group. One will be generated if not set.\n- private_dns_zone_resource_ids - (Optional) A set of resource IDs of private DNS zones to associate with the private endpoint. If not set, no zone groups will be created and the private endpoint will not be associated with any private DNS zones. DNS records must be managed external to this module.\n- application_security_group_resource_ids - (Optional) A map of resource IDs of application security groups to associate with the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n- private_service_connection_name - (Optional) The name of the private service connection. One will be generated if not set.\n- network_interface_name - (Optional) The name of the network interface. One will be generated if not set.\n- location - (Optional) The Azure location where the resources will be deployed. Defaults to the location of the resource group.\n- resource_group_name - (Optional) The resource group where the resources will be deployed. Defaults to the resource group of this resource.\n- ip_configurations - (Optional) A map of IP configurations to create on the private endpoint. If not specified the platform will create one. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  - name - The name of the IP configuration.\n  - private_ip_address - The private IP address of the IP configuration.\n"
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

variable "proxy_override" {
  description = "(Optional) Specifies how the SQL Managed Instance will be accessed. Default value is Default. Valid values include Default, Proxy, and Redirect."
  type        = string
  default     = "Default"
}

variable "public_data_endpoint_enabled" {
  description = "(Optional) Is the public data endpoint enabled? Default value is false."
  type        = bool
  default     = null
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "retry" {
  description = "The AzAPI resource retry configuration, per resource type.\nWill retry up to the resource timeout, see var.timeout.\n\nEach resource has the following attributes:\n\n- error_message_regex - A list of regular expressions to match error messages for retrying the request.\n- interval_seconds - The interval in seconds between retry attempts.\n- max_interval_seconds - The maximum interval in seconds between retry attempts.\n"
  type = object({
    mssql_managed_instance_security_alert_policy = optional(object({
      error_message_regex = optional(list(string), [
        "SqlServerAlertPolicyInProgress", # see #54
      ])
      interval_seconds     = optional(number)
      max_interval_seconds = optional(number)
    }), null)
    sql_managed_instance_patch_identities = optional(object({
      error_message_regex = optional(list(string), [
        "ConflictingServerOperation", # see #54
      ])
      interval_seconds     = optional(number)
      max_interval_seconds = optional(number)
    }), null)
    sql_advanced_threat_protection = optional(object({
      error_message_regex  = optional(list(string))
      interval_seconds     = optional(number)
      max_interval_seconds = optional(number)
    }), null)
  })
  default = {}
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

variable "security_alert_policy" {
  description = "- disabled_alerts - (Optional) Specifies an array of alerts that are disabled. Possible values are Sql_Injection, Sql_Injection_Vulnerability, Access_Anomaly, Data_Exfiltration, Unsafe_Action and Brute_Force.\n- email_account_admins_enabled - (Optional) Boolean flag which specifies if the alert is sent to the account administrators or not. Defaults to false.\n- email_addresses - (Optional) Specifies an array of email addresses to which the alert is sent.\n- enabled - (Optional) Specifies the state of the Security Alert Policy, whether it is enabled or disabled. Possible values are true, false.\n- retention_days - (Optional) Specifies the number of days to keep in the Threat Detection audit logs. Defaults to 0.\n- storage_account_access_key - (Optional) Specifies the identifier key of the Threat Detection audit storage account. This is mandatory when you use storage_endpoint to specify a storage account blob endpoint.\n- storage_endpoint - (Optional) Specifies the blob storage endpoint (e.g. https://example.blob.core.windows.net). This blob storage will hold all Threat Detection audit logs.\n\n---\ntimeouts block supports the following:\n- create - (Defaults to 30 minutes) Used when creating the MS SQL Managed Instance Security Alert Policy.\n- delete - (Defaults to 30 minutes) Used when deleting the MS SQL Managed Instance Security Alert Policy.\n- read - (Defaults to 5 minutes) Used when retrieving the MS SQL Managed Instance Security Alert Policy.\n- update - (Defaults to 30 minutes) Used when updating the MS SQL Managed Instance Security Alert Policy.\n"
  type = object({
    disabled_alerts              = optional(set(string))
    email_account_admins_enabled = optional(bool)
    email_addresses              = optional(set(string))
    enabled                      = optional(bool)
    retention_days               = optional(number)
    storage_account_access_key   = optional(string)
    storage_endpoint             = optional(string)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  })
  default = {}
}

variable "service_principal_enabled" {
  description = "(Optional) Whether to enable the system-assigned service principal for the SQL Managed Instance.\n\nThis is required for Windows Authentication for Microsoft Entra principals using Kerberos.\n\nSee: https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/winauth-azuread-kerberos-managed-instance\n\nDefaults to false.\n"
  type        = bool
  default     = false
}

variable "sku_name" {
  description = "(Required) Specifies the SKU Name for the SQL Managed Instance. Valid values include GP_Gen4, GP_Gen5, GP_Gen8IM, GP_Gen8IH, BC_Gen4, BC_Gen5, BC_Gen8IM or BC_Gen8IH."
  type        = string
  default     = ""
}

variable "storage_account_resource_id" {
  description = "(Optional) Storage Account to store vulnerability assessments.\n\nThe System Assigned Managed Identity will be granted Storage Blob Data Contributor over this storage account.\n\nNote these limitations documented in Microsoft Learn - <https://learn.microsoft.com/en-us/azure/azure-sql/database/sql-database-vulnerability-assessment-storage?view=azuresql#store-va-scan-results-for-azure-sql-managed-instance-in-a-storage-account-that-can-be-accessed-behind-a-firewall-or-vnet>\n\n* User Assigned MIs are not supported\n* The storage account firewall public network access must be allowed.  If \"Enabled from selected virtual networks and IP addresses\" is set (recommended), the SQL MI subnet ID must be added to the storage account firewall.\n\n"
  type        = string
  default     = null
}

variable "storage_account_type" {
  description = "(Optional) Specifies the storage account type used to store backups for this database. Changing this forces a new resource to be created. Possible values are GRS, LRS and ZRS. Defaults to GRS."
  type        = string
  default     = "ZRS"
}

variable "storage_iops" {
  description = "(Optional) Storage IOps for the SQL Managed Instance.\n\nMinimum value: 300. Maximum value: 80000. Increments of 1 IOps allowed.\nMaximum value depends on the selected hardware family and number of vCores.\n\nFor Next-gen General Purpose (GPv2), you receive 3 free IOPS per GB of reserved storage.\nExample: A 1,024 GB instance receives 3,072 IOPS for free.\n\nSee: https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/resource-limits\n\nDefaults to null (uses Azure's default based on storage and vCores).\n"
  type        = number
  default     = null
}

variable "storage_size_in_gb" {
  description = "(Required) Maximum storage space for the SQL Managed instance. This should be a multiple of 32 (GB)."
  type        = number
  default     = ""
}

variable "subnet_id" {
  description = "(Required) The subnet resource id that the SQL Managed Instance will be associated with. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "timeout" {
  description = "The resource-specific timeout configuration.\nValues are a valid timespan, e.g. 1m, 30s, 5m30s.\n"
  type = object({
    mssql_managed_instance_security_alert_policy = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }), {})
    sql_managed_instance_patch_identities = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }), {})
    sql_advanced_threat_protection = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }), {})
  })
  default = {}
}

variable "timeouts" {
  description = "- create - (Defaults to 24 hours) Used when creating the Microsoft SQL Managed Instance.\n- delete - (Defaults to 24 hours) Used when deleting the Microsoft SQL Managed Instance.\n- read - (Defaults to 5 minutes) Used when retrieving the Microsoft SQL Managed Instance.\n- update - (Defaults to 24 hours) Used when updating the Microsoft SQL Managed Instance.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}

variable "timezone_id" {
  description = "(Optional) The TimeZone ID that the SQL Managed Instance will be operating in. Default value is UTC. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "transparent_data_encryption" {
  description = "- auto_rotation_enabled - (Optional) When enabled, the SQL Managed Instance will continuously check the key vault for any new versions of the key being used as the TDE protector. If a new version of the key is detected, the TDE protector on the SQL Managed Instance will be automatically rotated to the latest key version within 60 minutes.\n- key_vault_key_id - (Optional) To use customer managed keys from Azure Key Vault, provide the AKV Key ID. To use service managed keys, omit this field.\n\n---\ntimeouts block supports the following:\n- create - (Defaults to 30 minutes) Used when creating the MSSQL.\n- delete - (Defaults to 30 minutes) Used when deleting the MSSQL.\n- read - (Defaults to 5 minutes) Used when retrieving the MSSQL.\n- update - (Defaults to 30 minutes) Used when updating the MSSQL.\n"
  type = object({
    auto_rotation_enabled = optional(bool)
    key_vault_key_id      = optional(string)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  })
  default = {}
}

variable "vcores" {
  description = "(Required) Number of cores that should be assigned to the SQL Managed Instance. Values can be 8, 16, or 24 for Gen4 SKUs, or 4, 6, 8, 10, 12, 16, 20, 24, 32, 40, 48, 56, 64, 80, 96 or 128 for Gen5 SKUs."
  type        = number
  default     = ""
}

variable "vulnerability_assessment" {
  description = "- storage_account_access_key - (Optional) Specifies the identifier key of the storage account for vulnerability assessment scan results. If storage_container_sas_key isn't specified, storage_account_access_key is required.  Set to null if the storage account is protected by a resource firewall.\n- storage_container_path - (Required) A blob storage container path to hold the scan results (e.g. <https://myStorage.blob.core.windows.net/VaScans/>).\n- storage_container_sas_key - (Optional) A shared access signature (SAS Key) that has write access to the blob container specified in storage_container_path parameter. If storage_account_access_key isn't specified, storage_container_sas_key is required.  Set to null if the storage account is protected by a resource firewall.\n\n---\nrecurring_scans block supports the following:\n- email_subscription_admins - (Optional) Boolean flag which specifies if the schedule scan notification will be sent to the subscription administrators. Defaults to true.\n- emails - (Optional) Specifies an array of e-mail addresses to which the scan notification is sent.\n- enabled - (Optional) Boolean flag which specifies if recurring scans is enabled or disabled. Defaults to false.\n\n---\ntimeouts block supports the following:\n- create - (Defaults to 60 minutes) Used when creating the Vulnerability Assessment.\n- delete - (Defaults to 60 minutes) Used when deleting the Vulnerability Assessment.\n- read - (Defaults to 5 minutes) Used when retrieving the Vulnerability Assessment.\n- update - (Defaults to 60 minutes) Used when updating the Vulnerability Assessment.\n"
  type = object({
    storage_account_access_key = optional(string)
    storage_container_path     = optional(string)
    storage_container_sas_key  = optional(string)
    recurring_scans = optional(object({
      email_subscription_admins = optional(bool)
      emails                    = optional(list(string))
      enabled                   = optional(bool)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  })
  default = null
}

variable "zone_redundant_enabled" {
  description = "(Optional) If true, the SQL Managed Instance will be deployed with zone redundancy.  Defaults to true."
  type        = bool
  default     = true
}
