variable "base_policy_name" {
  description = "(Required) The name of the base policy."
  type        = string
  default     = ""
}

variable "content_filters" {
  description = "content_filters block supports the following:\n- name               - (Required) Name of ContentFilter.\n- enabled            - (Required) If the ContentFilter is enabled.\n- severity_threshold - (Required) Level at which content is filtered. Possible values are Low, Medium, High.\n- blocking           - (Required) If blocking would occur.\n- source             - (Required) Content source to apply the Content Filters. Possible values are Prompt, Completion.\n"
  type = list(object({
    blocking           = bool
    enabled            = bool
    name               = string
    severity_threshold = string
    source             = string
  }))
  default = null
}

variable "custom_block_lists" {
  description = "custom_block_lists block supports the following:\n- source          - (Required) Content source to apply the Custom Block Lists. Possible values are Prompt, Completion.\n- block_list_name - (Required) Name of ContentFilter.\n- blocking        - (Required) If blocking would occur.\n"
  type = list(object({
    source          = string
    block_list_name = string
    blocking        = bool
  }))
  default = null
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the submodule.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "mode" {
  description = "(Required) RAI policy mode. The enum value mapping is Default, Deferred, Blocking, Asynchronous_filter. Use Asynchronous_filter for API versions after 2024-10-01."
  type        = string
  default     = ""
}

variable "name" {
  description = "(Required) The name of the RAI policy. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "(Required) The resource ID of the parent Cognitive Services / AI Services account that owns this RAI policy."
  type        = string
  default     = ""
}

variable "retry" {
  description = "Retry configuration applied to the azapi_resource managed by this submodule. Defaults to null (no custom retry).\n\n- error_message_regex  - (Optional) A list of regex patterns matching error messages that trigger a retry.\n- interval_seconds     - (Optional) Initial interval between retries in seconds.\n- max_interval_seconds - (Optional) Maximum interval between retries in seconds.\n- multiplier           - (Optional) The multiplier applied to the retry interval after each attempt.\n- randomization_factor - (Optional) The randomization factor applied to the retry interval.\n\nSee <https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/resource#retry> for full semantics.\n"
  type = object({
    error_message_regex  = optional(list(string))
    interval_seconds     = optional(number)
    max_interval_seconds = optional(number)
    multiplier           = optional(number)
    randomization_factor = optional(number)
  })
  default = null
}

variable "timeouts" {
  description = "Per-operation timeouts for the RAI policy resource. Defaults to null (provider defaults). Each value is a Go duration string (e.g. 30m, 1h).\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}
