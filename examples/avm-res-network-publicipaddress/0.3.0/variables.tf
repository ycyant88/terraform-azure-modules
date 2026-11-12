variable "allocation_method" {
  description = "The allocation method to use."
  type        = string
  default     = "Static"
}

variable "ddos_protection_mode" {
  description = "The DDoS protection mode to use."
  type        = string
  default     = "VirtualNetworkInherited"
}

variable "ddos_protection_plan_id" {
  description = "The ID of the DDoS protection plan to associate with the public IP address. This is required if ddos_protection_mode is set to Standard."
  type        = string
  default     = null
}

variable "diagnostic_settings" {
  description = "A map of diagnostic settings to create on the ddos protection plan. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.\n- log_categories - (Optional) A set of log categories to send to the log analytics workspace. Defaults to [].\n- log_groups - (Optional) A set of log groups to send to the log analytics workspace. Defaults to [\"allLogs\"].\n- metric_categories - (Optional) A set of metric categories to send to the log analytics workspace. Defaults to [\"AllMetrics\"].\n- log_analytics_destination_type - (Optional) The destination type for the diagnostic setting. Possible values are Dedicated and AzureDiagnostics. Defaults to Dedicated.\n- workspace_resource_id - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.\n- storage_account_resource_id - (Optional) The resource ID of the storage account to send logs and metrics to.\n- event_hub_authorization_rule_resource_id - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.\n- event_hub_name - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.\n- marketplace_partner_resource_id - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic LogsLogs.\n"
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

variable "domain_name_label" {
  description = "The domain name label for the public IP address."
  type        = string
  default     = null
}

variable "edge_zone" {
  description = "The edge zone to use for the public IP address. This is required if sku_tier is set to Global."
  type        = string
  default     = null
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "idle_timeout_in_minutes" {
  description = "The idle timeout in minutes."
  type        = number
  default     = 4
}

variable "ignore_body_changes" {
  description = "Body-relative paths to ignore for each AzAPI resource. Paths use dot notation.\nChanges take effect only after apply. Ignored configuration is not sent to Azure\nuntil the path is removed.\n\n- network_public_ip_addresses - Paths ignored on the public IP address resource.\n- authorization_locks - Paths ignored on the management lock resource.\n- authorization_role_assignments - Paths ignored on the role assignment resources.\n- insights_diagnostic_settings - Paths ignored on the diagnostic setting resources.\n\n> NOTE: non-empty values require Terraform 1.11 or later. The module collapses\n> an empty list to null, so the write-only argument stays absent at the\n> default and consumers on Terraform 1.9/1.10 are unaffected.\n\n> NOTE: network_public_ip_addresses reaches the CREATE-ONLY writer only. That\n> writer already ignores every body change after create (see main.tf), so the\n> field has almost no reach. The day-2 merge writer is an\n> azapi_update_resource, and azapi 2.13.0 does not implement\n> ignore_body_changes on that resource type at all.\n"
  type = object({
    network_public_ip_addresses    = optional(list(string), [])
    authorization_locks            = optional(list(string), [])
    authorization_role_assignments = optional(list(string), [])
    insights_diagnostic_settings   = optional(list(string), [])
  })
  default = {}
}

variable "ip_tags" {
  description = "The IP tags for the public IP address"
  type        = map(string)
  default     = {}
}

variable "ip_version" {
  description = "The IP version to use."
  type        = string
  default     = "IPv4"
}

variable "location" {
  description = "The Azure location where the resources will be deployed."
  type        = string
  default     = ""
}

variable "lock" {
  description = "Controls the Resource Lock configuration for this resource. The following properties can be specified:\n\n- kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n- name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n- notes - (Optional) A note about the lock. If not specified, the module supplies the same note the AzureRM implementation used for the chosen kind.\n"
  type = object({
    kind  = string
    name  = optional(string, null)
    notes = optional(string, null)
  })
  default = null
}

variable "name" {
  description = "Name of public IP address resource"
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "The fully-qualified ARM resource ID of the existing resource group into which the public IP address will be deployed, for example /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-example.\n\nThis input is REQUIRED. Per TFRMFR1 a resource module accepts the existing parent scope as a fully-qualified ID and never constructs it; the module does not accept a resource_group_name alternative and does not create the parent scope.\n"
  type        = string
  default     = ""
}

variable "public_ip_prefix_id" {
  description = "The ID of the public IP prefix to associate with the public IP address."
  type        = string
  default     = null
}

variable "resource_types" {
  description = "AzAPI resource types and API versions used by the module.\n\n- network_public_ip_addresses - Resource type and API version for the public IP address.\n- authorization_locks - Resource type and API version for the management lock.\n- authorization_role_assignments - Resource type and API version for role assignments.\n- insights_diagnostic_settings - Resource type and API version for diagnostic settings.\n- resources_tags - Resource type and API version for the tag replacement action.\n\n> NOTE: the defaults are deliberately the NEWEST versions embedded in the AzAPI\n> provider that this module resolves (2.13.0). azapi's MoveResourceState\n> picks candidateApiVersions[len-1] after a lexicographic sort, so pinning the\n> newest version makes the moved upgrade plan show ZERO type drift. Changing\n> a default away from the newest embedded version reintroduces that drift on the\n> upgrade plan.\n"
  type = object({
    network_public_ip_addresses    = optional(string, "Microsoft.Network/publicIPAddresses@2025-07-01")
    authorization_locks            = optional(string, "Microsoft.Authorization/locks@2020-05-01")
    authorization_role_assignments = optional(string, "Microsoft.Authorization/roleAssignments@2022-04-01")
    insights_diagnostic_settings   = optional(string, "Microsoft.Insights/diagnosticSettings@2021-05-01-preview")
    resources_tags                 = optional(string, "Microsoft.Resources/tags@2021-04-01")
  })
  default = {}
}

variable "retry" {
  description = "The retry configuration applied to the underlying AzAPI resources (public IP address, lock, role assignments, diagnostic settings, tags).\n\n- error_message_regex - (Optional) A list of regular expressions to match against error messages. If any of the regular expressions match, the request will be retried. Defaults to transient ARM errors associated with public IP associations and ScopeLocked while a lock-removal race resolves.\n- interval_seconds - (Optional) The base number of seconds to wait between retries. Defaults to the AzAPI provider default (10).\n- max_interval_seconds - (Optional) The maximum number of seconds to wait between retries. Defaults to the AzAPI provider default (180).\n"
  type = object({
    error_message_regex  = optional(list(string), ["ReferencedResourceNotProvisioned", "AnotherOperationInProgress", "ScopeLocked"])
    interval_seconds     = optional(number, null)
    max_interval_seconds = optional(number, null)
  })
  default = {}
}

variable "reverse_fqdn" {
  description = "The reverse FQDN for the public IP address. This must be a valid FQDN. If you specify a reverse FQDN, you cannot specify a DNS name label. Not all regions support this."
  type        = string
  default     = null
}

variable "role_assignments" {
  description = "A map of role assignments to create on the <RESOURCE>. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (Optional) The name (a lowercase GUID) of the role assignment. If not set, the module derives a GUID from the scope, principal, role and delegated identity. Existing role assignments migrated from the AzureRM implementation keep their server-assigned name; see the lifecycle note in main.tf. A name that you set is used when the assignment is created or replaced, so set a new name if you replace an assignment with a changed principal and want to pick the name yourself.\n- role_definition_id_or_name - The ID or name of the role definition to assign to the principal. Names are resolved at parent_id, including resource-group custom roles and inherited roles. Changing the resolved role on an existing assignment replaces it with a new GUID.\n- principal_id - The ID of the principal to assign the role to. Changing it on an existing assignment replaces it with a new GUID.\n- description - (Optional) The description of the role assignment.\n- skip_service_principal_aad_check - (Optional, deprecated) Preserves the AzureRM request behavior by setting principalType to ServicePrincipal when principal_type is unset. If principal_type is explicitly set, that value takes precedence. Retry behavior is configured with the module's retry input.\n- condition - (Optional) The condition which will be used to scope the role assignment.\n- condition_version - (Optional) The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\n- delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. This field is only used in cross-tenant scenarios. Changing it on an existing assignment replaces it with a new GUID.\n- principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n\n> Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
  type = map(object({
    name                                   = optional(string, null)
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
  description = "The SKU of the public IP address."
  type        = string
  default     = "Standard"
}

variable "sku_tier" {
  description = "The tier of the SKU of the public IP address."
  type        = string
  default     = "Regional"
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "The timeouts applied to the underlying azapi_resource resources (public IP address, lock, role assignments, diagnostic settings).\n\nEach value must be a string parsable as a Go duration (for example \"30s\", \"5m\", \"1h30m\"). When null, this module falls back to the per-resource default that the AzureRM implementation used, so the migration is timeout-neutral. Supplying null for the whole object is equivalent to supplying every member as null.\n\n- create - (Optional) Timeout for create operations.\n- delete - (Optional) Timeout for delete operations.\n- read - (Optional) Timeout for read operations.\n- update - (Optional) Timeout for update operations.\n"
  type = object({
    create = optional(string, null)
    delete = optional(string, null)
    read   = optional(string, null)
    update = optional(string, null)
  })
  default = {}
}

variable "zones" {
  description = "A set of availability zones to use."
  type        = set(number)
  default     = [1, 2, 3]
}
