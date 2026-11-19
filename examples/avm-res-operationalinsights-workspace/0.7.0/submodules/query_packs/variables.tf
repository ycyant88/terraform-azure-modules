variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "ignore_body_changes" {
  description = "Body-relative dot paths to ignore on the AzAPI resources of this module.\nChanges take effect only after apply.\nIgnored configuration is not sent to Azure until its path is removed.\n\n- authorization_locks - Paths ignored on the query pack management locks.\n- operationalinsights_query_packs - Paths ignored on the query packs.\n- operationalinsights_query_packs_queries - Paths ignored on the queries.\n"
  type = object({
    authorization_locks                     = optional(list(string), [])
    operationalinsights_query_packs         = optional(list(string), [])
    operationalinsights_query_packs_queries = optional(list(string), [])
  })
  default = {}
}

variable "location" {
  description = "(Required) The Azure region where the resources should be deployed."
  type        = string
  default     = ""
}

variable "monitor_queries" {
  description = "(Optional) A map of Queries to create. The key is the name of the Query. The value is an object containing the configuration.\n- name - (Optional) The name of the Query. This must be a GUID. If not provided, a UUID will be generated.\n- query_pack_key - (Required) The key of the Query Pack to associate this Query with.\n- body - (Required) The KQL query body.\n- display_name - (Required) The display name of the query.\n- description - (Optional) The description of the query.\n- tags - (Optional) A map of tags to assign to the query.\n- related - (Optional) A map of related items.\n  - categories - (Optional) A list of categories for the query. Supported values: security, network, management, virtualmachines, container, audit, desktopanalytics, workloads, resources, applications, monitor, databases, windowsvirtualdesktop.\n  - resource_types - (Optional) A list of resource types the query applies to. Example: [\"Microsoft.Compute/virtualMachines\"].\n  - solutions - (Optional) A list of solutions the query is related to. Example: [\"LogManagement\"].\n"
  type = map(object({
    name           = optional(string)
    query_pack_key = string
    body           = string
    display_name   = string
    description    = optional(string)
    tags           = optional(map(string))
    related = optional(object({
      categories     = optional(list(string))
      resource_types = optional(list(string))
      solutions      = optional(list(string))
    }))
  }))
  default = {}
}

variable "monitor_query_packs" {
  description = "(Optional) A map of Query Packs to create. The key is the name of the Query Pack. The value is an object containing the configuration.\n- name - (Required) The name of the Query Pack.\n- tags - (Optional) A map of tags to assign to the Query Pack.\n- lock - (Optional) Controls the Resource Lock configuration for this resource. The following properties can be specified:\n  - kind - (Required) The type of lock. Possible values are CanNotDelete and ReadOnly.\n  - name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n"
  type = map(object({
    name = string
    tags = optional(map(string))
    lock = optional(object({
      kind = string
      name = optional(string, null)
    }))
  }))
  default = {}
}

variable "resource_group_id" {
  description = "(Required) The Resource ID of the Resource Group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "resource_types" {
  description = "AzAPI resource types and API versions, in <provider>/<resource>@<api-version> form. Each key defaults to a tested value; supply only the keys you want to override.\n\n- authorization_locks - The query pack management locks.\n- operationalinsights_query_packs - The query packs.\n- operationalinsights_query_packs_queries - The queries.\n"
  type = object({
    authorization_locks                     = optional(string, "Microsoft.Authorization/locks@2020-05-01")
    operationalinsights_query_packs         = optional(string, "Microsoft.OperationalInsights/queryPacks@2019-09-01")
    operationalinsights_query_packs_queries = optional(string, "Microsoft.OperationalInsights/queryPacks/queries@2019-09-01")
  })
  default = {}
}

variable "retry" {
  description = "Retry configuration applied to every AzAPI resource of this module.\nDefaults to null (no custom retry).\n\n- error_message_regex - Error-message patterns that trigger a retry.\n- interval_seconds - Initial interval between retries in seconds.\n- max_interval_seconds - Maximum interval between retries in seconds.\n"
  type = object({
    error_message_regex  = optional(list(string))
    interval_seconds     = optional(number)
    max_interval_seconds = optional(number)
  })
  default = null
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resources."
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "Per-operation timeouts applied to every AzAPI resource of this module.\nDefaults to null (provider defaults). Values are Go duration strings.\n\n- create - Create timeout.\n- read - Read timeout.\n- update - Update timeout.\n- delete - Delete timeout.\n"
  type = object({
    create = optional(string)
    read   = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = null
}
