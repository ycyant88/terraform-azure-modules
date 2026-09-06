variable "active_directory_administrator" {
  description = "- identity_id - (Optional) The resource ID of the identity used for AAD Authentication. Defaults to first identitiy assigned to the server.\n- login - (Required) The login name of the principal to set as the server administrator.\n- object_id - (Required) The ID of the principal to set as the server administrator. For a managed identity, this should be the Client ID of the identity.\n- tenant_id - (Required) The Azure Tenant ID.\n\n---\ntimeouts block supports the following:\n- create - (Defaults to 30 minutes) Used when creating the MySQL Flexible Server Active Directory Administrator.\n- read - (Defaults to 5 minutes) Used when retrieving the MySQL Flexible Server Active Directory Administrator.\n- update - (Defaults to 30 minutes) Used when updating the MySQL Flexible Server Active Directory Administrator.\n- delete - (Defaults to 30 minutes) Used when deleting the MySQL Flexible Server Active Directory Administrator.\n"
  type = object({
    identity_id = optional(string)
    login       = string
    object_id   = string
    tenant_id   = string
    timeouts = optional(object({
      create = optional(string)
      read   = optional(string)
      update = optional(string)
      delete = optional(string)
    }))
  })
  default = null
}

variable "active_directory_administrator_wait_seconds" {
  description = "Optional delay (in seconds) to wait after server creation before attempting to configure the Active Directory Administrator. Helps mitigate transient InternalServerError responses sometimes observed immediately after server provisioning while identities propagate. Set, for example, to 60 or 120 if you encounter intermittent creation failures."
  type        = number
  default     = 0
}

variable "administrator_login" {
  description = "(Optional) The Administrator login for the MySQL Flexible Server. Required when create_mode is Default. Changing this forces a new MySQL Flexible Server to be created."
  type        = string
  default     = null
}

variable "administrator_password" {
  description = "(Optional) The Password associated with the administrator_login for the MySQL Flexible Server. Required when create_mode is Default."
  type        = string
  default     = null
}

variable "administrator_password_wo" {
  description = "(Optional) Write-only administrator password for MySQL Flexible Server. Avoids storing password in state. Mutually exclusive with administrator_password."
  type        = string
  default     = null
}

variable "administrator_password_wo_version" {
  description = "(Optional) Version of the write-only administrator password. Used to rotate password."
  type        = number
  default     = null
}

variable "backup_retention_days" {
  description = "(Optional) The backup retention days for the MySQL Flexible Server. Possible values are between 1 and 35 days. Defaults to 7."
  type        = number
  default     = null
}

variable "create_mode" {
  description = "(Optional)The creation mode which can be used to restore or replicate existing servers. Possible values are Default, PointInTimeRestore, GeoRestore, and Replica. Changing this forces a new MySQL Flexible Server to be created."
  type        = string
  default     = null
}

variable "customer_managed_key" {
  description = "A map describing customer-managed keys to associate with the resource. This includes the following properties:\n- key_vault_key_id - (Required) The ID of the Key Vault Key..\n- geo_backup_key_vault_key_id - (Optional) The ID of the geo backup Key Vault Key\n- geo_backup_user_assigned_identity_id - (Optional) The geo backup user managed identity id for a Customer Managed Key. Should be added with identity_ids\n- primary_user_assigned_identity_id - (Optional) Specifies the primary user managed identity id for a Customer Managed Key. Should be added with identity_ids\n"
  type = object({
    key_vault_key_id                     = string
    geo_backup_key_vault_key_id          = optional(string)
    geo_backup_user_assigned_identity_id = optional(string)
    primary_user_assigned_identity_id    = optional(string)
  })
  default = null
}

variable "databases" {
  description = "- charset - (Required) Specifies the Charset for the MySQL Database, which needs [to be a valid MySQL Charset](https://dev.mysql.com/doc/refman/5.7/en/charset-charsets.html). Changing this forces a new resource to be created.\n- collation - (Required) Specifies the Collation for the MySQL Database, which needs [to be a valid MySQL Collation](https://dev.mysql.com/doc/refman/5.7/en/charset-mysql.html). Changing this forces a new resource to be created.\n- name - (Required) Specifies the name of the MySQL Database, which needs [to be a valid MySQL identifier](https://dev.mysql.com/doc/refman/5.7/en/identifiers.html). Changing this forces a new resource to be created.\n\n---\ntimeouts block supports the following:\n- create - (Defaults to 60 minutes) Used when creating the MySQL Database.\n- delete - (Defaults to 60 minutes) Used when deleting the MySQL Database.\n- read - (Defaults to 5 minutes) Used when retrieving the MySQL Database.\n"
  type = map(object({
    charset   = string
    collation = string
    name      = string
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
    }))
  }))
  default = {}
}

