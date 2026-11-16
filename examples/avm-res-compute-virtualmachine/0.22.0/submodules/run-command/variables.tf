variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "error_blob_managed_identity" {
  description = "error_blob_managed_identity - (Optional): An error_blob_managed_identity block as defined below. User-assigned managed Identity that has access to errorBlobUri storage blob.\n"
  type = object({
    client_id = optional(string)
    object_id = optional(string)
  })
  default = null
}

variable "error_blob_uri" {
  description = "error_blob_uri - (Optional): Specifies the Azure storage blob where script error stream will be uploaded. It can be basic blob URI with SAS token.\n"
  type        = string
  default     = null
}

variable "ignore_body_changes" {
  description = "Body-relative paths whose changes the AzAPI provider ignores, per resource. Paths use dot notation,\nfor example properties.source. Individual list items cannot be targeted; ignore the whole list\nproperty instead.\n\nConfiguration changes at an ignored path are not sent to Azure until that path is removed from the\nlist. Because the value is held in provider-private state, a change takes effect only after an\napply.\n\n- compute_virtual_machines_run_commands - Ignored body paths for the virtual machine run command.\n"
  type = object({
    compute_virtual_machines_run_commands = optional(list(string), [])
  })
  default = {}
}

variable "location" {
  description = "location - (Required): The Azure Region where the Virtual Machine Run Command should exist. Changing this forces a new Virtual Machine Run Command to be created.\n"
  type        = string
  default     = ""
}

variable "name" {
  description = "name - (Required): Specifies the name of this Virtual Machine Run Command. Changing this forces a new Virtual Machine Run Command to be created.\n"
  type        = string
  default     = ""
}

variable "output_blob_managed_identity" {
  description = "output_blob_managed_identity - (Optional): An output_blob_managed_identity block as defined below. User-assigned managed Identity that has access to outputBlobUri storage blob.\n"
  type = object({
    client_id = optional(string)
    object_id = optional(string)
  })
  default = null
}

variable "output_blob_uri" {
  description = "output_blob_uri - (Optional): Specifies the Azure storage blob where script output stream will be uploaded. It can be basic blob URI with SAS token.\n"
  type        = string
  default     = null
}

variable "parameters" {
  description = "parameters - (Optional): A map of parameter blocks as defined below. The parameters used by the script.\n- map key (Required): A unique map key for each parameter.\n  - name (Required): The run parameter name.\n  - value (Required): The run parameter value.\n"
  type = map(object({
    name  = string
    value = string
  }))
  default = {}
}

variable "protected_parameters" {
  description = "protected_parameters - (Optional): A list of protected_parameter blocks as defined below. The protected parameters used by the script.\n- map key (Required): A unique map key for each parameter.\n  - name (Required): The run parameter name.\n  - value (Required): The run parameter value.\n"
  type = map(object({
    name  = string
    value = string
  }))
  default = {}
}

variable "resource_types" {
  description = "Override the AzAPI <provider>/<resource>@<api-version> strings used by this module. Each key\ndefaults to a tested value; supply only the keys you want to override.\n\n- compute_virtual_machines_run_commands - The virtual machine run command.\n"
  type = object({
    compute_virtual_machines_run_commands = optional(string, "Microsoft.Compute/virtualMachines/runCommands@2024-11-01")
  })
  default = {}
}

variable "retry" {
  description = "Retry configuration applied to every AzAPI resource managed by the module. Defaults to null (no\ncustom retry).\n\n- error_message_regex - (Optional) A list of regex patterns matching error messages that trigger a retry.\n- interval_seconds - (Optional) Initial interval between retries in seconds.\n- max_interval_seconds - (Optional) Maximum interval between retries in seconds.\n"
  type = object({
    error_message_regex  = optional(list(string))
    interval_seconds     = optional(number)
    max_interval_seconds = optional(number)
  })
  default = null
}

variable "run_as_password" {
  description = "run_as_password - (Optional): Specifies the user account password on the VM when executing the Virtual Machine Run Command.\n"
  type        = string
  default     = null
}

variable "run_as_user" {
  description = "run_as_user - (Optional): Specifies the user account on the VM when executing the Virtual Machine Run Command.\n"
  type        = string
  default     = null
}

variable "script_source" {
  description = "script_source - (Required): A source block as defined below. The source of the run command script.\n"
  type = object({
    command_id = optional(string)
    script     = optional(string)
    script_uri = optional(string)
    script_uri_managed_identity = optional(object({
      client_id = optional(string)
      object_id = optional(string)
    }))
  })
  default = ""
}

variable "tags" {
  description = "tags - (Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "An object of timeouts to apply to the creation and destruction of resources.\n\n- create - (Optional) The timeout for creating the resource.\n- delete - (Optional) The timeout for deleting the resource.\n- update - (Optional) The timeout for updating the resource.\n- read - (Optional) The timeout for reading the resource.\n\nEach time duration is parsed using this function: <https://pkg.go.dev/time#ParseDuration>.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    update = optional(string)
    read   = optional(string)
  })
  default = {}
}

variable "virtualmachine_resource_id" {
  description = "virtualmachine_resource_id - (Required): Specifies the resource id of the Virtual Machine to apply the Run Command to.\n"
  type        = string
  default     = ""
}
