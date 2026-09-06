variable "automation_account_encryption" {
  description = "The encryption configuration for the Azure Automation Account."
  type = object({
    key_vault_key_id          = string
    user_assigned_identity_id = optional(string, null)
  })
  default = null
}

variable "automation_account_identity" {
  description = "The identity to assign to the Azure Automation Account."
  type = object({
    type         = string
    identity_ids = optional(set(string), null)
  })
  default = null
}

variable "automation_account_local_authentication_enabled" {
  description = "Whether or not local authentication is enabled for the Azure Automation Account."
  type        = bool
  default     = true
}

variable "automation_account_location" {
  description = "The Azure region of the Azure Automation Account to deploy. This suppports overriding the location variable in specific cases."
  type        = string
  default     = null
}

variable "automation_account_name" {
  description = "The name of the Azure Automation Account to create."
  type        = string
  default     = ""
}

variable "automation_account_public_network_access_enabled" {
  description = "Whether or not public network access is enabled for the Azure Automation Account."
  type        = bool
  default     = true
}

variable "automation_account_sku_name" {
  description = "The name of the SKU for the Azure Automation Account to create."
  type        = string
  default     = "Basic"
}

variable "data_collection_rules" {
  description = "Enables customisation of the data collection rules."
  type = object({
    change_tracking = object({
      enabled  = optional(bool, true)
      name     = string
      location = optional(string, null)
      tags     = optional(map(string), null)
    })
    vm_insights = object({
      enabled  = optional(bool, true)
      name     = string
      location = optional(string, null)
      tags     = optional(map(string), null)
    })
    defender_sql = object({
      enabled                                                = optional(bool, true)
      name                                                   = string
      location                                               = optional(string, null)
      tags                                                   = optional(map(string), null)
      enable_collection_of_sql_queries_for_security_research = optional(bool, false)
    })
  })
  default = { "change_tracking" : { "name" : "dcr-change-tracking" }, "defender_sql" : { "name" : "dcr-defender-sql" }, "vm_insights" : { "name" : "dcr-vm-insights" } }
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see https://aka.ms/avm/telemetryinfo.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "linked_automation_account_creation_enabled" {
  description = "A boolean flag to determine whether to deploy the Azure Automation Account linked to the Log Analytics Workspace or not."
  type        = bool
  default     = true
}

variable "location" {
  description = "The Azure region where the resources will be deployed."
  type        = string
  default     = ""
}

variable "log_analytics_solution_plans" {
  description = "The Log Analytics Solution Plans to create. Do not add the SecurityInsights solution plan here, this deployment method is deprecated. Instead refer to"
  type = list(object({
    product   = string
    publisher = optional(string, "Microsoft")
  }))
  default = [{ "product" : "OMSGallery/ContainerInsights", "publisher" : "Microsoft" }, { "product" : "OMSGallery/VMInsights", "publisher" : "Microsoft" }]
}

variable "log_analytics_workspace_allow_resource_only_permissions" {
  description = "Whether or not to allow resource-only permissions for the Log Analytics Workspace."
  type        = bool
  default     = true
}

variable "log_analytics_workspace_cmk_for_query_forced" {
  description = "Whether or not to force the use of customer-managed keys for query in the Log Analytics Workspace."
  type        = bool
  default     = null
}

variable "log_analytics_workspace_daily_quota_gb" {
  description = "The daily ingestion quota in GB for the Log Analytics Workspace."
  type        = number
  default     = null
}

variable "log_analytics_workspace_internet_ingestion_enabled" {
  description = "Whether or not internet ingestion is enabled for the Log Analytics Workspace."
  type        = bool
  default     = true
}

variable "log_analytics_workspace_internet_query_enabled" {
  description = "Whether or not internet query is enabled for the Log Analytics Workspace."
  type        = bool
  default     = true
}

variable "log_analytics_workspace_local_authentication_disabled" {
  description = "Whether or not local authentication is disabled for the Log Analytics Workspace."
  type        = bool
  default     = false
}

variable "log_analytics_workspace_name" {
  description = "The name of the Log Analytics Workspace to create."
  type        = string
  default     = ""
}

variable "log_analytics_workspace_reservation_capacity_in_gb_per_day" {
  description = "The reservation capacity in GB per day for the Log Analytics Workspace."
  type        = number
  default     = null
}

variable "log_analytics_workspace_retention_in_days" {
  description = "The number of days to retain data for the Log Analytics Workspace."
  type        = number
  default     = 30
}

variable "log_analytics_workspace_sku" {
  description = "The SKU to use for the Log Analytics Workspace."
  type        = string
  default     = "PerGB2018"
}

variable "resource_group_creation_enabled" {
  description = "A boolean flag to determine whether to deploy the Azure Resource Group or not."
  type        = bool
  default     = true
}

variable "resource_group_name" {
  description = "The name of the Azure Resource Group where the resources will be created."
  type        = string
  default     = ""
}

variable "sentinel_onboarding" {
  description = "Enables customisation of the Sentinel onboarding. Set to null to disable."
  type = object({
    name                         = optional(string, "default")
    customer_managed_key_enabled = optional(bool, false)
  })
  default = {}
}

variable "tags" {
  description = "A map of tags to apply to the resources created."
  type        = map(string)
  default     = null
}

variable "user_assigned_managed_identities" {
  description = "Enables customisation of the user assigned managed identities."
  type = object({
    ama = object({
      enabled  = optional(bool, true)
      name     = string
      location = optional(string, null)
      tags     = optional(map(string), null)
    })
  })
  default = { "ama" : { "name" : "uami-ama" } }
}
