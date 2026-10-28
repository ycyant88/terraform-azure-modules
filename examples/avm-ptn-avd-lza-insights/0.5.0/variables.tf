variable "data_collection_endpoint_id" {
  description = "(Optional) The resource ID of the Data Collection Endpoint that this rule can be used with. Maps to properties.dataCollectionEndpointId."
  type        = string
  default     = null
}

variable "data_flows" {
  description = "The data flows of the Data Collection Rule. Maps to properties.dataFlows in the ARM schema.\n\n- built_in_transform - (Optional) The built-in transform to transform stream data.\n- capture_overflow - (Optional) Whether overflowing data should be captured. Requires a Microsoft-Overflow destination.\n- destinations - (Required) A list of destination names. Each name must match a name declared in var.destinations.\n- output_stream - (Optional) The output stream of the transform. Only required when the data flow changes data to a different stream.\n- streams - (Required) A list of streams. Possible values include but are not limited to Microsoft-Event, Microsoft-InsightsMetrics, Microsoft-Perf, Microsoft-Syslog, Microsoft-WindowsEvent, and Microsoft-PrometheusMetrics.\n- transform_kql - (Optional) The KQL query used to transform stream data.\n"
  type = list(object({
    built_in_transform = optional(string)
    capture_overflow   = optional(bool)
    destinations       = list(string)
    output_stream      = optional(string)
    streams            = list(string)
    transform_kql      = optional(string)
  }))
  default = ""
}

