variable "agent_profile_grace_period_time_span" {
  description = "How long should the stateful machines be kept around. Maximum value is 7 days and the format must be in d:hh:mm:ss."
  type        = string
  default     = null
}

variable "agent_profile_kind" {
  description = "The kind of agent profile."
  type        = string
  default     = "Stateless"
}

variable "agent_profile_max_agent_lifetime" {
  description = "The maximum lifetime of the agent. Maximum value is 7 days and the format must be in d:hh:mm:ss."
  type        = string
  default     = null
}

variable "agent_profile_resource_prediction_profile" {
  description = "The resource prediction profile for the agent, a.k.a Stand by agent mode, supported values are 'Off', 'Manual', 'Automatic', defaults to 'Off'."
  type        = string
  default     = "Off"
}

variable "agent_profile_resource_prediction_profile_automatic" {
  description = "The automatic resource prediction profile for the agent.\n\nThe object can have the following attributes:\n- kind - (Required) The kind of prediction profile. Default is \"Automatic\".\n- prediction_preference - (Required) The preference for resource prediction. Supported values are Balanced, MostCostEffective, MoreCostEffective, MorePerformance, and BestPerformance.\n"
  type = object({
    kind                  = optional(string, "Automatic")
    prediction_preference = optional(string, "Balanced")
  })
  default = { "kind" : "Automatic", "prediction_preference" : "Balanced" }
}

variable "agent_profile_resource_prediction_profile_manual" {
  description = "The manual resource prediction profile for the agent."
  type = object({
    kind = string
  })
  default = { "kind" : "Manual" }
}

variable "agent_profile_resource_predictions_manual" {
  description = "An object representing manual resource predictions for agent profiles, including time zone and optional daily schedules.\n\n- time_zone - (Optional) The time zone for the agent profile. E.g. \"Eastern Standard Time\". Defaults to UTC. To see valid values for this run this command in PowerShell: [System.TimeZoneInfo]::GetSystemTimeZones() | Select Id, BaseUtcOffSet\n- days_data - (Optional) A list representing the manual schedules. Defaults to a single standby agent constantly running.\n\nThe days_data list should contain one or seven maps. Supply one to apply the same schedule each day. Supply seven for a different schedule each day.\n\nExamples: \n\n- To set always having 1 agent available, you would use the following configuration:\n\n  hcl\n  agent_profile_resource_predictions_manual = {\n    days_data = [\n      {\n        \"00:00:00\" = 1\n      }\n    ]\n  }\n  \n\n- To set the schedule for every day to scale to one agent at 8:00 AM and scale down to zero agents at 5:00 PM, you would use the following configuration:\n\n  hcl\n  agent_profile_resource_predictions_manual = {\n    time_zone = \"Eastern Standard Time\"\n    days_data = [\n      {\n        \"08:00:00\" = 1\n        \"17:00:00\" = 0\n      }\n    ]\n  }\n  \n\n- To set a different schedule for each day, you would use the following configuration:\n\n  hcl\n  agent_profile_resource_predictions_manual = {\n    time_zone = \"Eastern Standard Time\"\n    days_data = [\n      # Sunday\n      {}, # Empty map to skip Sunday\n      # Monday\n      {\n        \"03:00:00\" = 2  # Scale to 2 agents at 3:00 AM\n        \"08:00:00\" = 4  # Scale to 4 agents at 8:00 AM\n        \"17:00:00\" = 2  # Scale to 2 agents at 5:00 PM\n        \"22:00:00\" = 0  # Scale to 0 agents at 10:00 PM\n      },\n      # Tuesday\n      {\n        \"08:00:00\" = 2\n        \"17:00:00\" = 0\n      },\n      # Wednesday\n      {\n        \"08:00:00\" = 2\n        \"17:00:00\" = 0\n      },\n      # Thursday\n      {\n        \"08:00:00\" = 2\n        \"17:00:00\" = 0\n      },\n      # Friday\n      {\n        \"08:00:00\" = 2\n        \"17:00:00\" = 0\n      },\n      # Saturday\n      {} # Empty map to skip Saturday\n    ]\n  }\n  \n\n"
  type = object({
    time_zone = optional(string, "UTC")
    days_data = optional(list(map(number)))
  })
  default = { "days_data" : [{ "00:00:00" : 1 }] }
}

variable "dev_center_project_resource_id" {
  description = "(Required) The resource ID of the Dev Center project."
  type        = string
  default     = ""
}

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
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "fabric_profile_data_disks" {
  description = "A list of objects representing the configuration for fabric profile data disks.\n\n- caching - (Optional) The caching setting for the data disk. Valid values are None, ReadOnly, and ReadWrite. Defaults to ReadWrite.\n- disk_size_gigabytes - (Optional) The size of the data disk in GiB. Defaults to 100GB.\n- drive_letter - (Optional) The drive letter for the data disk, If you have any Windows agent images in your pool, choose a drive letter for your disk. If you don't specify a drive letter, F is used for VM sizes with a temporary disk; otherwise E is used. The drive letter must be a single letter except A, C, D, or E. If you are using a VM size without a temporary disk and want E as your drive letter, leave Drive Letter empty to get the default value of E.\n- storage_account_type - (Optional) The storage account type for the data disk. Defaults to \"Premium_ZRS\".\n\nValid values for storage_account_type are:\n- Premium_LRS\n- Premium_ZRS\n- StandardSSD_LRS\n- Standard_LRS\n"
  type = list(object({
    caching              = optional(string, "ReadWrite")
    disk_size_gigabytes  = optional(number, 100)
    drive_letter         = optional(string, null)
    storage_account_type = optional(string, "Premium_ZRS")
  }))
  default = []
}