variable "delegated_subnet_id" {
  description = "(Optional) The ID of the virtual network subnet to create the MySQL Flexible Server. Changing this forces a new MySQL Flexible Server to be created."
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

variable "geo_redundant_backup_enabled" {
  description = "(Optional) Should geo redundant backup enabled? Defaults to true. Changing this forces a new MySQL Flexible Server to be created."
  type        = bool
  default     = true
}

variable "high_availability" {
  description = "- mode - (Required) The high availability mode for the MySQL Flexible Server. Only ZoneRedundant is supported. See: https://azure.github.io/Azure-Proactive-Resiliency-Library-v2/azure-resources/DBforMySQL/flexibleServers/#enable-ha-with-zone-redundancy\n- standby_availability_zone - (Optional) Specifies the Availability Zone in which the standby Flexible Server should be located. Possible values are 1, 2 and 3.\n"
  type = object({
    mode                      = string
    standby_availability_zone = optional(string)
  })
  default = { "mode" : "ZoneRedundant", "standby_availability_zone" : null }
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

variable "maintenance_window" {
  description = "- day_of_week - (Optional) The day of week for maintenance window. Defaults to 0.\n- start_hour - (Optional) The start hour for maintenance window. Defaults to 0.\n- start_minute - (Optional) The start minute for maintenance window. Defaults to 0.\n"
  type = object({
    day_of_week  = optional(string)
    start_hour   = optional(number)
    start_minute = optional(number)
  })
  default = { "day_of_week" : "0" }
}

variable "managed_identities" {
  description = "Managed identities to be created for the resource."
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default = {}
}

variable "mysql_version" {
  description = "(Optional) The version of the MySQL Flexible Server to use. Possible values are 5.7, and 8.0.21. Changing this forces a new MySQL Flexible Server to be created."
  type        = string
  default     = null
}

variable "name" {
  description = "The name of the resource."
  type        = string
  default     = ""
}

variable "point_in_time_restore_time_in_utc" {
  description = "(Optional) The point in time to restore from creation_source_server_id when create_mode is PointInTimeRestore. Changing this forces a new MySQL Flexible Server to be created."
  type        = string
  default     = null
}

variable "private_dns_zone_id" {
  description = "(Optional) The ID of the private DNS zone to create the MySQL Flexible Server. Changing this forces a new MySQL Flexible Server to be created."
  type        = string
  default     = null
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

variable "public_network_access" {
  description = "(Optional) Whether public network access is allowed for the MySQL Flexible Server. Possible values are 'Enabled' or 'Disabled'. Defaults to 'Disabled'."
  type        = string
  default     = "Disabled"
}

variable "replication_role" {
  description = "(Optional) The replication role. Possible value is None."
  type        = string
  default     = null
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "  A map of role assignments to create on the MySQL Flexible Server. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n  - role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n  - principal_id - The ID of the principal to assign the role to.\n  - description - (Optional) The description of the role assignment.\n  - skip_service_principal_aad_check - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n  - condition - (Optional) The condition which will be used to scope the role assignment.\n  - condition_version - (Optional) The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\n  - delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\n  - principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n\n  > Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
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

variable "server_configuration" {
  description = "    (Optional) A configuration block supports the following:\n    object({\n        name = (Required) Specifies the name of the MySQL Flexible Server Configuration, which needs to be a valid MySQL configuration name. Changing this forces a new resource to be created.\n        value = (Required) Specifies the value of the MySQL Flexible Server Configuration. See the MySQL documentation for valid values.\n    })\n"
  type = map(object({
    name  = string
    value = string
  }))
  default = {}
}

variable "sku_name" {
  description = "(Optional) The SKU Name for the MySQL Flexible Server."
  type        = string
  default     = null
}

variable "source_server_id" {
  description = "(Optional)The resource ID of the source MySQL Flexible Server to be restored. Required when create_mode is PointInTimeRestore, GeoRestore, and Replica. Changing this forces a new MySQL Flexible Server to be created."
  type        = string
  default     = null
}

variable "storage" {
  description = "- auto_grow_enabled - (Optional) Should Storage Auto Grow be enabled? Defaults to true.\n- io_scaling_enabled - (Optional) Should IOPS be scaled automatically? If true, iops can not be set. Defaults to false.\n- iops - (Optional) The storage IOPS for the MySQL Flexible Server. Possible values are between 360 and 20000.\n- size_gb - (Optional) The max storage allowed for the MySQL Flexible Server. Possible values are between 20 and 16384.\n"
  type = object({
    auto_grow_enabled  = optional(bool)
    io_scaling_enabled = optional(bool)
    iops               = optional(number)
    size_gb            = optional(number)
  })
  default = null
}

variable "tags" {
  description = "(Optional) Tags which should be assigned to the MySQL Flexible Server."
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "- create - (Defaults to 1 hour) Used when creating the MySQL Flexible Server.\n- delete - (Defaults to 1 hour) Used when deleting the MySQL Flexible Server.\n- read - (Defaults to 5 minutes) Used when retrieving the MySQL Flexible Server.\n- update - (Defaults to 1 hour) Used when updating the MySQL Flexible Server.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}

variable "zone" {
  description = "(Optional) Specifies the Availability Zone in which this MySQL Flexible Server should be located. Possible values are 1, 2 and 3."
  type        = string
  default     = null
}
