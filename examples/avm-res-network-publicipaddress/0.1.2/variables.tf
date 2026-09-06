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
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see https://aka.ms/avm/telemetryinfo.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "idle_timeout_in_minutes" {
  description = "The idle timeout in minutes."
  type        = number
  default     = 4
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
  description = "The lock level to apply to the deployed resource. Default is None. Possible values are None, CanNotDelete, and ReadOnly."
  type = object({
    name = optional(string, null)
    kind = optional(string, "None")
  })
  default = {}
}

variable "name" {
  description = "Name of public IP address resource"
  type        = string
  default     = ""
}

variable "public_ip_prefix_id" {
  description = "The ID of the public IP prefix to associate with the public IP address."
  type        = string
  default     = null
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "reverse_fqdn" {
  description = "The reverse FQDN for the public IP address. This must be a valid FQDN. If you specify a reverse FQDN, you cannot specify a DNS name label. Not all regions support this."
  type        = string
  default     = null
}

variable "role_assignments" {
  description = " A map of role assignments to create on this resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n- principal_id - The ID of the principal to assign the role to.\n- description - The description of the role assignment.\n- skip_service_principal_aad_check - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n- condition - The condition which will be used to scope the role assignment.\n- condition_version - The version of the condition syntax. Valid values are '2.0'.\n\n> Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
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
  description = "Map of tags to assign to the deployed resource."
  type        = map(any)
  default     = null
}

variable "zones" {
  description = "A set of availability zones to use."
  type        = set(number)
  default     = [1, 2, 3]
}