variable "fabric_profile_images" {
  description = "The list of images to use for the fabric profile.\n\nEach object in the list can have the following attributes:\n- resource_id - (Optional) The resource ID of the image, this can either be resource ID of a Standard Azure VM Image or a Image that is hosted within Azure Image Gallery.\n- well_known_image_name - (Optional) The well-known name of the image, thid is used to reference the well-known images that are available on Microsoft Hosted Agents, supported images are ubuntu-22.04/latest, ubuntu-20.04/latest, windows-2022/latest, and windows-2019/latest.\n- buffer - (Optional) The buffer associated with the image.\n- aliases - (Required) A list of aliases for the image.\n"
  type = list(object({
    resource_id           = optional(string)
    well_known_image_name = optional(string)
    buffer                = optional(string, "*")
    aliases               = optional(list(string))
  }))
  default = [{ "aliases" : ["ubuntu-22.04/latest"], "well_known_image_name" : "ubuntu-22.04/latest" }]
}

variable "fabric_profile_os_disk_storage_account_type" {
  description = "The storage account type for the OS disk, possible values are 'Standard', 'Premium' and 'StandardSSD', defaults to 'Premium'."
  type        = string
  default     = "Premium"
}

variable "fabric_profile_sku_name" {
  description = "The SKU name of the fabric profile, make sure you have enough quota for the SKU, the CPUs are multiplied by the maximum_concurrency value, make sure you request enough quota, defaults to 'Standard_D2ads_v5' which has 2 vCPU Cores. so if maximum_concurrency is 2, you will need quota for 4 vCPU Cores and so on."
  type        = string
  default     = "Standard_D2ads_v5"
}

variable "location" {
  description = "Azure region where the resource should be deployed."
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

variable "managed_identities" {
  description = "Controls the Managed Identity configuration on this resource. The following properties can be specified:\n\n- system_assigned - (Optional) Specifies if the System Assigned Managed Identity should be enabled.\n- user_assigned_resource_ids - (Optional) Specifies a list of User Assigned Managed Identity resource IDs to be assigned to this resource.\n"
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default = {}
}

variable "maximum_concurrency" {
  description = "The maximum number of agents that can run concurrently, must be between 1 and 10000, defaults to 1."
  type        = number
  default     = 1
}

variable "name" {
  description = "Name of the pool. It needs to be globally unique for each Azure DevOps Organization."
  type        = string
  default     = ""
}

variable "organization_profile" {
  description = "An object representing the configuration for an organization profile, including organizations and permission profiles. \n\nThis is for advanced use cases where you need to specify permissions and multiple organization. \n\nIf not suppled, then version_control_system_organization_name and optionally version_control_system_project_names must be supplied.\n\n- organizations - (Required) A list of objects representing the organizations.\n  - name - (Required) The name of the organization, without the https://dev.azure.com/ prefix.\n  - projects - (Optional) A list of project names this agent should run on. If empty, it will run on all projects. Defaults to [].\n  - parallelism - (Optional) The parallelism value. If multiple organizations are specified, this value needs to be set and cannot exceed the total value of maximum_concurrency; otherwise, it will use the maximum_concurrency value as default or the value you define for single Organization.\n- permission_profile - (Required) An object representing the permission profile.\n  - kind - (Required) The kind of permission profile, possible values are CreatorOnly, Inherit, and SpecificAccounts, if SpecificAccounts is chosen, you must provide a list of users and/or groups.\n  - users - (Optional) A list of users for the permission profile, supported value is the ObjectID or UserPrincipalName. Defaults to null.\n  - groups - (Optional) A list of groups for the permission profile, supported value is the ObjectID of the group. Defaults to null.\n"
  type = object({
    kind = optional(string, "AzureDevOps")
    organizations = list(object({
      name        = string
      projects    = optional(list(string), []) # List of all Projects names this agent should run on, if empty, it will run on all projects.
      parallelism = optional(number)           # If multiple organizations are specified, this value needs to be set, otherwise it will use the maximum_concurrency value.
    }))
    permission_profile = optional(object({
      kind   = optional(string, "CreatorOnly")
      users  = optional(list(string), null)
      groups = optional(list(string), null)
      }), {
      kind = "CreatorOnly"
    })
  })
  default = null
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

variable "subnet_id" {
  description = "The virtual network subnet resource id to use for private networking."
  type        = string
  default     = null
}

variable "subscription_id" {
  description = "The subscription ID to use for the resource. Only required if you want to target a different subscription the the current context."
  type        = string
  default     = null
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "version_control_system_organization_name" {
  description = "The name of the version control system organization. This is required if organization_profile is not supplied."
  type        = string
  default     = null
}

variable "version_control_system_project_names" {
  description = "The name of the version control system project. This is optional if organization_profile is not supplied."
  type        = set(string)
  default     = []
}

variable "version_control_system_type" {
  description = "The type of version control system. This is shortcut alternative to organization_profile.kind. Possible values are 'azuredevops' or 'github'."
  type        = string
  default     = "azuredevops"
}
