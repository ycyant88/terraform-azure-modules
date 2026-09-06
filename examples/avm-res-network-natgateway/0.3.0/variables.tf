variable "diagnostic_settings" {
  description = "A map of diagnostic settings to create on the NAT Gateway. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.\n- logs - (Optional) A set of log configuration objects. Each object may specify:\n  - category - (Optional) The name of a Diagnostic Log Category for this resource.\n  - category_group - (Optional) The name of a Diagnostic Log Category Group for this resource.\n  - enabled - (Optional) Whether this log category is enabled. Defaults to true.\n  - retention_policy - (Optional) A retention policy object:\n    - days - (Optional) The number of days for which this Retention Policy should apply. Defaults to 0.\n    - enabled - (Optional) Whether the Retention Policy is enabled. Defaults to false.\n- metrics - (Optional) A set of metric configuration objects. Each object may specify:\n  - category - (Optional) The name of a Diagnostic Metric Category for this resource.\n  - enabled - (Optional) Whether this metric category is enabled. Defaults to true.\n  - retention_policy - (Optional) A retention policy object:\n    - days - (Optional) The number of days for which this Retention Policy should apply. Defaults to 0.\n    - enabled - (Optional) Whether the Retention Policy is enabled. Defaults to false.\n- log_analytics_destination_type - (Optional) The destination type for the diagnostic setting. Possible values are Dedicated and AzureDiagnostics. Defaults to Dedicated.\n- workspace_resource_id - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.\n- storage_account_resource_id - (Optional) The resource ID of the storage account to send logs and metrics to.\n- event_hub_authorization_rule_resource_id - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.\n- event_hub_name - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.\n- marketplace_partner_resource_id - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic Logs.\n"
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

variable "idle_timeout_in_minutes" {
  description = "(Optional) The idle timeout which should be used in minutes. Defaults to 4."
  type        = number
  default     = 4
}

variable "location" {
  description = "(Required) Specifies the supported Azure location where the NAT Gateway should exist. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "lock" {
  description = "  Controls the Resource Lock configuration for this resource. The following properties can be specified:\n  \n  - kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n  - name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n"
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "name" {
  description = "(Required) Specifies the name of the NAT Gateway. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "(Required) The resource ID of the Resource Group in which the NAT Gateway should exist. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "public_ip_configuration" {
  description = "This map describes the public IP configuration. Keys in this map should match keys in public_ips.\n\n- allocation_method       = (Optional) - Defines the allocation method for this IP address. Possible values are Static or Dynamic. Defaults to Static.\n- ddos_protection_mode    = (Optional) - The DDoS protection mode of the public IP. Possible values are Disabled, Enabled, and VirtualNetworkInherited. Defaults to VirtualNetworkInherited.\n- ddos_protection_plan_id = (Optional) - The ID of DDoS protection plan associated with the public IP. ddos_protection_plan_id can only be set when ddos_protection_mode is Enabled\n- domain_name_label       = (Optional) - Label for the Domain Name. Will be used to make up the FQDN. If a domain name label is specified, an A DNS record is created for the public IP in the Microsoft Azure DNS system.\n- idle_timeout_in_minutes = (Optional) - Specifies the timeout for the TCP idle connection. The value can be set between 4 and 30 minutes. Defaults to 30.\n- inherit_tags            = (Optional) - Defaults to false.  Set this to false if only the tags defined on this resource should be applied.\n- ip_version              = (Optional) - The IP Version to use, IPv6 or IPv4. Changing this forces a new resource to be created. Only static IP address allocation is supported for IPv6. Defaults to IPv4.\n- lock                    = (Optional) - The lock level to apply to the public IP. Default is null.\n- sku                     = (Optional) - The SKU of the Public IP. Accepted values are Basic, Standard and StandardV2. Defaults to StandardV2.\n- sku_tier                = (Optional) - The SKU tier of the Public IP. Accepted values are Global and Regional. Defaults to Regional.\n- tags                    = (Optional) - A mapping of tags to assign to the resource.    \n- zones                   = (Optional) - A list of zones where this public IP should be deployed. Defaults to 3 zones.\n  \n  Example Input:\n\nhcl\npublic_ip_configuration = {\n  ip_1 = {\n    idle_timeout_in_minutes = 15\n    sku                     = \"StandardV2\"\n  },\n}\n\n"
  type = map(object({
    allocation_method       = optional(string, "Static")
    ddos_protection_mode    = optional(string, "VirtualNetworkInherited")
    ddos_protection_plan_id = optional(string)
    domain_name_label       = optional(string)
    idle_timeout_in_minutes = optional(number, 30)
    inherit_tags            = optional(bool, false)
    ip_version              = optional(string, "IPv4")
    lock = optional(object({
      kind = string
      name = optional(string, null)
    }), null)
    sku      = optional(string, "StandardV2")
    sku_tier = optional(string, "Regional")
    tags     = optional(map(string), null)
    zones    = optional(list(string), ["1", "2", "3"])
  }))
  default = {}
}

variable "public_ip_prefix_resource_ids" {
  description = "(Optional) A list of existing Public IP Prefix resource IDs to associate with the NAT Gateway. These must be IPv4 prefixes."
  type        = set(string)
  default     = []
}

variable "public_ip_prefix_v6_resource_ids" {
  description = "(Optional) A list of existing Public IP Prefix resource IDs (IPv6) to associate with the NAT Gateway. Only supported when sku_name is StandardV2."
  type        = set(string)
  default     = []
}

variable "public_ip_resource_ids" {
  description = "(Optional) A list of existing Public IP resource IDs to associate with the NAT Gateway. These must be IPv4 addresses."
  type        = set(string)
  default     = []
}

variable "public_ip_v6_resource_ids" {
  description = "(Optional) A list of existing Public IP resource IDs (IPv6) to associate with the NAT Gateway. Only supported when sku_name is StandardV2."
  type        = set(string)
  default     = []
}

variable "public_ips" {
  description = "This map will define between 1 and 16 public IP's to assign to this NAT Gateway. The public_ip_configuration is used to configure common elements across all public IPs.\"\n\n- <map key> - The unique arbitrary map key is used by terraform to plan the number of public IP's to create\n  - name - The name to use for this public IP resource\n\nExample Input: \n\nhcl\npublic_ips = {\n  ip_1 = {\n    name = \"nat_gw_pip_1\"\n  }\n}\n\n"
  type = map(object({
    name = string
  }))
  default = {}
}

variable "role_assignments" {
  description = "  A map of role assignments to create on the <RESOURCE>. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  \n  - role_definition_id_or_name - The ID of the role definition to assign to the principal.\n  - principal_id - The ID of the principal to assign the role to.\n  - description - (Optional) The description of the role assignment.\n  - skip_service_principal_aad_check - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n  - condition - (Optional) The condition which will be used to scope the role assignment.\n  - condition_version - (Optional) The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\n  - delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\n  - principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n  \n  > Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
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

variable "sku_name" {
  description = "(Optional) The SKU which should be used. Possible values are Standard and StandardV2. Defaults to StandardV2."
  type        = string
  default     = "StandardV2"
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "- create - (Defaults to 60 minutes) Used when creating the NAT Gateway.\n- delete - (Defaults to 60 minutes) Used when deleting the NAT Gateway.\n- read - (Defaults to 5 minutes) Used when retrieving the NAT Gateway.\n- update - (Defaults to 60 minutes) Used when updating the NAT Gateway.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}

variable "zones" {
  description = "(Optional) A list of Availability Zones in which this NAT Gateway should be located. Changing this forces a new NAT Gateway to be created. If sku_name is StandardV2, this variable is ignored and defaults to [\"1\", \"2\", \"3\"]."
  type        = set(string)
  default     = null
}
