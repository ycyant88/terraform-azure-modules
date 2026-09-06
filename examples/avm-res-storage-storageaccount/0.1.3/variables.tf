variable "access_tier" {
  description = "(Optional) Defines the access tier for BlobStorage, FileStorage and StorageV2 accounts. Valid options are Hot and Cool, defaults to Hot."
  type        = string
  default     = "Hot"
}

variable "account_kind" {
  description = "(Optional) Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Defaults to StorageV2."
  type        = string
  default     = "StorageV2"
}

variable "account_replication_type" {
  description = "(Required) Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS.  Defaults to ZRS"
  type        = string
  default     = "ZRS"
}

variable "account_tier" {
  description = "(Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created."
  type        = string
  default     = "Standard"
}

variable "allow_nested_items_to_be_public" {
  description = "(Optional) Allow or disallow nested items within this Account to opt into being public. Defaults to false."
  type        = bool
  default     = false
}

variable "allowed_copy_scope" {
  description = "(Optional) Restrict copy to and from Storage Accounts within an AAD tenant or with Private Links to the same VNet. Possible values are AAD and PrivateLink."
  type        = string
  default     = null
}

variable "azure_files_authentication" {
  description = "- directory_type - (Required) Specifies the directory service used. Possible values are AADDS, AD and AADKERB.\n\n---\nactive_directory block supports the following:\n- domain_guid - (Required) Specifies the domain GUID.\n- domain_name - (Required) Specifies the primary domain that the AD DNS server is authoritative for.\n- domain_sid - (Required) Specifies the security identifier (SID).\n- forest_name - (Required) Specifies the Active Directory forest.\n- netbios_domain_name - (Required) Specifies the NetBIOS domain name.\n- storage_sid - (Required) Specifies the security identifier (SID) for Azure Storage.\n"
  type = object({
    directory_type = string
    active_directory = optional(object({
      domain_guid         = string
      domain_name         = string
      domain_sid          = string
      forest_name         = string
      netbios_domain_name = string
      storage_sid         = string
    }))
  })
  default = null
}

variable "blob_properties" {
  description = "- change_feed_enabled - (Optional) Is the blob service properties for change feed events enabled? Default to false.\n- change_feed_retention_in_days - (Optional) The duration of change feed events retention in days. The possible values are between 1 and 146000 days (400 years). Setting this to null (or omit this in the configuration file) indicates an infinite retention of the change feed.\n- default_service_version - (Optional) The API Version which should be used by default for requests to the Data Plane API if an incoming request doesn't specify an API Version.\n- last_access_time_enabled - (Optional) Is the last access time based tracking enabled? Default to false.\n- versioning_enabled - (Optional) Is versioning enabled? Default to false.\n\n---\ncontainer_delete_retention_policy block supports the following:\n- days - (Optional) Specifies the number of days that the container should be retained, between 1 and 365 days. Defaults to 7.\n\n---\ncors_rule block supports the following:\n- allowed_headers - (Required) A list of headers that are allowed to be a part of the cross-origin request.\n- allowed_methods - (Required) A list of HTTP methods that are allowed to be executed by the origin. Valid options are DELETE, GET, HEAD, MERGE, POST, OPTIONS, PUT or PATCH.\n- allowed_origins - (Required) A list of origin domains that will be allowed by CORS.\n- exposed_headers - (Required) A list of response headers that are exposed to CORS clients.\n- max_age_in_seconds - (Required) The number of seconds the client should cache a preflight response.\n\n---\ndelete_retention_policy block supports the following:\n- days - (Optional) Specifies the number of days that the blob should be retained, between 1 and 365 days. Defaults to 7.\n\n---\ndiagnostic_settings block supports the following:\n- name - (Optional) The name of the diagnostic setting. Defaults to null.\n- log_categories - (Optional) A set of log categories to enable. Defaults to an empty set.\n- log_groups - (Optional) A set of log groups to enable. Defaults to [\"allLogs\"].\n- metric_categories - (Optional) A set of metric categories to enable. Defaults to [\"AllMetrics\"].\n- log_analytics_destination_type - (Optional) The destination type for log analytics. Defaults to \"Dedicated\".\n- workspace_resource_id - (Optional) The resource ID of the Log Analytics workspace. Defaults to null.\n- resource_id - (Optional) The resource ID of the target resource for diagnostics. Defaults to null.\n- event_hub_authorization_rule_resource_id - (Optional) The resource ID of the Event Hub authorization rule. Defaults to null.\n- event_hub_name - (Optional) The name of the Event Hub. Defaults to null.\n- marketplace_partner_resource_id - (Optional) The resource ID of the marketplace partner. Defaults to null.\n\n---\nrestore_policy block supports the following:\n- days - (Required) Specifies the number of days that the blob can be restored, between 1 and 365 days. This must be less than the days specified for delete_retention_policy.\n"
  type = object({
    change_feed_enabled           = optional(bool)
    change_feed_retention_in_days = optional(number)
    default_service_version       = optional(string)
    last_access_time_enabled      = optional(bool)
    versioning_enabled            = optional(bool)
    container_delete_retention_policy = optional(object({
      days = optional(number)
    }))
    cors_rule = optional(list(object({
      allowed_headers    = list(string)
      allowed_methods    = list(string)
      allowed_origins    = list(string)
      exposed_headers    = list(string)
      max_age_in_seconds = number
    })))
    delete_retention_policy = optional(object({
      days = optional(number)
    }))
    diagnostic_settings = optional(map(object({
      name                                     = optional(string, null)
      log_categories                           = optional(set(string), [])
      log_groups                               = optional(set(string), ["allLogs"])
      metric_categories                        = optional(set(string), ["AllMetrics"])
      log_analytics_destination_type           = optional(string, "Dedicated")
      workspace_resource_id                    = optional(string, null)
      resource_id                              = optional(string, null)
      event_hub_authorization_rule_resource_id = optional(string, null)
      event_hub_name                           = optional(string, null)
      marketplace_partner_resource_id          = optional(string, null)
    })), {})
    restore_policy = optional(object({
      days = number
    }))
  })
  default = null
}

