variable "dynamic_throttling_enabled" {
  description = "(Optional) Whether dynamic throttling is enabled. Defaults to false."
  type        = bool
  default     = false
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the submodule.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "lock_id" {
  description = "(Optional) Resource ID used as a mutex to serialize deployment operations. When set, the parent Cognitive Services Account ID is typically used so AzAPI serializes create/update operations across sibling deployments."
  type        = string
  default     = null
}

variable "model" {
  description = "- format  - (Required) The format of the Cognitive Services Account Deployment model. Possible value is OpenAI.\n- name    - (Required) The name of the Cognitive Services Account Deployment model.\n- version - (Optional) The version of Cognitive Services Account Deployment model.\n"
  type = object({
    format  = string
    name    = string
    version = optional(string)
  })
  default = ""
}

variable "name" {
  description = "(Required) The name of the Cognitive Services Account Deployment. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "(Required) The resource ID of the parent Cognitive Services Account that owns this deployment."
  type        = string
  default     = ""
}

variable "rai_policy_name" {
  description = "(Optional) The name of the RAI policy associated with the deployment."
  type        = string
  default     = null
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

variable "scale" {
  description = "- type     - (Required) The name of the SKU.\n- capacity - (Optional) Tokens-per-Minute (TPM). Defaults to 1.\n- family   - (Optional) Hardware generation, for the same SKU.\n- size     - (Optional) The SKU size.\n- tier     - (Optional) Possible values are Free, Basic, Standard, Premium, Enterprise.\n"
  type = object({
    capacity = optional(number, 1)
    family   = optional(string)
    size     = optional(string)
    tier     = optional(string)
    type     = string
  })
  default = ""
}

variable "timeouts" {
  description = "Per-operation timeouts for the deployment resource. Defaults to null (provider defaults). Each value is a Go duration string (e.g. 30m, 1h).\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}

variable "version_upgrade_option" {
  description = "(Optional) Deployment model version upgrade option. Possible values are OnceNewDefaultVersionAvailable, OnceCurrentVersionExpired, and NoAutoUpgrade. Defaults to OnceNewDefaultVersionAvailable."
  type        = string
  default     = "OnceNewDefaultVersionAvailable"
}
