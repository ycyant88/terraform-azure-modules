variable "credential_set_resource_id" {
  description = "Optional ARM resource ID of a credential set (Microsoft.ContainerRegistry/registries/credentialSets) used to authenticate to the upstream registry. Required for rate-limited or private upstreams such as Docker Hub; omit for public upstreams such as Microsoft Container Registry.\n"
  type        = string
  default     = null
}

variable "name" {
  description = "The name of the cache rule. Must be 5-50 characters long and can only contain letters, numbers and hyphens."
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "The fully-qualified ARM resource ID of the Container Registry into which this cache rule will be deployed (e.g. /subscriptions/.../resourceGroups/.../providers/Microsoft.ContainerRegistry/registries/myregistry). This submodule **does not** create the parent registry.\n"
  type        = string
  default     = ""
}

variable "resource_types" {
  description = "A map controlling the AzAPI resource type (and API version) used for each azapi_resource this submodule manages.\n\n- this - The Microsoft.ContainerRegistry/registries/cacheRules resource type and API version to use.\n"
  type = object({
    this = optional(string, "Microsoft.ContainerRegistry/registries/cacheRules@2025-11-01")
  })
  default = {}
}

variable "retry" {
  description = "Retry configuration applied to the cache rule azapi resource. Defaults to null (no custom retry).\n\n- error_message_regex  - (Optional) Regex patterns matching error messages that trigger a retry.\n- interval_seconds     - (Optional) Initial interval between retries in seconds.\n- max_interval_seconds - (Optional) Maximum interval between retries in seconds.\n"
  type = object({
    error_message_regex  = optional(list(string))
    interval_seconds     = optional(number)
    max_interval_seconds = optional(number)
  })
  default = null
}

variable "source_repository" {
  description = "The source repository pulled from the upstream registry. This **must** be the fully-qualified upstream path, including the registry host, for example docker.io/library/nginx for Docker Hub or mcr.microsoft.com/mcr/hello-world for Microsoft Container Registry.\n"
  type        = string
  default     = ""
}

variable "target_repository" {
  description = "The target repository in the Container Registry where cached images are stored, for example nginx (used as <registry>.azurecr.io/nginx:<tag>)."
  type        = string
  default     = ""
}

variable "timeouts" {
  description = "Per-operation timeouts applied to the cache rule azapi resource. Defaults to null (provider defaults). Each value is a Go duration string (e.g. 30m, 1h).\n"
  type = object({
    create = optional(string)
    read   = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = null
}