variable "containers" {
  description = "- container_access_type - (Optional) The Access Level configured for this Container. Possible values are Blob, Container or None. Defaults to None.\n- metadata - (Optional) A mapping of MetaData for this Container. All metadata keys should be lowercase.\n- name - (Required) The name of the Container which should be created within the Storage Account. Changing this forces a new resource to be created.\n\nSupply role assignments in the same way as for var.role_assignments.\n\n---\ntimeouts block supports the following:\n- create - (Defaults to 30 minutes) Used when creating the Storage Container.\n- delete - (Defaults to 30 minutes) Used when deleting the Storage Container.\n- read - (Defaults to 5 minutes) Used when retrieving the Storage Container.\n- update - (Defaults to 30 minutes) Used when updating the Storage Container.\n"
  type = map(object({
    public_access = optional(string, "None")
    metadata      = optional(map(string))
    name          = string

    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
    })), {})

    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
  default = {}
}

variable "cross_tenant_replication_enabled" {
  description = "(Optional) Should cross Tenant replication be enabled? Defaults to false."
  type        = bool
  default     = false
}

variable "custom_domain" {
  description = "- name - (Required) The Custom Domain Name to use for the Storage Account, which will be validated by Azure.\n- use_subdomain - (Optional) Should the Custom Domain Name be validated by using indirect CNAME validation?\n"
  type = object({
    name          = string
    use_subdomain = optional(bool)
  })
  default = null
}

