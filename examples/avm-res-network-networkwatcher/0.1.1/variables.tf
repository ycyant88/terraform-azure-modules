variable "condition_monitor" {
  description = "  A map of condition monitors to create on the network watcher. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  - name - (Required) The name which should be used for this Network Connection Monitor. Changing this forces a new resource to be created.\n  - location - (Required) The Azure Region where the Network Connection Monitor should exist. Changing this forces a new resource to be created.\n  - endpoint - (Required) Set of endpoint configuration for the condition monitor.\n    - address - (Optional) The IP address or domain name of the Network Connection Monitor endpoint.\n    - coverage_level - (Optional) The test coverage for the Network Connection Monitor endpoint. Possible values are AboveAverage, Average, BelowAverage, Default, Full and Low.\n    - excluded_ip_addresses - (Optional) A list of IPv4/IPv6 subnet masks or IPv4/IPv6 IP addresses to be excluded to the Network Connection Monitor endpoint.\n    - included_ip_addresses - (Optional) A list of IPv4/IPv6 subnet masks or IPv4/IPv6 IP addresses to be included to the Network Connection Monitor endpoint.\n    - name - (Required) The name of the endpoint for the Network Connection Monitor .\n    - target_resource_id - (Optional) The resource ID which is used as the endpoint by the Network Connection Monitor.\n    - target_resource_type - (Optional) The endpoint type of the Network Connection Monitor. Possible values are AzureArcVM, AzureSubnet, AzureVM, AzureVNet, ExternalAddress, MMAWorkspaceMachine and MMAWorkspaceNetwork.\n    - filter supports the following:\n      - type - (Optional) The behaviour type of this endpoint filter. Currently the only allowed value is Include. Defaults to Include.\n      - item supports the following:\n        - address - (Optional) The address of the filter item.\n        - type - (Optional) The type of items included in the filter. Possible values are AgentAddress. Defaults to AgentAddress.\n  - test_configuration - (Required) Set of Test configuration for the condition monitor.\n    - name - (Required) The name of test configuration for the Network Connection Monitor.\n    - preferred_ip_version - (Optional) The preferred IP version which is used in the test evaluation. Possible values are IPv4 and IPv6.\n    - protocol - (Required) The protocol used to evaluate tests. Possible values are Tcp, Http and Icmp.\n    - test_frequency_in_seconds - (Optional) The time interval in seconds at which the test evaluation will happen. Defaults to 60.\n    - http_configuration (Optional) A HTTP Configuration as \n      - method - (Optional) The HTTP method for the HTTP request. Possible values are Get and Post. Defaults to Get.\n      - path - (Optional) The path component of the URI. It only accepts the absolute path.\n      - port - (Optional) The port for the HTTP connection.\n      - prefer_https - (Optional) Should HTTPS be preferred over HTTP in cases where the choice is not explicit? Defaults to false.\n      - valid_status_code_ranges - (Optional) The HTTP status codes to consider successful. For instance, 2xx, 301-304 and 418.\n    - request_header supports the following:\n      - name - (Required) The name of the HTTP header.\n      - value - (Required) The value of the HTTP header.\n    - icmp_configuration supports the following:\n      - trace_route_enabled - (Optional) Should path evaluation with trace route be enabled? Defaults to true.\n    - success_threshold supports the following:\n      - checks_failed_percent - (Optional) The maximum percentage of failed checks permitted for a test to be successful.\n      - round_trip_time_ms - (Optional) The maximum round-trip time in milliseconds permitted for a test to be successful.\n    - tcp_configuration supports the following:\n      - destination_port_behavior - (Optional) The destination port behavior for the TCP connection. Possible values are None and ListenIfAvailable.\n      - port - (Required) The port for the TCP connection.\n      - trace_route_enabled - (Optional) Should path evaluation with trace route be enabled? Defaults to true.\n  - test_group - (Required) Set of test groups for the condition monitor.\n    - destination_endpoints - (Required) A list of destination endpoint names.\n    - enabled - (Optional) Should the test group be enabled? Defaults to true.\n    - name - (Required) The name of the test group for the Network Connection Monitor.\n    - source_endpoints - (Required) A list of source endpoint names.\n    - test_configuration_names - (Required) A list of test configuration names.\n  - notes - (Optional) The description of the Network Connection Monitor.\n  - output_workspace_resource_ids - (Optional) A list of IDs of the Log Analytics Workspace which will accept the output from the Network Connection Monitor.\n"
  type = map(object({
    name = string
    endpoint = set(object({
      address               = optional(string)
      coverage_level        = optional(string)
      excluded_ip_addresses = optional(set(string))
      included_ip_addresses = optional(set(string))
      name                  = string
      target_resource_id    = optional(string)
      target_resource_type  = optional(string)
      filter = optional(object({
        type = optional(string)
        item = optional(set(object({
          address = optional(string)
          type    = optional(string)
        })))
      }))
    }))
    test_configuration = set(object({
      name                      = string
      preferred_ip_version      = optional(string)
      protocol                  = string
      test_frequency_in_seconds = optional(number)
      http_configuration = optional(object({
        method                   = optional(string)
        path                     = optional(string)
        port                     = optional(number)
        prefer_https             = optional(bool)
        protocol                 = string
        valid_status_code_ranges = optional(set(string))
        request_header = optional(set(object({
          name  = string
          value = string
        })))
      }))
      icmp_configuration = optional(object({
        trace_route_enabled = optional(bool)
      }))
      success_threshold = optional(object({
        checks_failed_percent = optional(number)
        round_trip_time_ms    = optional(number)
      }))
      tcp_configuration = optional(object({
        destination_port_behavior = optional(string)
        port                      = number
        trace_route_enabled       = optional(bool)
      }))
    }))
    test_group = set(object({
      destination_endpoints    = set(string)
      enabled                  = optional(bool)
      name                     = string
      source_endpoints         = set(string)
      test_configuration_names = set(string)
    }))
    notes                         = optional(string, null)
    output_workspace_resource_ids = optional(list(string), null)
  }))
  default = null
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "flow_logs" {
  description = "\nA map of role flow logs to create for the Network Watcher. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n- enabled - (Required) Should Network Flow Logging be Enabled?\n- name - (Required) The name of the Network Watcher Flow Log. Changing this forces a new resource to be created.\n- target_resource_id - (Required) The ID of the Network Security Group or Virtual Network for which to enable flow logs for. Changing this forces a new resource to be created.\n- network_watcher_name - (Required) The name of the Network Watcher. Changing this forces a new resource to be created.\n- storage_account_id - (Required) The ID of the Storage Account where flow logs are stored.\n- version - (Optional) The version (revision) of the flow log. Possible values are 1 and 2.\n- retention_policy Supports the following:\n  - days - (Required) The number of days to retain flow log records.\n  - enabled - (Required) Boolean flag to enable/disable retention.\n- traffic_analytics (Optional) Supports the following:\n  - enabled - (Required) Boolean flag to enable/disable traffic analytics.\n  - interval_in_minutes - (Optional) How frequently service should do flow analytics in minutes. Defaults to 60.\n  - workspace_id - (Required) The resource GUID of the attached workspace.\n  - workspace_region - (Required) The location of the attached workspace.\n  - workspace_resource_id - (Required) The resource ID of the attached workspace.\n"
  type = map(object({
    enabled            = bool
    name               = string
    target_resource_id = string
    retention_policy = object({
      days    = number
      enabled = bool
    })
    storage_account_id = string
    traffic_analytics = optional(object({
      enabled               = bool
      interval_in_minutes   = optional(number)
      workspace_id          = string
      workspace_region      = string
      workspace_resource_id = string
    }), null)
    version = optional(number, null)
  }))
  default = null
}

variable "location" {
  description = "Azure region where the resource should be deployed.  If null, the location will be inferred from the resource group location."
  type        = string
  default     = ""
}

variable "lock" {
  description = "Controls the Resource Lock configuration for this resource. The following properties can be specified:\n\n- kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n- name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n"
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "network_watcher_id" {
  description = "The ID of the Network Watcher."
  type        = string
  default     = ""
}

variable "network_watcher_name" {
  description = "The name of the Network Watcher."
  type        = string
  default     = ""
}

variable "network_watcher_resource_group_name" {
  description = "The name of the Network Watcher Resource Group."
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "A map of role assignments to create on the <RESOURCE>. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n- principal_id - The ID of the principal to assign the role to.\n- description - (Optional) The description of the role assignment.\n- skip_service_principal_aad_check - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n- condition - (Optional) The condition which will be used to scope the role assignment.\n- condition_version - (Optional) The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\n- delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\n- principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n\n> Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
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

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}
