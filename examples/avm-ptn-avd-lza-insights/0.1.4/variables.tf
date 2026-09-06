variable "diagnostic_settings" {
  description = "A map of diagnostic settings to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\r\n\r\n- name - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.\r\n- log_categories - (Optional) A set of log categories to send to the log analytics workspace. Defaults to [].\r\n- log_groups - (Optional) A set of log groups to send to the log analytics workspace. Defaults to [\"allLogs\"].\r\n- metric_categories - (Optional) A set of metric categories to send to the log analytics workspace. Defaults to [\"AllMetrics\"].\r\n- log_analytics_destination_type - (Optional) The destination type for the diagnostic setting. Possible values are Dedicated and AzureDiagnostics. Defaults to Dedicated.\r\n- workspace_resource_id - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.\r\n- storage_account_resource_id - (Optional) The resource ID of the storage account to send logs and metrics to.\r\n- event_hub_authorization_rule_resource_id - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.\r\n- event_hub_name - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.\r\n- marketplace_partner_resource_id - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic LogsLogs.\r\n"
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
  description = "This variable controls whether or not telemetry is enabled for the module.\r\nFor more information see <https://aka.ms/avm/telemetryinfo>.\r\nIf it is set to false, then no telemetry will be collected.\r\n"
  type        = bool
  default     = true
}

