variable "app_service_environment_id" {
  description = "Optional: The ID of the App Service Environment."
  type        = string
  default     = null
}

variable "diagnostic_settings" {
  description = "  A map of diagnostic settings to create on the App Service Environment (ASE). The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n  - name - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.\n  - log_categories - (Optional) A set of log categories to send to the log analytics workspace. Defaults to [].\n  - log_groups - (Optional) A set of log groups to send to the log analytics workspace. Defaults to [\"allLogs\"].\n  - metric_categories - (Optional) A set of metric categories to send to the log analytics workspace. Defaults to [\"AllMetrics\"].\n  - log_analytics_destination_type - (Optional) The destination type for the diagnostic setting. Possible values are Dedicated and AzureDiagnostics. Defaults to Dedicated.\n  - workspace_resource_id - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.\n  - storage_account_resource_id - (Optional) The resource ID of the storage account to send logs and metrics to.\n  - event_hub_authorization_rule_resource_id - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.\n  - event_hub_name - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.\n  - marketplace_partner_resource_id - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic Logs.\n"
  type = map(object({
    name = optional(string, null)
    logs = optional(set(object({
      category       = optional(string, null)
      category_group = optional(string, null)
      enabled        = optional(bool, true)
      retention_policy = optional(object({
        days    = optional(number, 0)
        enabled = optional(bool, false)
      }), {})
    })), [])
    metrics = optional(set(object({
      category = optional(string, null)
      enabled  = optional(bool, true)
      retention_policy = optional(object({
        days    = optional(number, 0)
        enabled = optional(bool, false)
      }), {})
    })), [])
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

variable "install_scripts" {
  description = "  Optional: A list of install scripts to run on the Managed Instance App Service Plan. Only applicable when os_type is WindowsManagedInstance.\n\n  - name - (Required) The name of the install script (e.g. \"FontInstaller\").\n  - source - (Required) The source configuration for the install script.\n    - type - (Optional) The type of the source. Defaults to \"RemoteAzureBlob\".\n    - source_uri - (Required) The URI of the install script package (e.g. a blob URI to a .zip file).\n"
  type = list(object({
    name = string
    source = object({
      type       = optional(string, "RemoteAzureBlob")
      source_uri = string
    })
  }))
  default = null
}

variable "location" {
  description = "The location where the resources will be deployed."
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
  description = "  Controls the managed identity configuration on this resource. The following properties can be specified:\n\n  - system_assigned - (Optional) Specifies if the System Assigned Managed Identity should be enabled.\n  - user_assigned_resource_ids - (Optional) Specifies a list of User Assigned Managed Identity resource IDs to be assigned to this resource.\n"
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default = {}
}

variable "maximum_elastic_worker_count" {
  description = "The maximum number of total workers allowed for this ElasticScaleEnabled App Service Plan."
  type        = number
  default     = 3
}

variable "name" {
  description = "The name of the this resource."
  type        = string
  default     = ""
}

variable "os_type" {
  description = "The operating system type of the service plan. Possible values are Windows, Linux or WindowsContainer."
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "The resource ID of the resource group in which to create this resource."
  type        = string
  default     = ""
}

variable "per_site_scaling_enabled" {
  description = "Should per site scaling be enabled for this App Service Plan."
  type        = bool
  default     = false
}

variable "plan_default_identity" {
  description = "  Optional: The default identity configuration for the Managed Instance App Service Plan. Only applicable when os_type is WindowsManagedInstance.\n\n  - identity_type - (Optional) The type of the identity. Defaults to \"UserAssigned\".\n  - user_assigned_identity_resource_id - (Required) The resource ID of the user-assigned managed identity to use as the plan default identity.\n"
  type = object({
    identity_type                      = optional(string, "UserAssigned")
    user_assigned_identity_resource_id = string
  })
  default = null
}

variable "premium_plan_auto_scale_enabled" {
  description = "Defaults to false. Should elastic scale be enabled for this App Service Plan. Only set to true if deploying a Premium or Elastic Premium SKU."
  type        = bool
  default     = false
}

variable "rdp_enabled" {
  description = "Optional: Whether RDP is enabled for the Managed Instance App Service Plan. Only applicable when os_type is WindowsManagedInstance. Set to null for non-managed instance plans. A Bastion host with must be deployed in the virtual network for RDP connectivity to work."
  type        = bool
  default     = null
}

variable "registry_adapters" {
  description = "  Optional: A list of registry adapters associated with this App Service Plan. Only applicable when os_type is WindowsManagedInstance.\n\n  - registry_key - (Required) Registry key for the adapter. The registry key must start with HKEY_LOCAL_MACHINE, HKEY_CURRENT_USER, or HKEY_USERS and contain at least one forward slash (e.g. HKEY_LOCAL_MACHINE/SOFTWARE/MyApp/Config).\n  - type - (Required) Type of the registry adapter. Possible values are \"DWORD\" or\"String\".\n  - key_vault_secret_reference - (Required) Key vault reference to the value that will be placed in the registry location.\n    - secret_uri - (Required) The URI of the Key Vault secret.\n"
  type = list(object({
    registry_key = string
    type         = string
    key_vault_secret_reference = object({
      secret_uri = string
    })
  }))
  default = null
}

variable "retry" {
  description = "  The retry configuration for azapi resources. The following properties can be specified:\n\n  - error_message_regex - (Required) A list of regular expressions to match against error messages. If any match, the request will be retried.\n  - interval_seconds - (Optional) The base number of seconds to wait between retries. Default is 10.\n  - max_interval_seconds - (Optional) The maximum number of seconds to wait between retries. Default is 180.\n"
  type = object({
    error_message_regex  = optional(list(string), ["ScopeLocked"])
    interval_seconds     = optional(number, null)
    max_interval_seconds = optional(number, null)
  })
  default = null
}

variable "role_assignments" {
  description = "  A map of role assignments to create on the resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n  - role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n  - principal_id - The ID of the principal to assign the role to.\n  - description - (Optional) The description of the role assignment.\n  - skip_service_principal_aad_check - (Optional) No effect when using AzAPI. Defaults to false.\n  - condition - (Optional) The condition which will be used to scope the role assignment.\n  - condition_version - (Optional) The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are 2.0.\n  - delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\n  - principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n\n  > Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
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

variable "server_farm_resource_type" {
  description = "The resource type for the server farm. Defaults to Microsoft.Web/serverfarms."
  type        = string
  default     = "Microsoft.Web/serverfarms@2025-03-01"
}

variable "sku_name" {
  description = "The SKU name of the service plan. Defaults to P1v2."
  type        = string
  default     = "P1v2"
}

variable "storage_mounts" {
  description = "  Optional: A list of storage mounts to configure on the App Service Plan. Only applicable when os_type is WindowsManagedInstance.\n\n  - name - (Required) The name of the storage mount (e.g. \"g-drive\").\n  - type - (Optional) The type of the storage mount. Defaults to \"LocalStorage\".\n  - source - (Optional) The source of the storage mount. Defaults to \"\".\n  - destination_path - (Required) The destination path for the storage mount (e.g. \"G:\\\\\").\n  - credentials_key_vault_reference - (Optional) A Key Vault reference for storage credentials.\n    - secret_uri - (Required) The URI of the Key Vault secret.\n"
  type = list(object({
    name             = string
    type             = optional(string, "LocalStorage")
    source           = optional(string, "")
    destination_path = string
    credentials_key_vault_reference = optional(object({
      secret_uri = optional(string)
    }), {})
  }))
  default = null
}

variable "tags" {
  description = "Tags of the resource."
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "  The timeout configuration for azapi resources. The following properties can be specified:\n\n  - create - (Optional) The timeout for create operations e.g. \"30m\", \"1h\".\n  - delete - (Optional) The timeout for delete operations e.g. \"30m\", \"1h\".\n  - read - (Optional) The timeout for read operations e.g. \"30m\", \"1h\".\n  - update - (Optional) The timeout for update operations e.g. \"30m\", \"1h\".\n"
  type = object({
    create = optional(string, null)
    delete = optional(string, null)
    read   = optional(string, null)
    update = optional(string, null)
  })
  default = null
}

variable "virtual_network_subnet_id" {
  description = "Optional: The resource ID of the subnet to integrate the App Service Plan with. This enables VNet integration for the plan."
  type        = string
  default     = null
}

variable "worker_count" {
  description = "The number of workers to allocate for this App Service Plan. Defaults to 3, which is the recommended minimum for production workloads."
  type        = number
  default     = 3
}

variable "zone_balancing_enabled" {
  description = "Should zone balancing be enabled for this App Service Plan? Defaults to true.\n\nNote: when sku_name = \"FC1\" (Flex Consumption), zone redundancy is only available in Azure regions that advertise the FCZONEREDUNDANCY capability. In regions that do not support it, this module fails early with a precondition error listing the supported regions. Set this to false to deploy FC1 in an unsupported region.\n"
  type        = bool
  default     = true
}
