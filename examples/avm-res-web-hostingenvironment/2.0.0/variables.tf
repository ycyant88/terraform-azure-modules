variable "allow_new_private_endpoint_connections" {
  description = "Enable new private endpoint connection creation on the App Service Environment (ASE). Defaults to true."
  type        = bool
  default     = true
}

variable "cluster_settings" {
  description = "Custom settings for changing the behavior of the App Service Environment (ASE). These settings are stored in the clusterSettings attribute of the hostingEnvironments Azure Resource Manager entity."
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "custom_dns_suffix_configuration" {
  description = "  Custom domain suffix configuration for the App Service Environment (ASE). The following properties can be specified:\n\n  - certificate_url - (Required) The URL referencing the Azure Key Vault certificate secret that should be used as the default SSL/TLS certificate for sites with the custom domain suffix.\n  - dns_suffix - (Required) The default custom domain suffix to use for all sites deployed on the ASE.\n  - key_vault_reference_identity - (Optional) The user-assigned identity to use for resolving the key vault certificate reference. If not specified, the system-assigned ASE identity will be used if available.\n"
  type = object({
    certificate_url              = string
    dns_suffix                   = string
    key_vault_reference_identity = optional(string, null)
  })
  default = null
}

variable "dedicated_host_count" {
  description = "Dedicated Host Count for the App Service Environment (ASE). Possible value is 2. Setting this value will make the ASE use dedicated hosts."
  type        = number
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

variable "fips_mode_enabled" {
  description = "Enable FIPS mode on the App Service Environment (ASE). Enabling this will enforce the use of FIPS compliant ciphers and protocols for Linux: https://learn.microsoft.com/en-us/azure/app-service/environment/app-service-app-service-environment-custom-settings#enable-fips-mode"
  type        = bool
  default     = false
}

variable "front_end_tls_cipher_suite_order" {
  description = "The TLS cipher suite order to use on the App Service Environment (ASE). Refer to the docs for valid inputs: https://learn.microsoft.com/en-us/azure/app-service/environment/app-service-app-service-environment-custom-settings#change-tls-cipher-suite-order"
  type        = string
  default     = null
}

variable "ftp_enabled" {
  description = "Enable FTP on the App Service Environment (ASE)."
  type        = bool
  default     = false
}

variable "inbound_ip_address_override" {
  description = "Customer provided Inbound IP Address. Only able to be set on ASE create."
  type        = string
  default     = null
}

variable "internal_encryption_enabled" {
  description = "Enable internal Encryption: https://learn.microsoft.com/en-us/azure/app-service/environment/app-service-app-service-environment-custom-settings#enable-internal-encryption"
  type        = bool
  default     = true
}

variable "internal_load_balancing_mode" {
  description = "Specifies which endpoints to serve internally in the Virtual Network for the App Service Environment (ASE). Possible values are 'None', 'Web', 'Publishing', or 'Web, Publishing'."
  type        = string
  default     = "Web, Publishing"
}

variable "location" {
  description = "The Azure region where the App Service Environment (ASE) will be deployed."
  type        = string
  default     = ""
}

variable "lock" {
  description = "  Controls the Resource Lock configuration for this resource. The following properties can be specified:\n\n  - kind - (Required) The type of lock. Possible values are \"CanNotDelete\" and \"ReadOnly\".\n  - name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n"
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "managed_identities" {
  description = "  Controls the Managed Identity configuration on this resource. The following properties can be specified:\n\n  - system_assigned - (Optional) Specifies if the System Assigned Managed Identity should be enabled. Defaults to false.\n  - user_assigned_resource_ids - (Optional) Specifies a set of User Assigned Managed Identity resource IDs to be assigned to this resource.\n"
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default = {}
}

variable "name" {
  description = "The name of this resource."
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "The resource ID of the resource group where the App Service Environment (ASE) will be deployed."
  type        = string
  default     = ""
}

variable "remote_debug_enabled" {
  description = "Enable Remote Debug on the App Service Environment (ASE)."
  type        = bool
  default     = null
}

variable "retry" {
  description = "  Retry configuration for transient errors. The following properties can be specified:\n\n  - error_message_regex - (Optional) A list of regular expressions to match against error messages. If any match, the operation will be retried.\n  - interval_seconds - (Optional) The initial interval in seconds between retries.\n  - max_interval_seconds - (Optional) The maximum interval in seconds between retries.\n"
  type = object({
    error_message_regex  = optional(list(string), ["ScopeLocked"])
    interval_seconds     = optional(number, null)
    max_interval_seconds = optional(number, null)
  })
  default = {}
}

variable "role_assignments" {
  description = "  A map of role assignments to create on the App Service Environment (ASE). The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n  - role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n  - principal_id - The ID of the principal to assign the role to.\n  - description - (Optional) The description of the role assignment.\n  - skip_service_principal_aad_check - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n  - condition - (Optional) The condition which will be used to scope the role assignment.\n  - condition_version - (Optional) The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\n  - delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\n  - principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n\n  > Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
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

variable "subnet_id" {
  description = "The ID of the Subnet which the App Service Environment (ASE) should be connected to. The subnet must be delegated to Microsoft.Web/hostingEnvironments."
  type        = string
  default     = ""
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "  Timeouts for resource operations. App Service Environments (ASE) can take a long time to create and update.\n\n  - create - (Optional) The timeout for create operations. Defaults to '6h'.\n  - delete - (Optional) The timeout for delete operations. Defaults to '6h'.\n  - read - (Optional) The timeout for read operations. Defaults to '5m'.\n  - update - (Optional) The timeout for update operations. Defaults to '6h'.\n"
  type = object({
    create = optional(string, "6h")
    delete = optional(string, "6h")
    read   = optional(string, "5m")
    update = optional(string, "6h")
  })
  default = {}
}

variable "tls_1_enabled" {
  description = "Enable TLS 1.0 on the App Service Environment (ASE): https://learn.microsoft.com/en-us/azure/app-service/environment/app-service-app-service-environment-custom-settings#disable-tls-10-and-tls-11"
  type        = bool
  default     = false
}

variable "upgrade_preference" {
  description = "Upgrade Preference. Possible values are 'None', 'Early', 'Late', or 'Manual'."
  type        = string
  default     = "None"
}

variable "zone_redundancy_enabled" {
  description = "Specifies if the App Service Environment (ASE) is zone redundant. Defaults to true. Zonal ASEs can only be deployed in some regions."
  type        = bool
  default     = true
}