variable "customer_managed_key" {
  description = "    Defines a customer managed key to use for encryption.\n\n    object({\n      key_vault_resource_id              = (Required) - The full Azure Resource ID of the key_vault where the customer managed key will be referenced from.\n      key_name                           = (Required) - The key name for the customer managed key in the key vault.\n      key_version                        = (Optional) - The version of the key to use\n      user_assigned_identity_resource_id = (Optional) - The user assigned identity to use when access the key vault\n    })\n\n    Example Inputs:\n    terraform\n    customer_managed_key = {\n      key_vault_resource_id = \"/subscriptions/0000000-0000-0000-0000-000000000000/resourceGroups/test-resource-group/providers/Microsoft.KeyVault/vaults/example-key-vault\"\n      key_name              = \"sample-customer-key\"\n    }\n    \n"
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

variable "default_to_oauth_authentication" {
  description = "(Optional) Default to Azure Active Directory authorization in the Azure portal when accessing the Storage Account. The default value is false"
  type        = bool
  default     = null
}

variable "diagnostic_settings_blob" {
  description = "A map of diagnostic settings to create on the Blob Storage within Storage Account. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.\n- log_categories - (Optional) A set of log categories to send to the log analytics workspace. Defaults to [].\n- log_groups - (Optional) A set of log groups to send to the log analytics workspace. Defaults to [\"allLogs\"].\n- metric_categories - (Optional) A set of metric categories to send to the log analytics workspace. Defaults to [\"AllMetrics\"].\n- log_analytics_destination_type - (Optional) The destination type for the diagnostic setting. Possible values are Dedicated and AzureDiagnostics. Defaults to Dedicated.\n- workspace_resource_id - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.\n- storage_account_resource_id - (Optional) The resource ID of the storage account to send logs and metrics to.\n- event_hub_authorization_rule_resource_id - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.\n- event_hub_name - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.\n- marketplace_partner_resource_id - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic LogsLogs.\n"
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

variable "diagnostic_settings_file" {
  description = "A map of diagnostic settings to create on the Azure Files Storage within Storage Account. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.\n- log_categories - (Optional) A set of log categories to send to the log analytics workspace. Defaults to [].\n- log_groups - (Optional) A set of log groups to send to the log analytics workspace. Defaults to [\"allLogs\"].\n- metric_categories - (Optional) A set of metric categories to send to the log analytics workspace. Defaults to [\"AllMetrics\"].\n- log_analytics_destination_type - (Optional) The destination type for the diagnostic setting. Possible values are Dedicated and AzureDiagnostics. Defaults to Dedicated.\n- workspace_resource_id - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.\n- storage_account_resource_id - (Optional) The resource ID of the storage account to send logs and metrics to.\n- event_hub_authorization_rule_resource_id - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.\n- event_hub_name - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.\n- marketplace_partner_resource_id - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic LogsLogs.\n"
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

variable "diagnostic_settings_queue" {
  description = "A map of diagnostic settings to create on the Queue Storage within Storage Account. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.\n- log_categories - (Optional) A set of log categories to send to the log analytics workspace. Defaults to [].\n- log_groups - (Optional) A set of log groups to send to the log analytics workspace. Defaults to [\"allLogs\"].\n- metric_categories - (Optional) A set of metric categories to send to the log analytics workspace. Defaults to [\"AllMetrics\"].\n- log_analytics_destination_type - (Optional) The destination type for the diagnostic setting. Possible values are Dedicated and AzureDiagnostics. Defaults to Dedicated.\n- workspace_resource_id - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.\n- storage_account_resource_id - (Optional) The resource ID of the storage account to send logs and metrics to.\n- event_hub_authorization_rule_resource_id - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.\n- event_hub_name - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.\n- marketplace_partner_resource_id - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic LogsLogs.\n"
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

variable "diagnostic_settings_storage_account" {
  description = "A map of diagnostic settings to create on the Storage Account. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.\n- log_categories - (Optional) A set of log categories to send to the log analytics workspace. Defaults to [].\n- log_groups - (Optional) A set of log groups to send to the log analytics workspace. Defaults to [\"allLogs\"].\n- metric_categories - (Optional) A set of metric categories to send to the log analytics workspace. Defaults to [\"AllMetrics\"].\n- log_analytics_destination_type - (Optional) The destination type for the diagnostic setting. Possible values are Dedicated and AzureDiagnostics. Defaults to Dedicated.\n- workspace_resource_id - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.\n- storage_account_resource_id - (Optional) The resource ID of the storage account to send logs and metrics to.\n- event_hub_authorization_rule_resource_id - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.\n- event_hub_name - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.\n- marketplace_partner_resource_id - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic LogsLogs.\n"
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

variable "diagnostic_settings_table" {
  description = "A map of diagnostic settings to create on the Table Storage within the Storage Account. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.\n- log_categories - (Optional) A set of log categories to send to the log analytics workspace. Defaults to [].\n- log_groups - (Optional) A set of log groups to send to the log analytics workspace. Defaults to [\"allLogs\"].\n- metric_categories - (Optional) A set of metric categories to send to the log analytics workspace. Defaults to [\"AllMetrics\"].\n- log_analytics_destination_type - (Optional) The destination type for the diagnostic setting. Possible values are Dedicated and AzureDiagnostics. Defaults to Dedicated.\n- workspace_resource_id - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.\n- storage_account_resource_id - (Optional) The resource ID of the storage account to send logs and metrics to.\n- event_hub_authorization_rule_resource_id - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.\n- event_hub_name - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.\n- marketplace_partner_resource_id - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic LogsLogs.\n"
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

variable "edge_zone" {
  description = "(Optional) Specifies the Edge Zone within the Azure Region where this Storage Account should exist. Changing this forces a new Storage Account to be created."
  type        = string
  default     = null
}

variable "enable_https_traffic_only" {
  description = "(Optional) Boolean flag which forces HTTPS if enabled, see [here](https://docs.microsoft.com/azure/storage/storage-require-secure-transfer/) for more information. Defaults to true."
  type        = bool
  default     = true
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see https://aka.ms/avm/telemetryinfo.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "immutability_policy" {
  description = "- allow_protected_append_writes - (Required) When enabled, new blocks can be written to an append blob while maintaining immutability protection and compliance. Only new blocks can be added and any existing blocks cannot be modified or deleted.\n- period_since_creation_in_days - (Required) The immutability period for the blobs in the container since the policy creation, in days.\n- state - (Required) Defines the mode of the policy. Disabled state disables the policy, Unlocked state allows increase and decrease of immutability retention time and also allows toggling allowProtectedAppendWrites property, Locked state only allows the increase of the immutability retention time. A policy can only be created in a Disabled or Unlocked state and can be toggled between the two states. Only a policy in an Unlocked state can transition to a Locked state which cannot be reverted.\n"
  type = object({
    allow_protected_append_writes = bool
    period_since_creation_in_days = number
    state                         = string
  })
  default = null
}

variable "infrastructure_encryption_enabled" {
  description = "(Optional) Is infrastructure encryption enabled? Changing this forces a new resource to be created. Defaults to false."
  type        = bool
  default     = false
}

variable "is_hns_enabled" {
  description = "(Optional) Is Hierarchical Namespace enabled? This can be used with Azure Data Lake Storage Gen 2 ([see here for more information](https://docs.microsoft.com/azure/storage/blobs/data-lake-storage-quickstart-create-account/)). Changing this forces a new resource to be created."
  type        = bool
  default     = null
}

variable "large_file_share_enabled" {
  description = "(Optional) Is Large File Share Enabled?"
  type        = bool
  default     = null
}

variable "local_user" {
  description = "- home_directory - (Optional) The home directory of the Storage Account Local User.\n- name - (Required) The name which should be used for this Storage Account Local User. Changing this forces a new Storage Account Local User to be created.\n- ssh_key_enabled - (Optional) Specifies whether SSH Key Authentication is enabled. Defaults to false.\n- ssh_password_enabled - (Optional) Specifies whether SSH Password Authentication is enabled. Defaults to false.\n\n---\npermission_scope block supports the following:\n- resource_name - (Required) The container name (when service is set to blob) or the file share name (when service is set to file), used by the Storage Account Local User.\n- service - (Required) The storage service used by this Storage Account Local User. Possible values are blob and file.\n\n---\npermissions block supports the following:\n- create - (Optional) Specifies if the Local User has the create permission for this scope. Defaults to false.\n- delete - (Optional) Specifies if the Local User has the delete permission for this scope. Defaults to false.\n- list - (Optional) Specifies if the Local User has the list permission for this scope. Defaults to false.\n- read - (Optional) Specifies if the Local User has the read permission for this scope. Defaults to false.\n- write - (Optional) Specifies if the Local User has the write permission for this scope. Defaults to false.\n\n---\nssh_authorized_key block supports the following:\n- description - (Optional) The description of this SSH authorized key.\n- key - (Required) The public key value of this SSH authorized key.\n\n---\ntimeouts block supports the following:\n- create - (Defaults to 30 minutes) Used when creating the Storage Account Local User.\n- delete - (Defaults to 30 minutes) Used when deleting the Storage Account Local User.\n- read - (Defaults to 5 minutes) Used when retrieving the Storage Account Local User.\n- update - (Defaults to 30 minutes) Used when updating the Storage Account Local User.\n"
  type = map(object({
    home_directory       = optional(string)
    name                 = string
    ssh_key_enabled      = optional(bool)
    ssh_password_enabled = optional(bool)
    permission_scope = optional(list(object({
      resource_name = string
      service       = string
      permissions = object({
        create = optional(bool)
        delete = optional(bool)
        list   = optional(bool)
        read   = optional(bool)
        write  = optional(bool)
      })
    })))
    ssh_authorized_key = optional(list(object({
      description = optional(string)
      key         = string
    })))
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
  description = "Azure region where the resource should be deployed.\nIf null, the location will be inferred from the resource group location.\n"
  type        = string
  default     = ""
}

variable "lock" {
  description = "The lock level to apply. Default is None. Possible values are None, CanNotDelete, and ReadOnly."
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

variable "min_tls_version" {
  description = "(Optional) The minimum supported TLS version for the storage account. Possible values are TLS1_0, TLS1_1, and TLS1_2. Defaults to TLS1_2 for new storage accounts."
  type        = string
  default     = "TLS1_2"
}

variable "name" {
  description = "The name of the resource."
  type        = string
  default     = ""
}

variable "network_rules" {
  description = "> Note the default value for this variable will block all public access to the storage account. If you want to disable all network rules, set this value to null.\n\n- bypass - (Optional) Specifies whether traffic is bypassed for Logging/Metrics/AzureServices. Valid options are any combination of Logging, Metrics, AzureServices, or None.\n- default_action - (Required) Specifies the default action of allow or deny when no other rules match. Valid options are Deny or Allow.\n- ip_rules - (Optional) List of public IP or IP ranges in CIDR Format. Only IPv4 addresses are allowed. Private IP address ranges (as defined in [RFC 1918](https://tools.ietf.org/html/rfc1918#section-3)) are not allowed.\n- storage_account_id - (Required) Specifies the ID of the storage account. Changing this forces a new resource to be created.\n- virtual_network_subnet_ids - (Optional) A list of virtual network subnet ids to secure the storage account.\n\n---\nprivate_link_access block supports the following:\n- endpoint_resource_id - (Required) The resource id of the resource access rule to be granted access.\n- endpoint_tenant_id - (Optional) The tenant id of the resource of the resource access rule to be granted access. Defaults to the current tenant id.\n\n---\ntimeouts block supports the following:\n- create - (Defaults to 60 minutes) Used when creating the  Network Rules for this Storage Account.\n- delete - (Defaults to 60 minutes) Used when deleting the Network Rules for this Storage Account.\n- read - (Defaults to 5 minutes) Used when retrieving the Network Rules for this Storage Account.\n- update - (Defaults to 60 minutes) Used when updating the Network Rules for this Storage Account.\n"
  type = object({
    bypass                     = optional(set(string), [])
    default_action             = optional(string, "Deny")
    ip_rules                   = optional(set(string), [])
    virtual_network_subnet_ids = optional(set(string), [])
    private_link_access = optional(list(object({
      endpoint_resource_id = string
      endpoint_tenant_id   = optional(string)
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  })
  default = {}
}

variable "nfsv3_enabled" {
  description = "(Optional) Is NFSv3 protocol enabled? Changing this forces a new resource to be created. Defaults to false."
  type        = bool
  default     = false
}

variable "private_endpoints" {
  description = "A map of private endpoints to create on the resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (Optional) The name of the private endpoint. One will be generated if not set.\n- role_assignments - (Optional) A map of role assignments to create on the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time. See var.role_assignments for more information.\n- lock - (Optional) The lock level to apply to the private endpoint. Default is None. Possible values are None, CanNotDelete, and ReadOnly.\n- tags - (Optional) A mapping of tags to assign to the private endpoint.\n- subnet_resource_id - The resource ID of the subnet to deploy the private endpoint in.\n- subresource_name - The service name of the private endpoint.  Possible value are blob, 'dfs', 'file', queue, table, and web.\n- private_dns_zone_group_name - (Optional) The name of the private DNS zone group. One will be generated if not set.\n- private_dns_zone_resource_ids - (Optional) A set of resource IDs of private DNS zones to associate with the private endpoint. If not set, no zone groups will be created and the private endpoint will not be associated with any private DNS zones. DNS records must be managed external to this module.\n- application_security_group_resource_ids - (Optional) A map of resource IDs of application security groups to associate with the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n- private_service_connection_name - (Optional) The name of the private service connection. One will be generated if not set.\n- network_interface_name - (Optional) The name of the network interface. One will be generated if not set.\n- location - (Optional) The Azure location where the resources will be deployed. Defaults to the location of the resource group.\n- resource_group_name - (Optional) The resource group where the resources will be deployed. Defaults to the resource group of the resource.\n- ip_configurations - (Optional) A map of IP configurations to create on the private endpoint. If not specified the platform will create one. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  - name - The name of the IP configuration.\n  - private_ip_address - The private IP address of the IP configuration.\n"
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

variable "public_network_access_enabled" {
  description = "(Optional) Whether the public network access is enabled? Defaults to false."
  type        = bool
  default     = false
}

variable "queue_encryption_key_type" {
  description = "(Optional) The encryption type of the queue service. Possible values are Service and Account. Changing this forces a new resource to be created. Default value is Service."
  type        = string
  default     = null
}

variable "queue_properties" {
  description = "\n---\ncors_rule block supports the following:\n- allowed_headers - (Required) A list of headers that are allowed to be a part of the cross-origin request.\n- allowed_methods - (Required) A list of HTTP methods that are allowed to be executed by the origin. Valid options are DELETE, GET, HEAD, MERGE, POST, OPTIONS, PUT or PATCH.\n- allowed_origins - (Required) A list of origin domains that will be allowed by CORS.\n- exposed_headers - (Required) A list of response headers that are exposed to CORS clients.\n- max_age_in_seconds - (Required) The number of seconds the client should cache a preflight response.\n\n---\ndiagnostic_settings block supports the following:\n- name - (Optional) The name of the diagnostic setting. Defaults to null.\n- log_categories - (Optional) A set of log categories to enable. Defaults to an empty set.\n- log_groups - (Optional) A set of log groups to enable. Defaults to [\"allLogs\"].\n- metric_categories - (Optional) A set of metric categories to enable. Defaults to [\"AllMetrics\"].\n- log_analytics_destination_type - (Optional) The destination type for log analytics. Defaults to \"Dedicated\".\n- workspace_resource_id - (Optional) The resource ID of the Log Analytics workspace. Defaults to null.\n- resource_id - (Optional) The resource ID of the target resource for diagnostics. Defaults to null.\n- event_hub_authorization_rule_resource_id - (Optional) The resource ID of the Event Hub authorization rule. Defaults to null.\n- event_hub_name - (Optional) The name of the Event Hub. Defaults to null.\n- marketplace_partner_resource_id - (Optional) The resource ID of the marketplace partner. Defaults to null.\n\n---\nhour_metrics block supports the following:\n- enabled - (Required) Indicates whether hour metrics are enabled for the Queue service.\n- include_apis - (Optional) Indicates whether metrics should generate summary statistics for called API operations.\n- retention_policy_days - (Optional) Specifies the number of days that logs will be retained.\n- version - (Required) The version of storage analytics to configure.\n\n---\nlogging block supports the following:\n- delete - (Required) Indicates whether all delete requests should be logged.\n- read - (Required) Indicates whether all read requests should be logged.\n- retention_policy_days - (Optional) Specifies the number of days that logs will be retained.\n- version - (Required) The version of storage analytics to configure.\n- write - (Required) Indicates whether all write requests should be logged.\n\n---\nminute_metrics block supports the following:\n- enabled - (Required) Indicates whether minute metrics are enabled for the Queue service.\n- include_apis - (Optional) Indicates whether metrics should generate summary statistics for called API operations.\n- retention_policy_days - (Optional) Specifies the number of days that logs will be retained.\n- version - (Required) The version of storage analytics to configure.\n\n"
  type = object({
    cors_rule = optional(list(object({
      allowed_headers    = list(string)
      allowed_methods    = list(string)
      allowed_origins    = list(string)
      exposed_headers    = list(string)
      max_age_in_seconds = number
    })))
    diagnostic_settings = optional(map(object({
      name                                     = optional(string, null)
      log_categories                           = optional(set(string), [])
      log_groups                               = optional(set(string), ["allLogs"])
      metric_categories                        = optional(set(string), ["AllMetrics"])
      log_analytics_destination_type           = optional(string, "Dedicated")
      workspace_resource_id                    = optional(string, null)
      resource_id                              = optional(string, null)
      event_hub_authorization_rule_resource_id = optional(string, null)
      event_hub_name                           = optional(string, null)
      marketplace_partner_resource_id          = optional(string, null)
    })), {})
    hour_metrics = optional(object({
      enabled               = bool
      include_apis          = optional(bool)
      retention_policy_days = optional(number)
      version               = string
    }))
    logging = optional(object({
      delete                = bool
      read                  = bool
      retention_policy_days = optional(number)
      version               = string
      write                 = bool
    }))
    minute_metrics = optional(object({
      enabled               = bool
      include_apis          = optional(bool)
      retention_policy_days = optional(number)
      version               = string
    }))
  })
  default = null
}

variable "queues" {
  description = " - metadata - (Optional) A mapping of MetaData which should be assigned to this Storage Queue.\n - name - (Required) The name of the Queue which should be created within the Storage Account. Must be unique within the storage account the queue is located. Changing this forces a new resource to be created.\n\nSupply role assignments in the same way as for var.role_assignments.\n\n ---\n timeouts block supports the following:\n - create - (Defaults to 30 minutes) Used when creating the Storage Queue.\n - delete - (Defaults to 30 minutes) Used when deleting the Storage Queue.\n - read - (Defaults to 5 minutes) Used when retrieving the Storage Queue.\n - update - (Defaults to 30 minutes) Used when updating the Storage Queue.\n"
  type = map(object({
    metadata = optional(map(string))
    name     = string
    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
    })), {})
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
  default = {}
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "A map of role assignments to create on the resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n- principal_id - The ID of the principal to assign the role to.\n- description - The description of the role assignment.\n- skip_service_principal_aad_check - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n- condition - The condition which will be used to scope the role assignment.\n- condition_version - The version of the condition syntax. Valid values are '2.0'.\n\n> Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
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

variable "routing" {
  description = "- choice - (Optional) Specifies the kind of network routing opted by the user. Possible values are InternetRouting and MicrosoftRouting. Defaults to MicrosoftRouting.\n- publish_internet_endpoints - (Optional) Should internet routing storage endpoints be published? Defaults to false.\n- publish_microsoft_endpoints - (Optional) Should Microsoft routing storage endpoints be published? Defaults to false.\n"
  type = object({
    choice                      = optional(string, "MicrosoftRouting")
    publish_internet_endpoints  = optional(bool, false)
    publish_microsoft_endpoints = optional(bool, false)
  })
  default = null
}

variable "sas_policy" {
  description = "- expiration_action - (Optional) The SAS expiration action. The only possible value is Log at this moment. Defaults to Log.\n- expiration_period - (Required) The SAS expiration period in format of DD.HH:MM:SS.\n"
  type = object({
    expiration_action = optional(string, "Log")
    expiration_period = string
  })
  default = null
}

variable "sftp_enabled" {
  description = "(Optional) Boolean, enable SFTP for the storage account.  Defaults to false."
  type        = bool
  default     = false
}

variable "share_properties" {
  description = "\n---\ncors_rule block supports the following:\n- allowed_headers - (Required) A list of headers that are allowed to be a part of the cross-origin request.\n- allowed_methods - (Required) A list of HTTP methods that are allowed to be executed by the origin. Valid options are DELETE, GET, HEAD, MERGE, POST, OPTIONS, PUT or PATCH.\n- allowed_origins - (Required) A list of origin domains that will be allowed by CORS.\n- exposed_headers - (Required) A list of response headers that are exposed to CORS clients.\n- max_age_in_seconds - (Required) The number of seconds the client should cache a preflight response.\n\n---\ndiagnostic_settings block supports the following:\n- name - (Optional) The name of the diagnostic setting. Defaults to null.\n- log_categories - (Optional) A set of log categories to enable. Defaults to an empty set.\n- log_groups - (Optional) A set of log groups to enable. Defaults to [\"allLogs\"].\n- metric_categories - (Optional) A set of metric categories to enable. Defaults to [\"AllMetrics\"].\n- log_analytics_destination_type - (Optional) The destination type for log analytics. Defaults to \"Dedicated\".\n- workspace_resource_id - (Optional) The resource ID of the Log Analytics workspace. Defaults to null.\n- resource_id - (Optional) The resource ID of the target resource for diagnostics. Defaults to null.\n- event_hub_authorization_rule_resource_id - (Optional) The resource ID of the Event Hub authorization rule. Defaults to null.\n- event_hub_name - (Optional) The name of the Event Hub. Defaults to null.\n- marketplace_partner_resource_id - (Optional) The resource ID of the marketplace partner. Defaults to null.\n\n---\nretention_policy block supports the following:\n- days - (Optional) Specifies the number of days that the azurerm_shares should be retained, between 1 and 365 days. Defaults to 7.\n\n---\nsmb block supports the following:\n- authentication_types - (Optional) A set of SMB authentication methods. Possible values are NTLMv2, and Kerberos.\n- channel_encryption_type - (Optional) A set of SMB channel encryption. Possible values are AES-128-CCM, AES-128-GCM, and AES-256-GCM.\n- kerberos_ticket_encryption_type - (Optional) A set of Kerberos ticket encryption. Possible values are RC4-HMAC, and AES-256.\n- multichannel_enabled - (Optional) Indicates whether multichannel is enabled. Defaults to false. This is only supported on Premium storage accounts.\n- versions - (Optional) A set of SMB protocol versions. Possible values are SMB2.1, SMB3.0, and SMB3.1.1.\n"
  type = object({
    cors_rule = optional(list(object({
      allowed_headers    = list(string)
      allowed_methods    = list(string)
      allowed_origins    = list(string)
      exposed_headers    = list(string)
      max_age_in_seconds = number
    })))
    diagnostic_settings = optional(map(object({
      name                                     = optional(string, null)
      log_categories                           = optional(set(string), [])
      log_groups                               = optional(set(string), ["allLogs"])
      metric_categories                        = optional(set(string), ["AllMetrics"])
      log_analytics_destination_type           = optional(string, "Dedicated")
      workspace_resource_id                    = optional(string, null)
      resource_id                              = optional(string, null)
      event_hub_authorization_rule_resource_id = optional(string, null)
      event_hub_name                           = optional(string, null)
      marketplace_partner_resource_id          = optional(string, null)
    })), {})
    retention_policy = optional(object({
      days = optional(number)
    }))
    smb = optional(object({
      authentication_types            = optional(set(string))
      channel_encryption_type         = optional(set(string))
      kerberos_ticket_encryption_type = optional(set(string))
      multichannel_enabled            = optional(bool)
      versions                        = optional(set(string))
    }))
  })
  default = null
}

variable "shared_access_key_enabled" {
  description = "(Optional) Indicates whether the storage account permits requests to be authorized with the account access key via Shared Key. If false, then all requests, including shared access signatures, must be authorized with Azure Active Directory (Azure AD). The default value is false."
  type        = bool
  default     = false
}

variable "shares" {
  description = " - access_tier - (Optional) The access tier of the File Share. Possible values are Hot, Cool and TransactionOptimized, Premium.\n - enabled_protocol - (Optional) The protocol used for the share. Possible values are SMB and NFS. The SMB indicates the share can be accessed by SMBv3.0, SMBv2.1 and REST. The NFS indicates the share can be accessed by NFSv4.1. Defaults to SMB. Changing this forces a new resource to be created.\n - metadata - (Optional) A mapping of MetaData for this File Share.\n - name - (Required) The name of the share. Must be unique within the storage account where the share is located. Changing this forces a new resource to be created.\n - quota - (Required) The maximum size of the share, in gigabytes. For Standard storage accounts, this must be 1GB (or higher) and at most 5120 GB (5 TB). For Premium FileStorage storage accounts, this must be greater than 100 GB and at most 102400 GB (100 TB).\n\n ---\n acl block supports the following:\n - id - (Required) The ID which should be used for this Shared Identifier.\n\n ---\n access_policy block supports the following:\n - expiry - (Optional) The time at which this Access Policy should be valid until, in [ISO8601](https://en.wikipedia.org/wiki/ISO_8601) format.\n - permissions - (Required) The permissions which should be associated with this Shared Identifier. Possible value is combination of r (read), w (write), d (delete), and l (list).\n - start - (Optional) The time at which this Access Policy should be valid from, in [ISO8601](https://en.wikipedia.org/wiki/ISO_8601) format.\n\n ---\n timeouts block supports the following:\n - create - (Defaults to 30 minutes) Used when creating the Storage Share.\n - delete - (Defaults to 30 minutes) Used when deleting the Storage Share.\n - read - (Defaults to 5 minutes) Used when retrieving the Storage Share.\n - update - (Defaults to 30 minutes) Used when updating the Storage Share.\n\nSupply role assignments in the same way as for var.role_assignments.\n\n"
  type = map(object({
    access_tier      = optional(string)
    enabled_protocol = optional(string)
    metadata         = optional(map(string))
    name             = string
    quota            = number
    acl = optional(set(object({
      id = string
      access_policy = optional(list(object({
        expiry      = optional(string)
        permissions = string
        start       = optional(string)
      })))
    })))
    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
    })), {})
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
  default = {}
}

variable "static_website" {
  description = "- error_404_document - (Optional) The absolute path to a custom webpage that should be used when a request is made which does not correspond to an existing file.\n- index_document - (Optional) The webpage that Azure Storage serves for requests to the root of a website or any subfolder. For example, index.html. The value is case-sensitive.\n"
  type = object({
    error_404_document = optional(string)
    index_document     = optional(string)
  })
  default = null
}

variable "table_encryption_key_type" {
  description = "(Optional) The encryption type of the table service. Possible values are Service and Account. Changing this forces a new resource to be created. Default value is Service."
  type        = string
  default     = null
}

variable "tables" {
  description = " - name - (Required) The name of the storage table. Only Alphanumeric characters allowed, starting with a letter. Must be unique within the storage account the table is located. Changing this forces a new resource to be created.\n\n ---\n acl block supports the following:\n - id - (Required) The ID which should be used for this Shared Identifier.\n\n ---\n access_policy block supports the following:\n - expiry - (Required) The ISO8061 UTC time at which this Access Policy should be valid until.\n - permissions - (Required) The permissions which should associated with this Shared Identifier.\n - start - (Required) The ISO8061 UTC time at which this Access Policy should be valid from.\n\n ---\n timeouts block supports the following:\n - create - (Defaults to 30 minutes) Used when creating the Storage Table.\n - delete - (Defaults to 30 minutes) Used when deleting the Storage Table.\n - read - (Defaults to 5 minutes) Used when retrieving the Storage Table.\n - update - (Defaults to 30 minutes) Used when updating the Storage Table.\n\nSupply role assignments in the same way as for var.role_assignments.\n\n"
  type = map(object({
    name = string
    acl = optional(set(object({
      id = string
      access_policy = optional(list(object({
        expiry      = string
        permissions = string
        start       = string
      })))
    })))

    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
    })), {})

    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
  default = {}
}

variable "tags" {
  description = "Custom tags to apply to the resource."
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "- create - (Defaults to 60 minutes) Used when creating the Storage Account.\n- delete - (Defaults to 60 minutes) Used when deleting the Storage Account.\n- read - (Defaults to 5 minutes) Used when retrieving the Storage Account.\n- update - (Defaults to 60 minutes) Used when updating the Storage Account.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}

variable "use_nested_nacl" {
  description = "    Controls whether or not to use nested network ACLs for this resource.\n    Nested network ACLs are used to apply network ACLs to the subresources of the storage account, such as blob containers and queues.\n\n    - If set to true, nested network ACLs will be used and will override any network rules. NACL resource will be created to support scenarios like Azure policy for storage accounts.\n    - If set to false, nested network ACLs will not be used and \"azurerm_storage_account_network_rules\" resource will be leveraged.\n"
  type        = bool
  default     = false
}

variable "wait_for_rbac_before_container_operations" {
  description = "This variable controls the amount of time to wait before performing container operations.\nIt only applies when var.role_assignments and var.containers are both set.\nThis is useful when you are creating role assignments on the container and immediately creating containers in it.\nThe default is 30 seconds for create and 0 seconds for destroy.\n"
  type = object({
    create  = optional(string, "30s")
    destroy = optional(string, "0s")
  })
  default = {}
}

variable "wait_for_rbac_before_queue_operations" {
  description = "This variable controls the amount of time to wait before performing queue operations.\nIt only applies when var.role_assignments and var.queues are both set.\nThis is useful when you are creating role assignments on the queue and immediately creating queues in it.\nThe default is 30 seconds for create and 0 seconds for destroy.\n"
  type = object({
    create  = optional(string, "30s")
    destroy = optional(string, "0s")
  })
  default = {}
}

variable "wait_for_rbac_before_share_operations" {
  description = "This variable controls the amount of time to wait before performing share operations.\nIt only applies when var.role_assignments and var.shares are both set.\nThis is useful when you are creating role assignments on the share and immediately creating shares in it.\nThe default is 30 seconds for create and 0 seconds for destroy.\n"
  type = object({
    create  = optional(string, "30s")
    destroy = optional(string, "0s")
  })
  default = {}
}

variable "wait_for_rbac_before_table_operations" {
  description = "This variable controls the amount of time to wait before performing table operations.\nIt only applies when var.role_assignments and var.tables are both set.\nThis is useful when you are creating role assignments on the table and immediately creating tables in it.\nThe default is 30 seconds for create and 0 seconds for destroy.\n"
  type = object({
    create  = optional(string, "30s")
    destroy = optional(string, "0s")
  })
  default = {}
}
