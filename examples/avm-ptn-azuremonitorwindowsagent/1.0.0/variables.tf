variable "arc_server_ids" {
  description = "The resource IDs of the Azure Arc servers. Key is the server name and value is the resource ID."
  type        = map(string)
  default     = ""
}

variable "arc_setting_id" {
  description = "The resource ID for the Azure Arc setting."
  type        = string
  default     = ""
}

variable "azurerm_monitor_data_collection_rule_association_name" {
  description = "The name of the Azure Monitor Data Collection Rule Association."
  type        = string
  default     = ""
}

variable "cmk_for_query_forced" {
  description = "(Optional) Is Customer Managed Storage mandatory for query management?"
  type        = bool
  default     = false
}

variable "counter_specifiers" {
  description = "A list of performance counter specifiers."
  type        = list(string)
  default     = ["\\Memory\\Available Bytes", "\\Network Interface(*)\\Bytes Total/sec", "\\Processor(_Total)\\% Processor Time", "\\RDMA Activity(*)\\RDMA Inbound Bytes/sec", "\\RDMA Activity(*)\\RDMA Outbound Bytes/sec"]
}

variable "create_data_collection_resources" {
  description = "Whether to create the data collection resources."
  type        = bool
  default     = false
}

variable "data_collection_endpoint_name" {
  description = "The name of the Azure Log Analytics data collection endpoint."
  type        = string
  default     = null
}

variable "data_collection_endpoint_tags" {
  description = "A mapping of tags to assign to th data collection endpoint."
  type        = map(string)
  default     = {}
}

variable "data_collection_resources_location" {
  description = "The location of the data collection resources."
  type        = string
  default     = ""
}

variable "data_collection_rule_destination_id" {
  description = "The id of data collection rule destination id."
  type        = string
  default     = "2-90d1-e814dab6067e"
}

variable "data_collection_rule_name" {
  description = "The name of the Azure Log Analytics data collection rule."
  type        = string
  default     = null
}

variable "data_collection_rule_resource_id" {
  description = "The id of the Azure Log Analytics data collection rule."
  type        = string
  default     = null
}

variable "data_collection_rule_tags" {
  description = "A mapping of tags to assign to th data collection rule."
  type        = map(string)
  default     = {}
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "immediate_data_purge_on_30_days_enabled" {
  description = "(Optional) Whether to remove the data in the Log Analytics Workspace immediately after 30 days."
  type        = bool
  default     = false
}

variable "lock" {
  description = "Controls the Resource Lock configuration for this resource. The following properties can be specified:\n\n- kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n- name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n"
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "name" {
  description = "The name of the this resource."
  type        = string
  default     = "AzureMonitorWindowsAgent"
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "retention_in_days" {
  description = "(Optional) The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730."
  type        = number
  default     = 30
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

variable "sku" {
  description = " (Optional) Specifies the SKU of the Log Analytics Workspace."
  type        = string
  default     = "PerGB2018"
}

variable "workspace_name" {
  description = "The name of the Azure Log Analytics workspace."
  type        = string
  default     = null
}

variable "workspace_tags" {
  description = "A mapping of tags to assign to the Azure Log Analytics workspace."
  type        = map(string)
  default     = {}
}

variable "x_path_queries" {
  description = "A list of XPath queries for event logs."
  type        = list(string)
  default     = ["Microsoft-Windows-SDDC-Management/Operational!*[System[(EventID=3000 or EventID=3001 or EventID=3002 or EventID=3003 or EventID=3004)]]", "microsoft-windows-health/operational!*"]
}
