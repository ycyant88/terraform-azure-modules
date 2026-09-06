variable "customer_managed_key" {
  description = "A map describing customer-managed keys to associate with the resource. This includes the following properties:\n- key_vault_resource_id - The resource ID of the Key Vault where the key is stored.\n- key_name - The name of the key.\n- key_version - (Optional) The version of the key. If not specified, the latest version is used.\n- user_assigned_identity - (Optional) An object representing a user-assigned identity with the following properties:\n  - resource_id - The resource ID of the user-assigned identity.\n"
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
  description = "  A map of diagnostic settings to create on the resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  \n  - name - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.\n  - log_categories - (Optional) A set of log categories to send to the log analytics workspace. Defaults to [].\n  - log_groups - (Optional) A set of log groups to send to the log analytics workspace. Defaults to [\"allLogs\"].\n  - metric_categories - (Optional) A set of metric categories to send to the log analytics workspace. Defaults to [\"AllMetrics\"].\n  - log_analytics_destination_type - (Optional) The destination type for the diagnostic setting. Possible values are Dedicated and AzureDiagnostics. Defaults to Dedicated.\n  - workspace_resource_id - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.\n  - storage_account_resource_id - (Optional) The resource ID of the storage account to send logs and metrics to.\n  - event_hub_authorization_rule_resource_id - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.\n  - event_hub_name - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.\n  - marketplace_partner_resource_id - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic LogsLogs.\n"
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

variable "location" {
  description = "(Required) Specifies the suppored Azure location where the Log Analytics Workspace should exist. Changing this forces a new resource to be created"
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

variable "log_analytics_workspace_allow_resource_only_permissions" {
  description = "(Optional) Specifies if the log Analytics Workspace allow users accessing to data associated with resources they have permission to view, without permission to workspace. Defaults to true."
  type        = bool
  default     = null
}

variable "log_analytics_workspace_cmk_for_query_forced" {
  description = "(Optional) Is Customer Managed Storage mandatory for query management?"
  type        = bool
  default     = null
}

variable "log_analytics_workspace_daily_quota_gb" {
  description = "(Optional) The workspace daily quota for ingestion in GB. Defaults to -1 (unlimited) if omitted."
  type        = number
  default     = null
}

variable "log_analytics_workspace_data_exports" {
  description = "  A map of data exports to create.\n  - name - The name of the data export rule.\n  - table_names - A list of table names to export.\n  - destination_resource_id - The resource ID of the destination (Storage Account or Event Hub).\n  - enabled - (Optional) Whether the data export is enabled. Defaults to true.\n  - event_hub_name - (Optional) The name of the Event Hub. Required if destination_resource_id is an Event Hub Namespace ID.\n"
  type = map(object({
    name                    = string
    table_names             = list(string)
    destination_resource_id = string
    enabled                 = optional(bool, true)
    event_hub_name          = optional(string, null)
  }))
  default = {}
}

variable "log_analytics_workspace_dedicated_cluster_resource_id" {
  description = "(Optional) The resource ID of the dedicated cluster to link to the Log Analytics Workspace."
  type        = string
  default     = null
}

variable "log_analytics_workspace_identity" {
  description = "- identity_ids - (Optional) Specifies a list of user managed identity ids to be assigned. Required if type is UserAssigned.\n- type - (Required) Specifies the identity type of the Log Analytics Workspace. Possible values are SystemAssigned (where Azure will generate a Service Principal for you) and UserAssigned where you can specify the Service Principal IDs in the identity_ids field.\n"
  type = object({
    identity_ids = optional(set(string))
    type         = string
  })
  default = null
}

variable "log_analytics_workspace_internet_ingestion_enabled" {
  description = "(Optional) Should the Log Analytics Workspace support ingestion over the Public Internet? Possible values are true, false, and SecuredByPerimeter. Defaults to false."
  type        = string
  default     = "false"
}

variable "log_analytics_workspace_internet_query_enabled" {
  description = "(Optional) Should the Log Analytics Workspace support querying over the Public Internet? Possible values are true, false, and SecuredByPerimeter. Defaults to false."
  type        = string
  default     = "false"
}

variable "log_analytics_workspace_linked_storage_accounts" {
  description = "  A map of linked storage accounts to create.\n  - data_source_type - The data source type which should be used for this Log Analytics Linked Storage Account. Possible values are CustomLogs, AzureWatson, Query, Ingestion and Alerts.\n  - storage_account_ids - A list of storage account resource IDs to link.\n"
  type = map(object({
    data_source_type    = string
    storage_account_ids = list(string)
  }))
  default = {}
}

variable "log_analytics_workspace_local_authentication_enabled" {
  description = "(Optional) Specifies if the log Analytics workspace should enforce authentication using Azure AD. Defaults to true."
  type        = bool
  default     = true
}

variable "log_analytics_workspace_reservation_capacity_in_gb_per_day" {
  description = "(Optional) The capacity reservation level in GB for this workspace. Possible values are 100, 200, 300, 400, 500, 1000, 2000 and 5000."
  type        = number
  default     = null
}

variable "log_analytics_workspace_retention_in_days" {
  description = "(Optional) The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730."
  type        = number
  default     = null
}

variable "log_analytics_workspace_sku" {
  description = "(Optional) Specifies the SKU of the Log Analytics Workspace. Possible values are Free, PerNode, Premium, Standard, Standalone, Unlimited, CapacityReservation, and PerGB2018 (new SKU as of 2018-04-03). Defaults to PerGB2018."
  type        = string
  default     = null
}

variable "log_analytics_workspace_tables" {
  description = "A map of tables to create in the Log Analytics Workspace.\n- name - (Required) The name of the table.\n- resource_id - (Optional) The resource ID of the Log Analytics Workspace where the table will be created. If not specified, the table will be created in the Log Analytics Workspace created by this module.\n- retention_in_days - (Optional) The retention period for the table in days.\n- total_retention_in_days - (Optional) The total retention period for the table in days.\n- plan - (Optional) The plan for the table. Possible values are Basic and Analytics.\n- schema - (Optional) The schema of the table.\n  - name - (Optional) The name of the schema.\n  - description - (Optional) The description of the schema.\n  - columns - (Optional) A list of columns in the schema.\n    - name - (Required) The name of the column.\n    - type - (Required) The type of the column. Possible values are boolean, datetime, dynamic, guid, int, long, real, and string.\n"
  type = map(object({
    name                    = string
    resource_id             = optional(string)
    retention_in_days       = optional(number)
    total_retention_in_days = optional(number)
    plan                    = optional(string)
    schema = optional(object({
      name        = optional(string)
      description = optional(string)
      columns = optional(list(object({
        name = string
        type = string
      })), [])
    }))
  }))
  default = {}
}

variable "log_analytics_workspace_tables_update" {
  description = "A map of tables to update in the Log Analytics Workspace. This is useful for updating default tables like Heartbeat or Syslog, or for adding new columns to existing tables.\n- name - (Required) The name of the table.\n- resource_id - (Optional) The resource ID of the Log Analytics Workspace where the table exists. If not specified, the table is assumed to be in the Log Analytics Workspace created by this module.\n- retention_in_days - (Optional) The retention period for the table in days.\n- total_retention_in_days - (Optional) The total retention period for the table in days.\n- plan - (Optional) The plan for the table. Possible values are Basic and Analytics.\n- schema - (Optional) The schema of the table. This can be used to add new columns to the table.\n  - name - (Optional) The name of the schema.\n  - description - (Optional) The description of the schema.\n  - columns - (Optional) A list of columns in the schema.\n    - name - (Required) The name of the column.\n    - type - (Required) The type of the column. Possible values are boolean, datetime, dynamic, guid, int, long, real, and string.\n\n> Note: Removing a table from this map (destroying the update resource) does not revert the changes made to the table (e.g. removing columns). It simply stops managing the resource. To remove a column, you must explicitly update the schema with the column removed before removing the table from this map.\n"
  type = map(object({
    name                    = string
    resource_id             = optional(string)
    retention_in_days       = optional(number)
    total_retention_in_days = optional(number)
    plan                    = optional(string)
    schema = optional(object({
      name        = optional(string)
      description = optional(string)
      columns = optional(list(object({
        name = string
        type = string
      })), [])
    }))
  }))
  default = {}
}

variable "log_analytics_workspace_timeouts" {
  description = " - create - (Defaults to 30 minutes) Used when creating the Log Analytics Workspace.\n - delete - (Defaults to 30 minutes) Used when deleting the Log Analytics Workspace.\n - read - (Defaults to 5 minutes) Used when retrieving the Log Analytics Workspace.\n - update - (Defaults to 30 minutes) Used when updating the Log Analytics Workspace.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}

variable "monitor_private_link_scope" {
  description = "  A map of Monitor Private Link Scopes to create. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  \n  - name - (Optional) The name of the Monitor Private Link Scope. One will be generated if not set.\n  - resource_id - (Required) The resource ID of the Resource Group where the Monitor Private Link Scope will be created.\n  - ingestion_access_mode - (Optional) The ingestion access mode for the Monitor Private Link Scope. Possible values are PrivateOnly and Open. Defaults to PrivateOnly.\n  - query_access_mode - (Optional) The query access mode for the Monitor Private Link Scope. Possible values are PrivateOnly and Open. Defaults to PrivateOnly.\n  - exclusions - (Optional) A list of exclusions to apply to the Monitor Private Link Scope.\n    - ingestion_access_mode - (Optional) The ingestion access mode for the exclusion. Possible values are PrivateOnly and Open. Defaults to PrivateOnly.\n    - query_access_mode - (Optional) The query access mode for the exclusion. Possible values are PrivateOnly and Open. Defaults to PrivateOnly.\n    - private_endpoint_connection_name - (Required) The name of the private endpoint connection to exclude.\n  - lock - (Optional) Controls the Resource Lock configuration for this resource. The following properties can be specified:\n    - kind - (Required) The type of lock. Possible values are CanNotDelete and ReadOnly.\n    - name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n\n  > Note: If the map key matches a key in var.private_endpoints, the private endpoint connection created by this module will be automatically added to the exclusions list unless monitor_private_link_scope_exclusion.exclude is set to false in the private endpoint configuration. The access modes default to PrivateOnly but can be customized via monitor_private_link_scope_exclusion. You can also manually add an exclusion with the same private_endpoint_connection_name in the exclusions list of this variable, but using the private endpoint configuration is recommended.\n"
  type = map(object({
    name                  = optional(string)
    resource_id           = string
    ingestion_access_mode = optional(string, "PrivateOnly")
    query_access_mode     = optional(string, "PrivateOnly")
    exclusions = optional(list(object({
      ingestion_access_mode            = optional(string, "PrivateOnly")
      query_access_mode                = optional(string, "PrivateOnly")
      private_endpoint_connection_name = string
    })), [])
    lock = optional(object({
      kind = string
      name = optional(string, null)
    }))
  }))
  default = {}
}

variable "monitor_private_link_scoped_resource" {
  description = " - name - Defaults to the name of the Log Analytics Workspace.\n - resource_id - Resource ID of an existing Monitor Private Link Scope to connect to.\n - exclusions - (Optional) A list of exclusions to apply to the Monitor Private Link Scope.\n    - ingestion_access_mode - (Optional) The ingestion access mode for the exclusion. Possible values are PrivateOnly and Open. Defaults to PrivateOnly.\n    - query_access_mode - (Optional) The query access mode for the exclusion. Possible values are PrivateOnly and Open. Defaults to PrivateOnly.\n    - private_endpoint_connection_name - (Required) The name of the private endpoint connection to exclude.\n"
  type = map(object({
    name        = optional(string)
    resource_id = string
    exclusions = optional(list(object({
      ingestion_access_mode            = optional(string, "PrivateOnly")
      query_access_mode                = optional(string, "PrivateOnly")
      private_endpoint_connection_name = string
    })), [])
  }))
  default = {}
}

variable "monitor_private_link_scoped_service_name" {
  description = "The name of the service to connect to the Monitor Private Link Scope."
  type        = string
  default     = null
}

variable "name" {
  description = "Specifies the name of the Log Analytics Workspace. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "network_security_perimeter_association" {
  description = "(Optional) The Network Security Perimeter (NSP) association configuration.\n- resource_id - (Required) The resource ID of the Network Security Perimeter.\n- profile_name - (Required) The name of the NSP profile to associate with.\n- access_mode - (Optional) The access mode for the association. Possible values are Learning, Enforced, and Audit. Defaults to Learning.\n"
  type = object({
    resource_id  = string
    profile_name = string
    access_mode  = optional(string, "Learning")
  })
  default = null
}

variable "private_endpoint_extensions" {
  description = "  A map of extensions to apply to the private endpoints. The map key must match the key in var.private_endpoints.\n  \n  - monitor_private_link_scope_key - (Optional) The key of the Monitor Private Link Scope to associate with the private endpoint.\n  - monitor_private_link_scope_exclusion - (Optional) The exclusion configuration for the Monitor Private Link Scope.\n    - exclude - (Optional) Whether to exclude the private endpoint from the Monitor Private Link Scope. Defaults to true.\n    - ingestion_access_mode - (Optional) The ingestion access mode for the exclusion. Possible values are PrivateOnly and Open. Defaults to PrivateOnly.\n    - query_access_mode - (Optional) The query access mode for the exclusion. Possible values are PrivateOnly and Open. Defaults to PrivateOnly.\n  - manage_dns_zone_group - (Optional) Whether to manage private DNS zone groups with this module. If set to false, you must manage private DNS zone groups externally, e.g. using Azure Policy. Defaults to true.\n"
  type = map(object({
    monitor_private_link_scope_key = optional(string, null)
    monitor_private_link_scope_exclusion = optional(object({
      exclude               = optional(bool, true)
      ingestion_access_mode = optional(string, "PrivateOnly")
      query_access_mode     = optional(string, "PrivateOnly")
    }), null)
    manage_dns_zone_group = optional(bool, true)
  }))
  default = {}
}

variable "private_endpoints" {
  description = "  A map of private endpoints to create on the resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  \n  - name - (Optional) The name of the private endpoint. One will be generated if not set.\n  - role_assignments - (Optional) A map of role assignments to create on the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time. See var.role_assignments for more information.\n  - lock - (Optional) The lock level to apply to the private endpoint. Default is None. Possible values are None, CanNotDelete, and ReadOnly.\n  - tags - (Optional) A mapping of tags to assign to the private endpoint.\n  - subnet_resource_id - The resource ID of the subnet to deploy the private endpoint in.\n  - private_dns_zone_group_name - (Optional) The name of the private DNS zone group. One will be generated if not set.\n  - private_dns_zone_resource_ids - (Optional) A set of resource IDs of private DNS zones to associate with the private endpoint. If not set, no zone groups will be created and the private endpoint will not be associated with any private DNS zones. DNS records must be managed external to this module.\n  - application_security_group_resource_ids - (Optional) A map of resource IDs of application security groups to associate with the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  - private_service_connection_name - (Optional) The name of the private service connection. One will be generated if not set.\n  - network_interface_name - (Optional) The name of the network interface. One will be generated if not set.\n  - location - (Optional) The Azure location where the resources will be deployed. Defaults to the location of the resource group.\n  - resource_group_name - (Optional) The resource group where the resources will be deployed. Defaults to the resource group of the Key Vault.\n  - ip_configurations - (Optional) A map of IP configurations to create on the private endpoint. If not specified the platform will create one. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n    - name - The name of the IP configuration.\n    - private_ip_address - The private IP address of the IP configuration.\n"
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

variable "resource_group_name" {
  description = "(Required) Specifies the name of the Resource Group in which the Log Analytics Workspace should exist. Changing this forces a new resource to be created"
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "  A map of role assignments to create on the <RESOURCE>. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  \n  - role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n  - principal_id - The ID of the principal to assign the role to.\n  - description - (Optional) The description of the role assignment.\n  - skip_service_principal_aad_check - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n  - condition - (Optional) The condition which will be used to scope the role assignment.\n  - condition_version - (Optional) The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\n  - delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\n  - principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n  \n  > Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
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

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}
