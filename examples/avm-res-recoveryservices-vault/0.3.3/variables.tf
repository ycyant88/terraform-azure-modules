variable "alerts_for_all_job_failures_enabled" {
  description = "(optional) Specify Setting for Monitoring 'Alerts for All Job Failures'. true (default), false"
  type        = bool
  default     = true
}

variable "alerts_for_critical_operation_failures_enabled" {
  description = "(optional) Specify Setting for Monitoring 'Alerts for Critical Operation Failures'. true (default), false"
  type        = bool
  default     = true
}

variable "backup_protected_file_share" {
  description = "A map of protected file shares to register with the Recovery Services Vault for backup. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- source_storage_account_id - (Required) The resource ID of the storage account containing the file share to protect.\n- backup_file_share_policy_name - (Required) The name of the file share backup policy to associate with this protected item.\n- source_file_share_name - (Required) The name of the file share within the storage account to protect.\n- disable_registration - (Optional) Whether to disable automatic storage account registration. Defaults to false.\n- sleep_timer - (Optional) Duration to sleep after creating the resource, to allow for Azure propagation. Defaults to \"60s\".\n\nExample Inputs:\nterraform\nbackup_protected_file_share = {\n  fileshare1 = {\n    source_storage_account_id     = \"/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-example/providers/Microsoft.Storage/storageAccounts/stexample\"\n    backup_file_share_policy_name = \"pol-rsv-fileshare-vault-001\"\n    source_file_share_name        = \"myfileshare\"\n    disable_registration          = false\n    sleep_timer                   = \"60s\"\n  }\n}\n\n"
  type = map(object({
    source_storage_account_id     = string
    backup_file_share_policy_name = string
    source_file_share_name        = string
    disable_registration          = optional(bool, false)
    sleep_timer                   = optional(string, "60s")

  }))
  default = null
}

variable "backup_protected_vm" {
  description = "A map of protected virtual machines to register with the Recovery Services Vault for backup. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- source_vm_id - (Required) The resource ID of the virtual machine to protect.\n- vm_backup_policy_name - (Required) The name of the VM backup policy to associate with this protected item.\n- sleep_timer - (Optional) Duration to sleep after creating the resource, to allow for Azure propagation. Defaults to \"60s\".\n\nExample Inputs:\nterraform\nbackup_protected_vm = {\n  vm1 = {\n    source_vm_id          = \"/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-example/providers/Microsoft.Compute/virtualMachines/vm-example\"\n    vm_backup_policy_name = \"pol-rsv-vm-vault-001\"\n    sleep_timer           = \"60s\"\n  }\n}\n\n"
  type = map(object({
    source_vm_id          = string
    vm_backup_policy_name = string
    sleep_timer           = optional(string, "60s")
  }))
  default = null
}

variable "classic_vmware_replication_enabled" {
  description = "(option) Specify Setting for Classic VMWare Replication. true, false"
  type        = bool
  default     = false
}

variable "cross_region_restore_enabled" {
  description = "(optional) Specify Cross Region Restore. true, false (default). var.storage_mode_type must GeoRedundant when setting to true"
  type        = bool
  default     = true
}

variable "customer_managed_key" {
  description = "An object type defines a customer managed key to use for encryption.\n\n- key_vault_resource_id - (Required) - The full Azure Resource ID of the key_vault where the customer managed key will be referenced from.\n- key_name - (Required) - The full Azur Resource ID of the customer managed Key stored in the key vault\n- key_version - (Optional) - Customer managed key version\n- user_assigned_identity - (Optional) - The user assigned identity to use when access the encryption key saved in a key vault\n\n\nExample Inputs:\nterraform\nkey_vault_resource_id = {\n  key_vault_resource_id = \"https://kv-giuh.vault.azure.net/keys/kvk-giuh/0127xxxxx4fdd94cdbd26481a1985\"\n  key_name  = \"https://kv-giuh.vault.azure.net/keys/kvk-giuh/0127xxxxx4fdd94cdbd26481a1985\"\n  version = null\n  user_assigned_identity = {\n    resource_id = \"/subscriptions/0000000-0000-0000-0000-000000000000/resourceGroups/rg-test/providers/Microsoft.ManagedIdentity/userAssignedIdentities/uai-name\"\n  }\n}\n\n"
  type = object({
    key_vault_resource_id = string
    key_name              = string
    key_version           = optional(string, null)
    user_assigned_identity = optional(object({
      resource_id = string
    }), null)
  })
  default = null
}

