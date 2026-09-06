variable "administrator_login" {
  description = "(Optional) The Administrator login for the PostgreSQL Flexible Server. Required when create_mode is Default and authentication.password_auth_enabled is true."
  type        = string
  default     = null
}

variable "administrator_password" {
  description = "(Optional) The Password associated with the administrator_login for the PostgreSQL Flexible Server. Required when create_mode is Default and authentication.password_auth_enabled is true."
  type        = string
  default     = null
}

variable "authentication" {
  description = "- active_directory_auth_enabled - (Optional)  Whether or not Active Directory authentication is allowed to access the PostgreSQL Flexible Server. Defaults to false.\n- password_auth_enabled - (Optional) Whether or not password authentication is allowed to access the PostgreSQL Flexible Server. Defaults to true.\n- tenant_id - (Optional) The Tenant ID of the Azure Active Directory which is used by the Active Directory authentication. active_directory_auth_enabled must be set to true.\n"
  type = object({
    active_directory_auth_enabled = optional(bool)
    password_auth_enabled         = optional(bool)
    tenant_id                     = optional(string)
  })
  default = null
}

variable "auto_grow_enabled" {
  description = "(Optional) Is the storage auto grow for PostgreSQL Flexible Server enabled? Defaults to false."
  type        = bool
  default     = null
}

variable "backup_retention_days" {
  description = "(Optional) The backup retention days for the PostgreSQL Flexible Server. Possible values are between 7 and 35 days."
  type        = number
  default     = null
}

variable "create_mode" {
  description = "(Optional) The creation mode which can be used to restore or replicate existing servers. Possible values are Default, GeoRestore, PointInTimeRestore, Replica and Update."
  type        = string
  default     = null
}

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

variable "databases" {
  description = "- name - (Required) Specifies the name of the PostgreSQL Database, which needs [to be a valid PostgreSQL identifier](https://www.postgresql.org/docs/current/static/sql-syntax-lexical.html#SQL-SYNTAX-IDENTIFIERS). Changing this forces a new resource to be created.\n- charset - (Optional)  Specifies the Charset for the PostgreSQL Database, which needs [to be a valid PostgreSQL Charset](https://www.postgresql.org/docs/current/static/multibyte.html). Changing this forces a new resource to be created.\n- collation - (Optional) Specifies the Collation for the PostgreSQL Database, which needs [to be a valid PostgreSQL Collation](https://www.postgresql.org/docs/current/static/collation.html). Note that Microsoft uses different [notation](https://msdn.microsoft.com/library/windows/desktop/dd373814.aspx)\n\n\n---\ntimeouts block supports the following:\n- create - (Defaults to 60 minutes) Used when creating the PostgreSQL Database.\n- delete - (Defaults to 60 minutes) Used when deleting the PostgreSQL Database.\n- read - (Defaults to 5 minutes) Used when retrieving the PostgreSQL Database.\n"
  type = map(object({
    name      = string
    charset   = optional(string)
    collation = optional(string)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
    }))
  }))
  default = {}
}

variable "delegated_subnet_id" {
  description = "(Optional) The ID of the virtual network subnet to create the PostgreSQL Flexible Server. The provided subnet should not have any other resource deployed in it and this subnet will be delegated to the PostgreSQL Flexible Server, if not already delegated. Changing this forces a new PostgreSQL Flexible Server to be created."
  type        = string
  default     = null
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

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "geo_redundant_backup_enabled" {
  description = "(Optional) Is Geo-Redundant backup enabled on the PostgreSQL Flexible Server. Defaults to false. Changing this forces a new PostgreSQL Flexible Server to be created."
  type        = bool
  default     = null
}

variable "high_availability" {
  description = "- mode - (Required) The high availability mode for the PostgreSQL Flexible Server. Possible value are SameZone or ZoneRedundant.\n- standby_availability_zone - (Optional) Specifies the Availability Zone in which the standby Flexible Server should be located.\n"
  type = object({
    mode                      = string
    standby_availability_zone = optional(string)
  })
  default = { "mode" : "ZoneRedundant" }
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

variable "maintenance_window" {
  description = "- day_of_week - (Optional) The day of week for maintenance window, where the week starts on a Sunday, i.e. Sunday = 0, Monday = 1. Defaults to 0.\n- start_hour - (Optional) The start hour for maintenance window. Defaults to 0.\n- start_minute - (Optional) The start minute for maintenance window. Defaults to 0.\n"
  type = object({
    day_of_week  = optional(string)
    start_hour   = optional(number)
    start_minute = optional(number)
  })
  default = { "day_of_week" : "0", "start_hour" : 0, "start_minute" : 0 }
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
  description = "The name of the this resource."
  type        = string
  default     = ""
}

variable "point_in_time_restore_time_in_utc" {
  description = "(Optional) The point in time to restore from source_server_id when create_mode is GeoRestore, PointInTimeRestore. Changing this forces a new PostgreSQL Flexible Server to be created."
  type        = string
  default     = null
}

variable "private_dns_zone_id" {
  description = "(Optional) The ID of the private DNS zone to create the PostgreSQL Flexible Server."
  type        = string
  default     = null
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

variable "public_network_access_enabled" {
  description = "(Optional) Whether the server is publicly accessible.  Defaults to false."
  type        = bool
  default     = false
}

variable "replication_role" {
  description = "(Optional) The replication role for the PostgreSQL Flexible Server. Possible value is None."
  type        = string
  default     = null
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

variable "server_version" {
  description = "(Optional) The version of PostgreSQL Flexible Server to use. Possible values are 11,12, 13, 14, 15 and 16. Required when create_mode is Default."
  type        = string
  default     = null
}

variable "sku_name" {
  description = "(Optional) The SKU Name for the PostgreSQL Flexible Server. The name of the SKU, follows the tier + name pattern (e.g. B_Standard_B1ms, GP_Standard_D2s_v3, MO_Standard_E4s_v3)."
  type        = string
  default     = null
}

variable "source_server_id" {
  description = "(Optional) The resource ID of the source PostgreSQL Flexible Server to be restored. Required when create_mode is GeoRestore, PointInTimeRestore or Replica. Changing this forces a new PostgreSQL Flexible Server to be created."
  type        = string
  default     = null
}

variable "storage_mb" {
  description = "(Optional) The max storage allowed for the PostgreSQL Flexible Server. Possible values are 32768, 65536, 131072, 262144, 524288, 1048576, 2097152, 4193280, 4194304, 8388608, 16777216 and 33553408."
  type        = number
  default     = null
}

variable "storage_tier" {
  description = "(Optional) The storage tier for the PostgreSQL Flexible Server. Possible values are P4, P6, P10, P15, P20, P30, P40, P50, P60, P70 or P80."
  type        = string
  default     = null
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "- create - (Defaults to 1 hour) Used when creating the PostgreSQL Flexible Server.\n- delete - (Defaults to 1 hour) Used when deleting the PostgreSQL Flexible Server.\n- read - (Defaults to 5 minutes) Used when retrieving the PostgreSQL Flexible Server.\n- update - (Defaults to 1 hour) Used when updating the PostgreSQL Flexible Server.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}

variable "zone" {
  description = "(Optional) Specifies the Availability Zone in which the PostgreSQL Flexible Server should be located."
  type        = string
  default     = null
}
