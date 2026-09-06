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
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see https://aka.ms/avm/telemetryinfo.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "firewall_ip_configuration" {
  description = "- name - (Required) Specifies the name of the IP Configuration.\n- public_ip_address_id - (Optional) The ID of the Public IP Address associated with the firewall.\n- subnet_id - (Optional) Reference to the subnet associated with the IP Configuration. Changing this forces a new resource to be created.\n"
  type = list(object({
    name                 = string
    public_ip_address_id = optional(string)
    subnet_id            = optional(string)
  }))
  default = null
}

variable "firewall_management_ip_configuration" {
  description = "- name - (Required) Specifies the name of the IP Configuration.\n- public_ip_address_id - (Required) The ID of the Public IP Address associated with the firewall.\n- subnet_id - (Required) Reference to the subnet associated with the IP Configuration. Changing this forces a new resource to be created.\n"
  type = object({
    name                 = string
    public_ip_address_id = string
    subnet_id            = string
  })
  default = null
}

variable "firewall_policy_id" {
  description = "(Optional) The ID of the Firewall Policy applied to this Firewall."
  type        = string
  default     = null
}

variable "firewall_private_ip_ranges" {
  description = "(Optional) A list of SNAT private CIDR IP ranges, or the special string IANAPrivateRanges, which indicates Azure Firewall does not SNAT when the destination IP address is a private range per IANA RFC 1918."
  type        = set(string)
  default     = null
}

variable "firewall_sku_name" {
  description = "(Required) SKU name of the Firewall. Possible values are AZFW_Hub and AZFW_VNet. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "firewall_sku_tier" {
  description = "(Required) SKU tier of the Firewall. Possible values are Premium, Standard and Basic."
  type        = string
  default     = ""
}

variable "firewall_timeouts" {
  description = "- create - (Defaults to 90 minutes) Used when creating the Firewall.\n- delete - (Defaults to 90 minutes) Used when deleting the Firewall.\n- read - (Defaults to 5 minutes) Used when retrieving the Firewall.\n- update - (Defaults to 90 minutes) Used when updating the Firewall.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}

variable "firewall_virtual_hub" {
  description = "- public_ip_count - (Optional) Specifies the number of public IPs to assign to the Firewall. Defaults to 1.\n- virtual_hub_id - (Required) Specifies the ID of the Virtual Hub where the Firewall resides in.\n"
  type = object({
    public_ip_count = optional(number)
    virtual_hub_id  = string
  })
  default = null
}

variable "firewall_zones" {
  description = "(Required) Specifies a list of Availability Zones in which this Azure Firewall should be located. Changing this forces a new Azure Firewall to be created."
  type        = set(string)
  default     = ["1", "2", "3"]
}

variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
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
  description = "(Required) Specifies the name of the Firewall. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the resource. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "  A map of role assignments to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  \n  - role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n  - principal_id - The ID of the principal to assign the role to.\n  - description - The description of the role assignment.\n  - skip_service_principal_aad_check - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n  - condition - The condition which will be used to scope the role assignment.\n  - condition_version - The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\n  \n  > Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
  type = map(object({
    role_definition_id_or_name             = string
    principal_id                           = string
    description                            = optional(string, null)
    skip_service_principal_aad_check       = optional(bool, false)
    condition                              = optional(string, null)
    condition_version                      = optional(string, null)
    delegated_managed_identity_resource_id = optional(string, null)
  }))
  default = {}
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}