variable "diagnostic_settings" {
  description = "A map of diagnostic settings to create on the Recovery Services Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.\n- log_categories - (Optional) A set of log categories to send to the log analytics workspace. Defaults to [].\n- log_groups - (Optional) A set of log groups to send to the log analytics workspace. Defaults to [\"allLogs\"].\n- metric_categories - (Optional) A set of metric categories to send to the log analytics workspace. Defaults to [\"AllMetrics\"].\n- log_analytics_destination_type - (Optional) The destination type for the diagnostic setting. Possible values are Dedicated and AzureDiagnostics. Defaults to Dedicated.\n- workspace_resource_id - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.\n- storage_account_resource_id - (Optional) The resource ID of the storage account to send logs and metrics to.\n- event_hub_authorization_rule_resource_id - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.\n- event_hub_name - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.\n- marketplace_partner_resource_id - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send diagnostic logs.\n\nExample Inputs:\nterraform\ndiagnostic_settings = {\n  diag1 = {\n    name                  = \"diag-rsv-example\"\n    workspace_resource_id = \"/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-example/providers/Microsoft.OperationalInsights/workspaces/law-example\"\n    log_groups            = [\"allLogs\"]\n    metric_categories     = [\"AllMetrics\"]\n  }\n}\n\n"
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
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "file_share_backup_policy" {
  description = "A map of file share backup policies to create on the Recovery Services Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (Required) The name of the file share backup policy.\n- timezone - (Required) Specifies the timezone. [the possible values are defined here](https://jackstromberg.com/2017/01/list-of-time-zones-supported-by-azure/).\n- frequency - (Required) Sets the backup frequency. Possible values are Daily and Hourly.\n- retention_daily - (Optional) The number of daily backups to keep. Must be between 1 and 200.\n- backup - (Required) Backup schedule configuration.\n  - time - (Required) The time of day to perform the backup in 24-hour format HH:MM.\n  - hourly - (Optional) Hourly backup configuration, required when frequency is Hourly.\n    - interval - (Required) Interval in hours at which backup is triggered. Possible values are 4, 6, 8, and 12.\n    - start_time - (Required) Start time for the hourly backup window in 24-hour format HH:MM.\n    - window_duration - (Required) Duration of the backup window in hours. Possible values are 4, 6, 8, 12, and 24.\n- retention_weekly - (Optional) Weekly retention configuration.\n  - count - (Required) The number of weekly backups to keep. Must be between 1 and 9999.\n  - weekdays - (Required) The days of the week to retain backups. Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, or Saturday.\n- retention_monthly - (Optional) Monthly retention configuration.\n  - count - (Required) The number of monthly backups to keep. Must be between 1 and 9999.\n  - weekdays - (Optional) The weekday backups to retain. Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, or Saturday.\n  - weeks - (Optional) The weeks of the month to retain backups of. Must be one of First, Second, Third, Fourth, or Last.\n  - days - (Optional) The days of the month to retain backups of. Must be between 1 and 31.\n  - include_last_days - (Optional) Whether to include the last day of the month. Defaults to false.\n- retention_yearly - (Optional) Yearly retention configuration.\n  - count - (Required) The number of yearly backups to keep. Must be between 1 and 9999.\n  - months - (Required) The months of the year to retain backups of. Must be one of January, February, March, April, May, June, July, August, September, October, November, or December.\n  - weekdays - (Optional) The weekday backups to retain. Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, or Saturday.\n  - weeks - (Optional) The weeks of the month to retain backups of. Must be one of First, Second, Third, Fourth, or Last.\n  - days - (Optional) The days of the month to retain backups of. Must be between 1 and 31.\n  - include_last_days - (Optional) Whether to include the last day of the month. Defaults to false.\n\nExample Inputs:\nterraform\nfile_share_backup_policy = {\n  pol-rsv-fileshare-vault-001 = {\n    name      = \"pol-rsv-fileshare-vault-001\"\n    timezone  = \"Pacific Standard Time\"\n    frequency = \"Daily\"\n    backup = {\n      time = \"22:00\"\n    }\n    retention_daily = 7\n    retention_weekly = {\n      count    = 7\n      weekdays = [\"Tuesday\", \"Saturday\"]\n    }\n    retention_monthly = {\n      count             = 5\n      days              = [3, 10, 20]\n      include_last_days = false\n    }\n    retention_yearly = {\n      count    = 5\n      months   = [\"January\", \"June\"]\n      weekdays = [\"Tuesday\", \"Saturday\"]\n      weeks    = [\"First\", \"Third\"]\n    }\n  }\n}\n\n"
  type = map(object({
    name     = string
    timezone = string

    frequency = string

    retention_daily = optional(number, null)

    backup = object({
      time = string
      hourly = optional(object({
        interval        = number
        start_time      = string
        window_duration = number
      }))
    })

    retention_weekly = optional(object({
      count    = optional(number, 7)
      weekdays = optional(list(string), [])
    }), {})

    retention_monthly = optional(object({
      count             = optional(number, 0)
      weekdays          = optional(list(string), [])
      weeks             = optional(list(string), [])
      days              = optional(list(number), [])
      include_last_days = optional(bool, false)
    }), {})

    retention_yearly = optional(object({
      count             = optional(number, 0)
      months            = optional(list(string), [])
      weekdays          = optional(list(string), [])
      weeks             = optional(list(string), [])
      days              = optional(list(number), [])
      include_last_days = optional(bool, false)
    }), {})
  }))
  default = null
}

variable "immutability" {
  description = "(optional) Specify Immutability Setting of vault. Locked, Unlocked (default), Disabled"
  type        = string
  default     = "Unlocked"
}

variable "location" {
  description = "Azure region where the resource should be deployed.  If null, the location will be inferred from the resource group location."
  type        = string
  default     = ""
}

variable "lock" {
  description = "Controls the Resource Lock configuration for this resource. The following properties can be specified:\n\n- kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n- name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n"
  type = object({
    name = optional(string, null)
    kind = string
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
  description = "Name: specify a name for the Azure Recovery Services Vault. Upper/Lower case letters, numbers and hyphens. number of characters 2-50"
  type        = string
  default     = ""
}

variable "private_endpoints" {
  description = "A map of private endpoints to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (Optional) The name of the private endpoint. One will be generated if not set.\n- role_assignments - (Optional) A map of role assignments to create on the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time. See var.role_assignments for more information.\n- lock - (Optional) The lock level to apply to the private endpoint. Default is None. Possible values are None, CanNotDelete, and ReadOnly.\n- tags - (Optional) A mapping of tags to assign to the private endpoint.\n- subnet_resource_id - The resource ID of the subnet to deploy the private endpoint in.\n- private_dns_zone_group_name - (Optional) The name of the private DNS zone group. One will be generated if not set.\n- private_dns_zone_resource_ids - (Optional) A set of resource IDs of private DNS zones to associate with the private endpoint. If not set, no zone groups will be created and the private endpoint will not be associated with any private DNS zones. DNS records must be managed external to this module.\n- application_security_group_resource_ids - (Optional) A map of resource IDs of application security groups to associate with the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n- private_service_connection_name - (Optional) The name of the private service connection. One will be generated if not set.\n- network_interface_name - (Optional) The name of the network interface. One will be generated if not set.\n- location - (Optional) The Azure location where the resources will be deployed. Defaults to the location of the resource group.\n- resource_group_name - (Optional) The resource group where the resources will be deployed. Defaults to the resource group of the Key Vault.\n- ip_configurations - (Optional) A map of IP configurations to create on the private endpoint. If not specified the platform will create one. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  - name - The name of the IP configuration.\n  - private_ip_address - The private IP address of the IP configuration.\n"
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
    })), {}) # see https://azure.github.io/Azure-Verified-Modules/Azure-Verified-Modules/specs/shared/interfaces/#role-assignments
    lock = optional(object({
      kind = string
      name = optional(string, null)
    }), null)                                        # see https://azure.github.io/Azure-Verified-Modules/Azure-Verified-Modules/specs/shared/interfaces/#resource-locks
    tags               = optional(map(string), null) # see https://azure.github.io/Azure-Verified-Modules/Azure-Verified-Modules/specs/shared/interfaces/#tags
    subnet_resource_id = string
    ## You only need to expose the subresource_name if there are multiple underlying services, e.g. storage.
    ## Which has blob, file, etc.
    ## If there is only one then leave this out and hardcode the value in the module.
    subresource_name                        = string
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
  description = "(optional) Specify Public Network Access. true (default), false"
  type        = bool
  default     = true
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

