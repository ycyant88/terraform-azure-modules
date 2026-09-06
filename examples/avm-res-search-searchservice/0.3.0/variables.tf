variable "allowed_ips" {
  description = "One or more IP Addresses, or CIDR Blocks which should be able to access the AI Search service"
  type        = list(string)
  default     = null
}

variable "authentication_failure_mode" {
  description = "(Optional) Specifies the response that the Search Service should return for requests that fail authentication. Possible values include http401WithBearerChallenge or http403."
  type        = string
  default     = null
}

variable "customer_managed_key" {
  description = "THIS IS A VARIABLE USED FOR A PREVIEW SERVICE/FEATURE, MICROSOFT MAY NOT PROVIDE SUPPORT FOR THIS, PLEASE CHECK THE PRODUCT DOCS FOR CLARIFICATION.\n\nA map describing the customer-managed key (CMK) to associate with the Search Service. When set, the module patches the Search Service via the Microsoft.Search/searchServices@2026-03-01-preview API to populate properties.encryptionWithCmk.serviceLevelEncryptionKey. Service-level CMK on Azure AI Search is only available in this preview API version at the time of writing.\n\nProperties:\n- key_vault_resource_id - The resource ID of the Key Vault where the key is stored.\n- key_name - The name of the key.\n- key_version - (Optional) The version of the key. If not specified, the latest (versionless) key URI is used.\n- user_assigned_identity - **Not yet supported by this module.** The targeted 0.3 CMK fix only wires the system-assigned managed identity for Key Vault access. Setting this attribute will fail validation. Full user-assigned identity support is tracked in the broader azapi refactor.\n  - resource_id - The resource ID of the user-assigned identity.\n\nThe identity used (system- or user-assigned) MUST be granted get, wrapKey and unwrapKey permissions on the Key Vault key (either via access policies or RBAC, depending on the Key Vault's permission model). See the [Azure AI Search CMK documentation](https://learn.microsoft.com/azure/search/search-security-manage-encryption-keys) for prerequisites.\n\nNote: when CMK is configured the Search Service is briefly created with Microsoft-managed encryption before the PATCH applies the CMK. No search indexes or other encryptable objects exist during that window.\n"
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

variable "customer_managed_key_enforcement_enabled" {
  description = "(Optional) Specifies whether the Search Service should enforce that non-customer resources are encrypted. Defaults to false."
  type        = bool
  default     = null
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

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "hosting_mode" {
  description = "(Optional) Specifies the Hosting Mode, which allows for High Density partitions (that allow for up to 1000 indexes) should be supported. Possible values are highDensity or default. Defaults to default. Changing this forces a new Search Service to be created."
  type        = string
  default     = null
}

variable "local_authentication_enabled" {
  description = "(Optional) Specifies whether the Search Service allows authenticating using API Keys? Defaults to true."
  type        = bool
  default     = null
}

variable "location" {
  description = "(Required) Azure region where the resource should be deployed."
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

variable "managed_identities" {
  description = "Controls the Managed Identity configuration on this resource. The following properties can be specified:\n\n- system_assigned - (Optional) Specifies if the System Assigned Managed Identity should be enabled.\n- user_assigned_resource_ids - (Optional) Specifies a list of User Assigned Managed Identity resource IDs to be assigned to this resource.\n"
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default = {}
}

variable "name" {
  description = "(Required) The name of the this resource."
  type        = string
  default     = ""
}

variable "network_rule_bypass_option" {
  description = "(Optional) Whether to allow trusted Azure services to access a network restricted Container Registry. Possible values are None and AzureServices. Defaults to None."
  type        = string
  default     = "None"
}

variable "partition_count" {
  description = "Partitions allow for scaling of document count as well as faster indexing by sharding your index over multiple search units."
  type        = number
  default     = 1
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

variable "public_network_access_enabled" {
  description = "This variable controls whether or not public network access is enabled for the module."
  type        = bool
  default     = true
}

variable "replica_count" {
  description = "Replicas distribute search workloads across the service. You need at least two replicas to support high availability of query workloads (not applicable to the free tier)."
  type        = number
  default     = 1
}

variable "resource_group_name" {
  description = "(Required) The resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "resource_types" {
  description = "Map of Azure resource type API versions for any azapi_* resources this module declares (see [TFFR6](https://azure.github.io/Azure-Verified-Modules/spec/TFFR6)).\n\n- search_searchservices - (Optional) API version used for the azapi_update_resource that patches the Search Service with customer_managed_key. Defaults to 2026-03-01-preview, the only API version that exposes properties.encryptionWithCmk.serviceLevelEncryptionKey at the time of writing.\n"
  type = object({
    search_searchservices = optional(string, "2026-03-01-preview")
  })
  default = {}
}

variable "retry" {
  description = "The retry block supports the following arguments applied to every azapi_* resource declared by this module (see [TFFR7](https://azure.github.io/Azure-Verified-Modules/spec/TFFR7)).\n\n- error_message_regex - (Optional) A list of regular expressions to match against error messages. If any of the regular expressions match, the error is considered retryable.\n- interval_seconds - (Optional) The base number of seconds to wait between retries. Defaults to 10.\n- max_interval_seconds - (Optional) The maximum number of seconds to wait between retries. Defaults to 180.\n- multiplier - (Optional) The multiplier to apply to the interval between retries. Defaults to 1.5.\n- randomization_factor - (Optional) The randomization factor to apply to the interval between retries. The formula is interval_seconds * (random value in [1 - randomization_factor, 1 + randomization_factor]). Defaults to 0.5.\n"
  type = object({
    error_message_regex  = optional(list(string), null)
    interval_seconds     = optional(number, null)
    max_interval_seconds = optional(number, null)
    multiplier           = optional(number, null)
    randomization_factor = optional(number, null)
  })
  default = null
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

variable "semantic_search_sku" {
  description = "(Optional) Specifies the Semantic Search SKU which should be used for this Search Service. Possible values include free and standard."
  type        = string
  default     = null
}

variable "sku" {
  description = "(Required) The pricing tier of the search service you want to create (for example, basic or standard)."
  type        = string
  default     = "standard"
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "The timeouts block applied to every azapi_* resource declared by this module (see [TFFR7](https://azure.github.io/Azure-Verified-Modules/spec/TFFR7)). Each field is a Go duration string.\n\n- create - (Optional) The timeout for creating the resource.\n- delete - (Optional) The timeout for deleting the resource.\n- read - (Optional) The timeout for reading the resource.\n- update - (Optional) The timeout for updating the resource.\n"
  type = object({
    create = optional(string, null)
    delete = optional(string, null)
    read   = optional(string, null)
    update = optional(string, null)
  })
  default = null
}
