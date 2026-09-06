variable "custom_settings_by_resource_type" {
  description = "If specified, allows full customization of common settings for all resources (by type) deployed by this module."
  type        = any
  default     = {}
}

variable "enabled" {
  description = "Controls whether to manage the management landing zone policies and deploy the management resources into the current Subscription context."
  type        = bool
  default     = ""
}

variable "existing_automation_account_resource_id" {
  description = "If specified, module will skip creation of Automation Account and use existing."
  type        = string
  default     = ""
}

variable "existing_log_analytics_workspace_resource_id" {
  description = "If specified, module will skip creation of Log Analytics workspace and use existing."
  type        = string
  default     = ""
}

variable "existing_resource_group_name" {
  description = "If specified, module will skip creation of the management Resource Group and use existing."
  type        = string
  default     = ""
}

variable "link_log_analytics_to_automation_account" {
  description = "If set to true, module will link the Log Analytics workspace and Automation Account."
  type        = bool
  default     = true
}

variable "location" {
  description = "Sets the default location used for resource deployments where needed."
  type        = string
  default     = "eastus"
}

variable "resource_prefix" {
  description = "If specified, will set the resource name prefix for management resources (default value determined from \"var.root_id\")."
  type        = string
  default     = ""
}

variable "resource_suffix" {
  description = "If specified, will set the resource name suffix for management resources."
  type        = string
  default     = ""
}

variable "root_id" {
  description = "Specifies the ID of the Enterprise-scale root Management Group, used as a prefix for resources created by this module."
  type        = string
  default     = ""
}

variable "settings" {
  description = "Configuration settings for the \"Management\" landing zone resources."
  type = object({
    log_analytics = object({
      enabled = bool
      config = object({
        retention_in_days                           = number
        enable_monitoring_for_arc                   = bool
        enable_monitoring_for_vm                    = bool
        enable_monitoring_for_vmss                  = bool
        enable_solution_for_agent_health_assessment = bool
        enable_solution_for_anti_malware            = bool
        enable_solution_for_azure_activity          = bool
        enable_solution_for_change_tracking         = bool
        enable_solution_for_service_map             = bool
        enable_solution_for_sql_assessment          = bool
        enable_solution_for_updates                 = bool
        enable_solution_for_vm_insights             = bool
        enable_sentinel                             = bool
      })
    })
    security_center = object({
      enabled = bool
      config = object({
        email_security_contact             = string
        enable_defender_for_acr            = bool
        enable_defender_for_app_services   = bool
        enable_defender_for_arm            = bool
        enable_defender_for_dns            = bool
        enable_defender_for_key_vault      = bool
        enable_defender_for_kubernetes     = bool
        enable_defender_for_servers        = bool
        enable_defender_for_sql_servers    = bool
        enable_defender_for_sql_server_vms = bool
        enable_defender_for_storage        = bool
      })
    })
  })
  default = ""
}

variable "subscription_id" {
  description = "Specifies the Subscription ID for the Subscription containing all management resources."
  type        = string
  default     = ""
}

variable "tags" {
  description = "If specified, will set the default tags for all resources deployed by this module where supported."
  type        = map(string)
  default     = {}
}