variable "sku" {
  description = "(required) Specify SKU for Azure Recovery Service Vaults. Standard, RS0 (default)"
  type        = string
  default     = ""
}

variable "soft_delete_enabled" {
  description = "(optional) Specify Setting for Soft Delete. true (default), false"
  type        = bool
  default     = true
}

variable "storage_mode_type" {
  description = "(optional) Specify Storage type of the Recovery Services Vault. GeoRedundant (default), LocallyRedundant, ZoneRedundant"
  type        = string
  default     = "GeoRedundant"
}

variable "tags" {
  description = "The map of tags to be applied to the resource"
  type        = map(string)
  default     = null
}

variable "vm_backup_policy" {
  description = "A map of VM backup policies to create on the Recovery Services Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (Required) The name of the VM backup policy.\n- timezone - (Required) Specifies the timezone. [the possible values are defined here](https://jackstromberg.com/2017/01/list-of-time-zones-supported-by-azure/).\n- policy_type - (Required) The type of the backup policy. Possible values are V1 and V2. V2 policies extend support for Enhanced policies with hourly frequency.\n- frequency - (Required) Sets the backup frequency. Possible values are Hourly, Daily, and Weekly.\n- instant_restore_retention_days - (Optional) Specifies the number of days to keep the instant restore point. Possible values are between 1 and 5 for V1 policies, or 1 and 30 for V2 policies.\n- instant_restore_resource_group - (Optional) The resource group to use for instant restore points. Map with prefix and/or suffix keys.\n- retention_daily - (Optional) The number of daily backups to keep. Must be between 7 and 9999 for V1 policies, or 1 and 9999 for V2 policies.\n- backup - (Required) Backup schedule configuration.\n  - time - (Required) The time of day to perform the backup in 24-hour format HH:MM.\n  - hour_interval - (Optional) Interval in hours at which backup is triggered. Possible values are 4, 6, 8, and 12. Used when frequency is Hourly.\n  - hour_duration - (Optional) Duration of the backup window in hours. Possible values are between 4 and 24. Used when frequency is Hourly.\n  - weekdays - (Optional) The days of the week to perform backups on. Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, or Saturday. Used when frequency is Weekly.\n- retention_weekly - (Optional) Weekly retention configuration.\n  - count - (Required) The number of weekly backups to keep. Must be between 1 and 9999.\n  - weekdays - (Required) The days of the week to retain backups. Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, or Saturday.\n- retention_monthly - (Optional) Monthly retention configuration.\n  - count - (Required) The number of monthly backups to keep. Must be between 1 and 9999.\n  - weekdays - (Optional) The weekday backups to retain. Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, or Saturday.\n  - weeks - (Optional) The weeks of the month to retain backups of. Must be one of First, Second, Third, Fourth, or Last.\n  - days - (Optional) The days of the month to retain backups of. Must be between 1 and 31.\n  - include_last_days - (Optional) Whether to include the last day of the month. Defaults to false.\n- retention_yearly - (Optional) Yearly retention configuration.\n  - count - (Required) The number of yearly backups to keep. Must be between 1 and 9999.\n  - months - (Required) The months of the year to retain backups of. Must be one of January, February, March, April, May, June, July, August, September, October, November, or December.\n  - weekdays - (Optional) The weekday backups to retain. Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, or Saturday.\n  - weeks - (Optional) The weeks of the month to retain backups of. Must be one of First, Second, Third, Fourth, or Last.\n  - days - (Optional) The days of the month to retain backups of. Must be between 1 and 31.\n  - include_last_days - (Optional) Whether to include the last day of the month. Defaults to false.\n\nExample Inputs:\nterraform\nvm_backup_policy = {\n  pol-rsv-vm-vault-001 = {\n    name                           = \"pol-rsv-vm-vault-001\"\n    timezone                       = \"Pacific Standard Time\"\n    policy_type                    = \"V2\"\n    frequency                      = \"Weekly\"\n    instant_restore_retention_days = 5\n    backup = {\n      time     = \"22:00\"\n      weekdays = [\"Tuesday\", \"Saturday\"]\n    }\n    retention_daily = 7\n    retention_weekly = {\n      count    = 7\n      weekdays = [\"Tuesday\", \"Saturday\"]\n    }\n    retention_monthly = {\n      count             = 5\n      weekdays          = [\"Tuesday\", \"Saturday\"]\n      weeks             = [\"First\", \"Third\"]\n      days              = [3, 10, 20]\n      include_last_days = false\n    }\n    retention_yearly = {\n      count             = 5\n      months            = [\"January\", \"June\"]\n      weekdays          = [\"Tuesday\", \"Saturday\"]\n      weeks             = [\"First\", \"Third\"]\n      days              = [3, 10, 20]\n      include_last_days = false\n    }\n  }\n}\n\n"
  type = map(object({
    name                           = string
    timezone                       = string
    instant_restore_retention_days = optional(number, null)
    instant_restore_resource_group = optional(map(object({
      prefix = optional(string, null)
      suffix = optional(string, null)
    })), {})
    policy_type = string
    frequency   = string

    retention_daily = optional(number, null)

    backup = object({
      time          = string
      hour_interval = optional(number, null)
      hour_duration = optional(number, null)
      weekdays      = optional(list(string), [])
    })

    retention_weekly = optional(object({
      count    = optional(number, 7)
      weekdays = optional(list(string), [])
    }), {})

    retention_monthly = optional(object({
      count             = optional(number, 0)
      weekdays          = optional(list(string), [])
      weeks             = optional(list(string), [])
      days              = optional(list(number), [])
      include_last_days = optional(bool, false)
    }), {})

    retention_yearly = optional(object({
      count             = optional(number, 0)
      months            = optional(list(string), [])
      weekdays          = optional(list(string), [])
      weeks             = optional(list(string), [])
      days              = optional(list(number), [])
      include_last_days = optional(bool, false)
    }), {})
  }))
  default = null
}