variable "data_sources" {
  description = "The data sources of the Data Collection Rule. Maps to properties.dataSources in the ARM schema. Every data source name must be unique across all data source types within the rule.\n\n---\ndata_imports supports the following:\n- event_hub - (Required) The Event Hub to import data from. Maps to dataSources.dataImports.eventHub, which the ARM schema models as a single object rather than a list.\n  - consumer_group - (Optional) The Event Hub consumer group name.\n  - name - (Required) The name of this data source.\n  - stream - (Required) The stream to collect from the Event Hub. The value should be a custom stream name.\n\n---\nextensions supports the following:\n- extension_name - (Required) The name of the VM extension.\n- extension_settings - (Optional) A JSON-encoded string holding the extension settings, for example jsonencode({ workspaceId = \"...\" }). It is decoded before being sent to Azure, so it arrives as a JSON object rather than a string.\n- input_data_sources - (Optional) A list of data sources this extension needs data from. Each item must name a supported data source that produces exactly one stream. Supported types are performance_counters, windows_event_logs, and syslog.\n- name - (Required) The name of this data source.\n- streams - (Required) A list of streams that this data source will be sent to.\n\n---\niis_logs supports the following:\n- log_directories - (Optional) A list of absolute paths where the log files are located.\n- name - (Required) The name of this data source.\n- streams - (Required) A list of streams that this data source will be sent to. The supported value is Microsoft-W3CIISLog.\n- transform_kql - (Optional) The KQL query used to transform this data source.\n\n---\nlog_files supports the following:\n- file_patterns - (Required) A list of file patterns where the log files are located, for example C:\\\\JavaLogs\\\\*.log.\n- format - (Required) The data format of the log files. Possible values are json and text.\n- name - (Required) The name of this data source.\n- settings - (Optional) Additional settings for the log file.\n  - text.record_start_timestamp_format - (Required) The timestamp format used to detect the start of a record.\n- streams - (Required) A list of streams that this data source will be sent to. The values should be custom stream names.\n- transform_kql - (Optional) The KQL query used to transform this data source.\n\n---\nperformance_counters supports the following:\n- counter_specifiers - (Required) A list of specifier names of the performance counters to collect. To list the performance counters available on Windows, run typeperf.\n- name - (Required) The name of this data source.\n- sampling_frequency_in_seconds - (Required) The number of seconds between consecutive samples. The value must be an integer between 1 and 300 inclusive. It must be 60 for counters collected with the Microsoft-InsightsMetrics stream.\n- streams - (Required) A list of streams that this data source will be sent to. Possible values include but are not limited to Microsoft-InsightsMetrics and Microsoft-Perf.\n- transform_kql - (Optional) The KQL query used to transform this data source.\n\n---\nplatform_telemetry supports the following:\n- name - (Required) The name of this data source.\n- streams - (Required) A list of streams that this data source will be sent to, for example Microsoft.Cache/redis:Metrics-Group-All.\n\n---\nprometheus_forwarder supports the following:\n- label_include_filter - (Optional) A map of label inclusion filters, where the map key is the label name and the map value is the label value. Only microsoft_metrics_include_label is currently supported, and values are matched case-insensitively. The ARM schema models this as a dictionary, so it is a map here rather than the list of label/value pairs used before v0.4.0.\n- name - (Required) The name of this data source.\n- streams - (Required) A list of streams that this data source will be sent to. The supported value is Microsoft-PrometheusMetrics.\n\n---\nsyslog supports the following:\n- facility_names - (Required) A list of facility names. Use * to collect logs for all facility names. Possible values are auth, authpriv, cron, daemon, kern, lpr, mail, mark, news, syslog, user, uucp, local0 through local7, and *.\n- log_levels - (Required) A list of log levels. Use * to collect logs for all log levels. Possible values are Debug, Info, Notice, Warning, Error, Critical, Alert, Emergency, and *.\n- name - (Required) The name of this data source.\n- streams - (Optional) A list of streams that this data source will be sent to. Possible values include but are not limited to Microsoft-Syslog, Microsoft-CiscoAsa, and Microsoft-CommonSecurityLog.\n- transform_kql - (Optional) The KQL query used to transform this data source.\n\n---\nwindows_event_logs supports the following:\n- name - (Required) The name of this data source.\n- streams - (Required) A list of streams that this data source will be sent to. Possible values include but are not limited to Microsoft-Event, Microsoft-WindowsEvent, Microsoft-RomeDetectionEvent, and Microsoft-SecurityEvent.\n- transform_kql - (Optional) The KQL query used to transform this data source.\n- x_path_queries - (Required) A list of Windows Event Log queries in XPath expression.\n\n---\nwindows_firewall_logs supports the following:\n- name - (Required) The name of this data source.\n- profile_filter - (Optional) A list of firewall profiles to collect logs for.\n- streams - (Required) A list of streams that this data source will be sent to.\n"
  type = object({
    data_imports = optional(object({
      event_hub = object({
        consumer_group = optional(string)
        name           = string
        stream         = string
      })
    }))
    extensions = optional(list(object({
      extension_name     = string
      extension_settings = optional(string)
      input_data_sources = optional(list(string))
      name               = string
      streams            = list(string)
    })))
    iis_logs = optional(list(object({
      log_directories = optional(list(string))
      name            = string
      streams         = list(string)
      transform_kql   = optional(string)
    })))
    log_files = optional(list(object({
      file_patterns = list(string)
      format        = string
      name          = string
      streams       = list(string)
      transform_kql = optional(string)
      settings = optional(object({
        text = object({
          record_start_timestamp_format = string
        })
      }))
    })))
    performance_counters = optional(list(object({
      counter_specifiers            = list(string)
      name                          = string
      sampling_frequency_in_seconds = number
      streams                       = list(string)
      transform_kql                 = optional(string)
    })))
    platform_telemetry = optional(list(object({
      name    = string
      streams = list(string)
    })))
    prometheus_forwarder = optional(list(object({
      label_include_filter = optional(map(string))
      name                 = string
      streams              = list(string)
    })))
    syslog = optional(list(object({
      facility_names = list(string)
      log_levels     = list(string)
      name           = string
      streams        = optional(list(string))
      transform_kql  = optional(string)
    })))
    windows_event_logs = optional(list(object({
      name           = string
      streams        = list(string)
      transform_kql  = optional(string)
      x_path_queries = list(string)
    })))
    windows_firewall_logs = optional(list(object({
      name           = string
      profile_filter = optional(list(string))
      streams        = list(string)
    })))
  })
  default = null
}

variable "description" {
  description = "(Optional) The description of the Data Collection Rule. Maps to properties.description."
  type        = string
  default     = null
}