variable "lock" {
  description = "  Controls the Resource Lock configuration for this resource. The following properties can be specified:\r\n  \r\n  - kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\r\n  - name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\r\n"
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "managed_identities" {
  description = "  Controls the Managed Identity configuration on this resource. The following properties can be specified:\r\n  \r\n  - system_assigned - (Optional) Specifies if the System Assigned Managed Identity should be enabled.\r\n  - user_assigned_resource_ids - (Optional) Specifies a list of User Assigned Managed Identity resource IDs to be assigned to this resource.\r\n"
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default = {}
}

variable "monitor_data_collection_rule_association_data_collection_endpoint_id" {
  description = "(Optional) The ID of the Data Collection Endpoint which will be associated to the target resource."
  type        = string
  default     = null
}

variable "monitor_data_collection_rule_association_data_collection_rule_id" {
  description = "(Optional) The ID of the Data Collection Rule which will be associated to the target resource."
  type        = string
  default     = null
}

variable "monitor_data_collection_rule_association_description" {
  description = "(Optional) The description of the Data Collection Rule Association."
  type        = string
  default     = null
}

variable "monitor_data_collection_rule_association_name" {
  description = "(Optional) The name which should be used for this Data Collection Rule Association. Changing this forces a new Data Collection Rule Association to be created. Defaults to configurationAccessEndpoint."
  type        = string
  default     = null
}

variable "monitor_data_collection_rule_data_collection_endpoint_id" {
  description = "(Optional) The resource ID of the Data Collection Endpoint that this rule can be used with."
  type        = string
  default     = null
}

variable "monitor_data_collection_rule_data_flow" {
  description = "- built_in_transform - (Optional) The built-in transform to transform stream data.\r\n- destinations - (Required) Specifies a list of destination names. A azure_monitor_metrics data source only allows for stream of kind Microsoft-InsightsMetrics.\r\n- output_stream - (Optional) The output stream of the transform. Only required if the data flow changes data to a different stream.\r\n- streams - (Required) Specifies a list of streams. Possible values include but not limited to Microsoft-Event, Microsoft-InsightsMetrics, Microsoft-Perf, Microsoft-Syslog, Microsoft-WindowsEvent, and Microsoft-PrometheusMetrics.\r\n- transform_kql - (Optional) The KQL query to transform stream data.\r\n"
  type = list(object({
    built_in_transform = optional(string)
    destinations       = list(string)
    output_stream      = optional(string)
    streams            = list(string)
    transform_kql      = optional(string)
  }))
  default = ""
}

variable "monitor_data_collection_rule_data_sources" {
  description = "\r\n---\r\ndata_import block supports the following:\r\n\r\n---\r\nevent_hub_data_source block supports the following:\r\n- consumer_group - (Optional) The Event Hub consumer group name.\r\n- name - (Required) The name which should be used for this data source. This name should be unique across all data sources regardless of type within the Data Collection Rule.\r\n- stream - (Required) The stream to collect from Event Hub. Possible value should be a custom stream name.\r\n\r\n---\r\nextension block supports the following:\r\n- extension_json - (Optional) A JSON String which specifies the extension setting.\r\n- extension_name - (Required) The name of the VM extension.\r\n- input_data_sources - (Optional) Specifies a list of data sources this extension needs data from. An item should be a name of a supported data source which produces only one stream. Supported data sources type: performance_counter, windows_event_log,and syslog.\r\n- name - (Required) The name which should be used for this data source. This name should be unique across all data sources regardless of type within the Data Collection Rule.\r\n- streams - (Required) Specifies a list of streams that this data source will be sent to. A stream indicates what schema will be used for this data and usually what table in Log Analytics the data will be sent to. Possible values include but not limited to Microsoft-Event, Microsoft-InsightsMetrics, Microsoft-Perf, Microsoft-Syslog, Microsoft-WindowsEvent.\r\n\r\n---\r\niis_log block supports the following:\r\n- log_directories - (Optional) Specifies a list of absolute paths where the log files are located.\r\n- name - (Required) The name which should be used for this data source. This name should be unique across all data sources regardless of type within the Data Collection Rule.\r\n- streams - (Required) Specifies a list of streams that this data source will be sent to. A stream indicates what schema will be used for this data and usually what table in Log Analytics the data will be sent to. Possible value is Microsoft-W3CIISLog.\r\n\r\n---\r\nlog_file block supports the following:\r\n- file_patterns - (Required) Specifies a list of file patterns where the log files are located. For example, C:\\\\JavaLogs\\\\*.log.\r\n- format - (Required) The data format of the log files. possible value is text.\r\n- name - (Required) The name which should be used for this data source. This name should be unique across all data sources regardless of type within the Data Collection Rule.\r\n- streams - (Required) Specifies a list of streams that this data source will be sent to. A stream indicates what schema will be used for this data and usually what table in Log Analytics the data will be sent to. Possible value should be custom stream names.\r\n\r\n---\r\nsettings block supports the following:\r\n\r\n---\r\ntext block supports the following:\r\n- record_start_timestamp_format - \r\n\r\n---\r\nperformance_counter block supports the following:\r\n- counter_specifiers - (Required) Specifies a list of specifier names of the performance counters you want to collect. To get a list of performance counters on Windows, run the command typeperf. Please see [this document](https://learn.microsoft.com/en-us/azure/azure-monitor/agents/data-sources-performance-counters#configure-performance-counters) for more information.\r\n- name - (Required) The name which should be used for this data source. This name should be unique across all data sources regardless of type within the Data Collection Rule.\r\n- sampling_frequency_in_seconds - (Required) The number of seconds between consecutive counter measurements (samples). The value should be integer between 1 and 300 inclusive. sampling_frequency_in_seconds must be equal to 60 seconds for counters collected with Microsoft-InsightsMetrics stream.\r\n- streams - (Required) Specifies a list of streams that this data source will be sent to. A stream indicates what schema will be used for this data and usually what table in Log Analytics the data will be sent to. Possible values include but not limited to Microsoft-InsightsMetrics,and Microsoft-Perf.\r\n\r\n---\r\nplatform_telemetry block supports the following:\r\n- name - (Required) The name which should be used for this data source. This name should be unique across all data sources regardless of type within the Data Collection Rule.\r\n- streams - (Required) Specifies a list of streams that this data source will be sent to. A stream indicates what schema will be used for this data and usually what table in Log Analytics the data will be sent to. Possible values include but not limited to Microsoft.Cache/redis:Metrics-Group-All.\r\n\r\n---\r\nprometheus_forwarder block supports the following:\r\n- name - (Required) The name which should be used for this data source. This name should be unique across all data sources regardless of type within the Data Collection Rule.\r\n- streams - (Required) Specifies a list of streams that this data source will be sent to. A stream indicates what schema will be used for this data and usually what table in Log Analytics the data will be sent to. Possible value is Microsoft-PrometheusMetrics.\r\n\r\n---\r\nlabel_include_filter block supports the following:\r\n- label - (Required) The label of the filter. This label should be unique across all label_include_fileter block. Possible value is microsoft_metrics_include_label.\r\n- value - (Required) The value of the filter.\r\n\r\n---\r\nsyslog block supports the following:\r\n- facility_names - (Required) Specifies a list of facility names. Use a wildcard * to collect logs for all facility names. Possible values are auth, authpriv, cron, daemon, kern, lpr, mail, mark, news, syslog, user, uucp, local0, local1, local2, local3, local4, local5, local6, local7,and *.\r\n- log_levels - (Required) Specifies a list of log levels. Use a wildcard * to collect logs for all log levels. Possible values are Debug, Info, Notice, Warning, Error, Critical, Alert, Emergency,and *.\r\n- name - (Required) The name which should be used for this data source. This name should be unique across all data sources regardless of type within the Data Collection Rule.\r\n- streams - (Optional) Specifies a list of streams that this data source will be sent to. A stream indicates what schema will be used for this data and usually what table in Log Analytics the data will be sent to. Possible values include but not limited to Microsoft-Syslog,and Microsoft-CiscoAsa, and Microsoft-CommonSecurityLog.\r\n\r\n---\r\nwindows_event_log block supports the following:\r\n- name - (Required) The name which should be used for this data source. This name should be unique across all data sources regardless of type within the Data Collection Rule.\r\n- streams - (Required) Specifies a list of streams that this data source will be sent to. A stream indicates what schema will be used for this data and usually what table in Log Analytics the data will be sent to. Possible values include but not limited to Microsoft-Event,and Microsoft-WindowsEvent, Microsoft-RomeDetectionEvent, and Microsoft-SecurityEvent.\r\n- x_path_queries - (Required) Specifies a list of Windows Event Log queries in XPath expression. Please see [this document](https://learn.microsoft.com/en-us/azure/azure-monitor/agents/data-collection-rule-azure-monitor-agent?tabs=cli#filter-events-using-xpath-queries) for more information.\r\n\r\n---\r\nwindows_firewall_log block supports the following:\r\n- name - (Required) The name which should be used for this data source. This name should be unique across all data sources regardless of type within the Data Collection Rule.\r\n- streams - (Required) Specifies a list of streams that this data source will be sent to. A stream indicates what schema will be used for this data and usually what table in Log Analytics the data will be sent to.\r\n"
  type = object({
    data_import = optional(object({
      event_hub_data_source = list(object({
        consumer_group = optional(string)
        name           = string
        stream         = string
      }))
    }))
    extension = optional(list(object({
      extension_json     = optional(string)
      extension_name     = string
      input_data_sources = optional(list(string))
      name               = string
      streams            = list(string)
    })))
    iis_log = optional(list(object({
      log_directories = optional(list(string))
      name            = string
      streams         = list(string)
    })))
    log_file = optional(list(object({
      file_patterns = list(string)
      format        = string
      name          = string
      streams       = list(string)
      settings = optional(object({
        text = object({
          record_start_timestamp_format = string
        })
      }))
    })))
    performance_counter = optional(list(object({
      counter_specifiers            = list(string)
      name                          = string
      sampling_frequency_in_seconds = number
      streams                       = list(string)
    })))
    platform_telemetry = optional(list(object({
      name    = string
      streams = list(string)
    })))
    prometheus_forwarder = optional(list(object({
      name    = string
      streams = list(string)
      label_include_filter = optional(set(object({
        label = string
        value = string
      })))
    })))
    syslog = optional(list(object({
      facility_names = list(string)
      log_levels     = list(string)
      name           = string
      streams        = optional(list(string))
    })))
    windows_event_log = optional(list(object({
      name           = string
      streams        = list(string)
      x_path_queries = list(string)
    })))
    windows_firewall_log = optional(list(object({
      name    = string
      streams = list(string)
    })))
  })
  default = null
}

variable "monitor_data_collection_rule_description" {
  description = "(Optional) The description of the Data Collection Rule."
  type        = string
  default     = null
}

variable "monitor_data_collection_rule_destinations" {
  description = "\r\n---\r\nazure_monitor_metrics block supports the following:\r\n- name - (Optional) The name which should be used for this destination. This name should be unique across all destinations regardless of type within the Data Collection Rule.\r\n\r\n---\r\nevent_hub block supports the following:\r\n- event_hub_id - (Optional) The resource ID of the Event Hub.\r\n- name - (Optional) The name which should be used for this destination. This name should be unique across all destinations regardless of type within the Data Collection Rule.\r\n\r\n---\r\nevent_hub_direct block supports the following:\r\n- event_hub_id - (Optional) The resource ID of the Event Hub.\r\n- name - (Optional) The name which should be used for this destination. This name should be unique across all destinations regardless of type within the Data Collection Rule.\r\n\r\n---\r\nlog_analytics block supports the following:\r\n- name - (Optional) The name which should be used for this destination. This name should be unique across all destinations regardless of type within the Data Collection Rule.\r\n- workspace_resource_id - (Optional) The ID of a Log Analytic Workspace resource.\r\n\r\n---\r\nmonitor_account block supports the following:\r\n- monitor_account_id - (Optional) The resource ID of the Monitor Account.\r\n- name - (Optional) The name which should be used for this destination. This name should be unique across all destinations regardless of type within the Data Collection Rule.\r\n\r\n---\r\nstorage_blob block supports the following:\r\n- container_name - (Optional) The Storage Container name.\r\n- name - (Optional) The name which should be used for this destination. This name should be unique across all destinations regardless of type within the Data Collection Rule.\r\n- storage_account_id - (Optional) The resource ID of the Storage Account.\r\n\r\n---\r\nstorage_blob_direct block supports the following:\r\n- container_name - (Optional) The Storage Container name.\r\n- name - (Optional) The name which should be used for this destination. This name should be unique across all destinations regardless of type within the Data Collection Rule.\r\n- storage_account_id - (Optional) The resource ID of the Storage Account.\r\n\r\n---\r\nstorage_table_direct block supports the following:\r\n- name - (Optional) The name which should be used for this destination. This name should be unique across all destinations regardless of type within the Data Collection Rule.\r\n- storage_account_id - (Optional) The resource ID of the Storage Account.\r\n- table_name - (Optional) The Storage Table name.\r\n"
  type = object({
    azure_monitor_metrics = optional(object({
      name = optional(string)
    }))
    event_hub = optional(object({
      event_hub_id = optional(string)
      name         = optional(string)
    }))
    event_hub_direct = optional(object({
      event_hub_id = optional(string)
      name         = optional(string)
    }))
    log_analytics = optional(object({
      name                  = optional(string)
      workspace_resource_id = optional(string)
    }))
    monitor_account = optional(list(object({
      monitor_account_id = optional(string)
      name               = optional(string)
    })))
    storage_blob = optional(list(object({
      container_name     = optional(string)
      name               = optional(string)
      storage_account_id = optional(string)
    })))
    storage_blob_direct = optional(list(object({
      container_name     = optional(string)
      name               = optional(string)
      storage_account_id = optional(string)
    })))
    storage_table_direct = optional(list(object({
      name               = optional(string)
      storage_account_id = optional(string)
      table_name         = optional(string)
    })))
  })
  default = {}
}

variable "monitor_data_collection_rule_identity" {
  description = "- identity_ids - (Optional) A list of User Assigned Managed Identity IDs to be assigned to this Data Collection Rule. Currently, up to 1 identity is supported.\r\n- type - (Required) Specifies the type of Managed Service Identity that should be configured on this Data Collection Rule. Possible values are SystemAssigned and UserAssigned.\r\n"
  type = object({
    identity_ids = optional(set(string))
    type         = string
  })
  default = null
}

variable "monitor_data_collection_rule_kind" {
  description = "(Optional) The kind of the Data Collection Rule. Possible values are Linux, Windows, AgentDirectToStore and WorkspaceTransforms. A rule of kind Linux does not allow for windows_event_log data sources. And a rule of kind Windows does not allow for syslog data sources. If kind is not specified, all kinds of data sources are allowed."
  type        = string
  default     = null
}

variable "monitor_data_collection_rule_location" {
  description = "(Optional) The Azure Region where the Data Collection Rule should exist. Changing this forces a new Data Collection Rule to be created."
  type        = string
  default     = ""
}

variable "monitor_data_collection_rule_name" {
  description = "(Required) The name which should be used for this Data Collection Rule. Changing this forces a new Data Collection Rule to be created."
  type        = string
  default     = ""
}

variable "monitor_data_collection_rule_resource_group_name" {
  description = "The name of the Resource Group where the Data Collection Rule should exist. Changing this forces a new Data Collection Rule to be created."
  type        = string
  default     = ""
}

variable "monitor_data_collection_rule_stream_declaration" {
  description = "- stream_name - (Required) The name of the custom stream. This name should be unique across all stream_declaration blocks.\r\n\r\n---\r\ncolumn block supports the following:\r\n- name - (Required) The name of the column.\r\n- type - (Required) The type of the column data. Possible values are string, int, long, real, boolean, datetime,and dynamic.\r\n"
  type = set(object({
    stream_name = string
    column = list(object({
      name = string
      type = string
    }))
  }))
  default = null
}

variable "monitor_data_collection_rule_tags" {
  description = "(Optional) A mapping of tags which should be assigned to the Data Collection Rule."
  type        = map(string)
  default     = null
}

variable "monitor_data_collection_rule_timeouts" {
  description = "- create - (Defaults to 30 minutes) Used when creating the Data Collection Rule.\r\n- delete - (Defaults to 30 minutes) Used when deleting the Data Collection Rule.\r\n- read - (Defaults to 5 minutes) Used when retrieving the Data Collection Rule.\r\n- update - (Defaults to 30 minutes) Used when updating the Data Collection Rule.\r\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}

variable "role_assignments" {
  description = "  A map of role assignments to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\r\n  \r\n  - role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\r\n  - principal_id - The ID of the principal to assign the role to.\r\n  - description - The description of the role assignment.\r\n  - skip_service_principal_aad_check - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\r\n  - condition - The condition which will be used to scope the role assignment.\r\n  - condition_version - The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\r\n  \r\n  > Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\r\n"
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