variable "workload_backup_policy" {
  description = "A map of workload backup policies to create on the Recovery Services Vault for SQL or SAP HANA workloads. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (Required) The name of the workload backup policy.\n- workload_type - (Required) The workload type for the backup policy. Possible values are SQLDataBase and SAPHanaDatabase.\n- settings - (Required) Policy-level settings.\n  - time_zone - (Required) Specifies the timezone. [the possible values are defined here](https://jackstromberg.com/2017/01/list-of-time-zones-supported-by-azure/).\n  - compression_enabled - (Required) Whether to enable compression for the backup policy. Defaults to false.\n- backup_frequency - (Required) The frequency of the backup. Possible values are Daily and Weekly.\n- protection_policy - (Required) A map of protection policies within this backup policy. The map key is used to identify each policy type entry.\n  - policy_type - (Required) The type of this protection policy. Possible values are Full, Differential, and Log.\n  - retention_daily_count - (Required) The number of daily backups to keep. Must be between 7 and 9999.\n  - backup - (Optional) Backup schedule configuration for this policy type.\n    - time - (Optional) The time of day to perform the backup in 24-hour format HH:MM.\n    - frequency_in_minutes - (Optional) The backup frequency in minutes for Log policies. Possible values are 15, 30, 60, 120, 240, 480, 720, and 1440.\n    - weekdays - (Optional) The days of the week to perform backups on. Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, or Saturday.\n  - retention_weekly - (Optional) Weekly retention configuration.\n    - count - (Required) The number of weekly backups to keep. Must be between 1 and 9999.\n    - weekdays - (Required) The days of the week to retain backups. Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, or Saturday.\n  - retention_monthly - (Optional) Monthly retention configuration.\n    - count - (Required) The number of monthly backups to keep. Must be between 1 and 9999.\n    - weekdays - (Optional) The weekday backups to retain. Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, or Saturday.\n    - weeks - (Optional) The weeks of the month to retain backups of. Must be one of First, Second, Third, Fourth, or Last.\n    - monthdays - (Optional) The days of the month to retain backups of. Must be between 1 and 28.\n    - include_last_days - (Optional) Whether to include the last day of the month. Defaults to false.\n  - retention_yearly - (Optional) Yearly retention configuration.\n    - count - (Required) The number of yearly backups to keep. Must be between 1 and 9999.\n    - months - (Required) The months of the year to retain backups of. Must be one of January, February, March, April, May, June, July, August, September, October, November, or December.\n    - weekdays - (Optional) The weekday backups to retain. Must be one of Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, or Saturday.\n    - weeks - (Optional) The weeks of the month to retain backups of. Must be one of First, Second, Third, Fourth, or Last.\n    - monthdays - (Optional) The days of the month to retain backups of. Must be between 1 and 28.\n    - include_last_days - (Optional) Whether to include the last day of the month. Defaults to false.\n\nExample Inputs:\nterraform\nworkload_backup_policy = {\n  pol-rsv-SAPh-vault-001 = {\n    name          = \"pol-rsv-SAPh-vault-001\"\n    workload_type = \"SAPHanaDatabase\"\n    settings = {\n      time_zone           = \"Pacific Standard Time\"\n      compression_enabled = false\n    }\n    backup_frequency = \"Weekly\"\n    protection_policy = {\n      log = {\n        policy_type           = \"Log\"\n        retention_daily_count = 15\n        backup = {\n          frequency_in_minutes = 15\n          time                 = \"22:00\"\n          weekdays             = [\"Saturday\"]\n        }\n      }\n      full = {\n        policy_type           = \"Full\"\n        retention_daily_count = 15\n        backup = {\n          time     = \"22:00\"\n          weekdays = [\"Saturday\"]\n        }\n        retention_weekly = {\n          count    = 10\n          weekdays = [\"Saturday\"]\n        }\n        retention_monthly = {\n          count     = 10\n          weekdays  = [\"Saturday\"]\n          weeks     = [\"First\", \"Third\"]\n          monthdays = [3, 10, 20]\n        }\n        retention_yearly = {\n          count     = 10\n          months    = [\"January\", \"June\", \"October\", \"March\"]\n          weekdays  = [\"Saturday\"]\n          weeks     = [\"First\", \"Second\", \"Third\"]\n          monthdays = [3, 10, 20]\n        }\n      }\n      differential = {\n        policy_type           = \"Differential\"\n        retention_daily_count = 15\n        backup = {\n          time     = \"22:00\"\n          weekdays = [\"Wednesday\", \"Friday\"]\n        }\n      }\n    }\n  }\n}\n\n"
  type = map(object({
    name          = string
    workload_type = string
    settings = object({
      time_zone           = string
      compression_enabled = bool
    })

    backup_frequency = string
    protection_policy = map(object({
      policy_type           = string # description = "(required) Specify policy type. Full, Differential, Logs"
      retention_daily_count = number
      retention_weekly = optional(object({
        count    = optional(number, null)
        weekdays = optional(set(string), null)
      }), null)
      # retention_daily = optional(number, null) # (Required) The count that is used to count retention duration with duration type Days. Possible values are between 7 and 35.
      backup = optional(object({
        time                 = optional(string)
        frequency_in_minutes = optional(number)
        weekdays             = optional(set(string))
      }), null)

      retention_monthly = optional(object({
        count             = optional(number, null)
        weekdays          = optional(set(string), null)
        weeks             = optional(set(string), null)
        monthdays         = optional(set(number), null)
        include_last_days = optional(bool, false)
      }), null)

      retention_yearly = optional(object({
        count             = optional(number, null)
        months            = optional(set(string), null)
        weekdays          = optional(set(string), null)
        weeks             = optional(set(string), null)
        monthdays         = optional(set(number), null)
        include_last_days = optional(bool, false)
      }), null)

    }))
  }))
  default = null
}