variable "destinations" {
  description = "The destinations of the Data Collection Rule. Maps to properties.destinations in the ARM schema. Every destination name must be unique across all destination types within the rule, and each name referenced by var.data_flows[*].destinations must appear here.\n\nBefore v0.4.0 the event_hub, event_hub_direct, and log_analytics destinations were single objects. The ARM schema models them as lists, so they are lists here. storage_blob is now storage_accounts and monitor_account is now monitoring_accounts, again matching ARM.\n\n---\nazure_data_explorer supports the following:\n- database_name - (Optional) The Azure Data Explorer database to ingest into.\n- name - (Required) The name of this destination.\n- resource_id - (Required) The resource ID of the Azure Data Explorer cluster. Azure supplies the read-only ingestion URI.\n\n---\nazure_monitor_metrics supports the following:\n- name - (Required) The name of this destination.\n\n---\nevent_hubs supports the following:\n- event_hub_resource_id - (Required) The resource ID of the Event Hub. Replaces event_hub_id.\n- name - (Required) The name of this destination.\n\n---\nevent_hubs_direct supports the following:\n- event_hub_resource_id - (Required) The resource ID of the Event Hub. Replaces event_hub_id.\n- name - (Required) The name of this destination.\n\n---\nlog_analytics supports the following:\n- name - (Required) The name of this destination.\n- workspace_resource_id - (Required) The resource ID of the Log Analytics workspace.\n\n---\nmicrosoft_fabric supports the following:\n- artifact_id - (Optional) The artifact ID of the Microsoft Fabric eventhouse.\n- database_name - (Optional) The Microsoft Fabric database to ingest into.\n- ingestion_uri - (Optional) The ingestion URI of the eventhouse.\n- name - (Required) The name of this destination.\n- tenant_id - (Optional) The tenant ID of the Microsoft Fabric resource.\n\n---\nmonitoring_accounts supports the following:\n- account_resource_id - (Required) The resource ID of the Monitor account. Replaces monitor_account_id.\n- name - (Required) The name of this destination.\n\n---\nstorage_accounts supports the following:\n- container_name - (Optional) The storage container name.\n- name - (Required) The name of this destination.\n- storage_account_resource_id - (Required) The resource ID of the storage account. Replaces storage_account_id.\n\n---\nstorage_blobs_direct supports the following:\n- container_name - (Optional) The storage container name.\n- name - (Required) The name of this destination.\n- storage_account_resource_id - (Required) The resource ID of the storage account. Replaces storage_account_id.\n\n---\nstorage_tables_direct supports the following:\n- name - (Required) The name of this destination.\n- storage_account_resource_id - (Required) The resource ID of the storage account. Replaces storage_account_id.\n- table_name - (Optional) The storage table name.\n"
  type = object({
    azure_data_explorer = optional(list(object({
      database_name = optional(string)
      name          = string
      resource_id   = optional(string)
    })))
    azure_monitor_metrics = optional(object({
      name = string
    }))
    event_hubs = optional(list(object({
      event_hub_resource_id = optional(string)
      name                  = string
    })))
    event_hubs_direct = optional(list(object({
      event_hub_resource_id = optional(string)
      name                  = string
    })))
    log_analytics = optional(list(object({
      name                  = string
      workspace_resource_id = optional(string)
    })))
    microsoft_fabric = optional(list(object({
      artifact_id   = optional(string)
      database_name = optional(string)
      ingestion_uri = optional(string)
      name          = string
      tenant_id     = optional(string)
    })))
    monitoring_accounts = optional(list(object({
      account_resource_id = optional(string)
      name                = string
    })))
    storage_accounts = optional(list(object({
      container_name              = optional(string)
      name                        = string
      storage_account_resource_id = optional(string)
    })))
    storage_blobs_direct = optional(list(object({
      container_name              = optional(string)
      name                        = string
      storage_account_resource_id = optional(string)
    })))
    storage_tables_direct = optional(list(object({
      name                        = string
      storage_account_resource_id = optional(string)
      table_name                  = optional(string)
    })))
  })
  default = {}
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "ignore_body_changes" {
  description = "Body-relative paths to ignore for each AzAPI resource declared by this module. Paths use dot notation, for example properties.description.\n\nChanges to this variable take effect only after an apply, because the value is stored in provider-private state. Configuration at an ignored path is not sent to Azure until the path is removed from this list.\n\n- insights_data_collection_rules - Paths ignored on the Data Collection Rule.\n"
  type = object({
    insights_data_collection_rules = optional(list(string), [])
  })
  default = {}
}

variable "kind" {
  description = "(Optional) The kind of the Data Collection Rule. Possible values include Linux, Windows, AgentDirectToStore, and WorkspaceTransforms. A rule of kind Linux does not allow windows_event_logs data sources, and a rule of kind Windows does not allow syslog data sources. If not specified, all kinds of data sources are allowed. Changing this value forces a new resource, including setting it on a rule that previously omitted it."
  type        = string
  default     = null
}

variable "location" {
  description = "The Azure region where the Data Collection Rule will be deployed. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "managed_identities" {
  description = "Controls the Managed Identity configuration on this resource. The following properties can be specified:\n\n- system_assigned - (Optional) Specifies if the System Assigned Managed Identity should be enabled.\n- user_assigned_resource_ids - (Optional) Specifies a list of User Assigned Managed Identity resource IDs to be assigned to this resource.\n\nThis replaces the monitor_data_collection_rule_identity input used before v0.4.0.\n"
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default = {}
}

variable "name" {
  description = "The name of the Data Collection Rule. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "The fully-qualified ARM resource ID of the existing resource group into which the Data Collection Rule will be deployed, for example /subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-avd-monitoring.\n\nThis replaces the monitor_data_collection_rule_resource_group_name input used before v0.4.0. When migrating an existing deployment, supply the resource group ID exactly as it is spelled inside the rule's own resource ID, because parent_id forces replacement and is compared as a case-sensitive string.\n"
  type        = string
  default     = ""
}

variable "resource_types" {
  description = "AzAPI resource types and API versions used by the module.\n\n- insights_data_collection_rules - Resource type and API version for the Data Collection Rule.\n\nThe default matches the API version that the AzAPI provider selects when it moves state from azurerm_monitor_data_collection_rule, so a migrated deployment plans with no change to type.\n"
  type = object({
    insights_data_collection_rules = optional(string, "Microsoft.Insights/dataCollectionRules@2024-03-11")
  })
  default = {}
}

variable "retry" {
  description = "Retry configuration applied to every supported AzAPI resource declared by the module. Defaults to null (no custom retry).\n\n- error_message_regex  - (Optional) A list of regex patterns matching error messages that trigger a retry.\n- interval_seconds     - (Optional) Initial interval between retries in seconds.\n- max_interval_seconds - (Optional) Maximum interval between retries in seconds.\n\nSee <https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/resource#retry> for full semantics.\n"
  type = object({
    error_message_regex  = optional(list(string))
    interval_seconds     = optional(number)
    max_interval_seconds = optional(number)
  })
  default = null
}

variable "stream_declarations" {
  description = "Custom stream declarations for the Data Collection Rule. Maps to properties.streamDeclarations in the ARM schema.\n\nThe ARM schema models this as a dictionary keyed by stream name, so the map key is the stream name. Before v0.4.0 this was a set of objects carrying a stream_name attribute.\n\n- columns - (Required) The list of columns used by data in this stream.\n  - name - (Required) The name of the column.\n  - type - (Required) The type of the column data. Possible values are string, int, long, real, boolean, datetime, dynamic, and guid.\n"
  type = map(object({
    columns = list(object({
      name = string
      type = string
    }))
  }))
  default = null
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "Default per-operation timeouts applied to every supported AzAPI resource declared by the module. Defaults to null (provider defaults). Each value is a Go duration string, for example 30m or 1h.\n\n- create - (Optional) Timeout for create operations.\n- read   - (Optional) Timeout for read operations.\n- update - (Optional) Timeout for update operations.\n- delete - (Optional) Timeout for delete operations.\n"
  type = object({
    create = optional(string)
    read   = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = null
}
