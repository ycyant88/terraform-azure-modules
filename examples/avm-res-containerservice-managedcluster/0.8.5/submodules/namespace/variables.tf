variable "adoption_policy" {
  description = "Action if Kubernetes namespace with same name already exists.\n"
  type        = string
  default     = null
}

variable "annotations" {
  description = "The annotations of managed namespace.\n"
  type        = map(string)
  default     = null
}

variable "default_network_policy" {
  description = "Default network policy of the namespace, specifying ingress and egress rules.\n\n- egress - Enum representing different network policy rules.\n- ingress - Enum representing different network policy rules.\n\n"
  type = object({
    egress  = optional(string)
    ingress = optional(string)
  })
  default = null
}

variable "default_resource_quota" {
  description = "Resource quota for the namespace. This is required by the Azure API even though the API spec marks it as optional.\n\n- cpu_limit - CPU limit of the namespace in one-thousandth CPU form. See [CPU resource units](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#meaning-of-cpu) for more details.\n- cpu_request - CPU request of the namespace in one-thousandth CPU form. See [CPU resource units](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#meaning-of-cpu) for more details.\n- memory_limit - Memory limit of the namespace in the power-of-two equivalents form: Ei, Pi, Ti, Gi, Mi, Ki. See [Memory resource units](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#meaning-of-memory) for more details.\n- memory_request - Memory request of the namespace in the power-of-two equivalents form: Ei, Pi, Ti, Gi, Mi, Ki. See [Memory resource units](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#meaning-of-memory) for more details.\n\n"
  type = object({
    cpu_limit      = optional(string)
    cpu_request    = optional(string)
    memory_limit   = optional(string)
    memory_request = optional(string)
  })
  default = ""
}

variable "delete_policy" {
  description = "Delete options of a namespace.\n"
  type        = string
  default     = null
}

variable "ignore_body_changes" {
  description = "Body-relative paths to ignore for each AzAPI resource, in dot notation. Changes take\neffect only after apply, and ignored configuration is not sent to Azure until the\npath is removed.\n\n- containerservice_managed_clusters_managed_namespaces - Paths ignored on the managed namespace.\n"
  type = object({
    containerservice_managed_clusters_managed_namespaces = optional(list(string), [])
  })
  default = {}
}

variable "labels" {
  description = "The labels of managed namespace.\n"
  type        = map(string)
  default     = null
}

variable "location" {
  description = "The location of the resource.\n"
  type        = string
  default     = ""
}

variable "name" {
  description = "The name of the resource.\n"
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "The parent resource ID for this resource.\n"
  type        = string
  default     = ""
}

variable "resource_types" {
  description = "AzAPI resource types and API versions used by this module.\n\n- containerservice_managed_clusters_managed_namespaces - Resource type and API version for the managed namespace.\n"
  type = object({
    containerservice_managed_clusters_managed_namespaces = optional(string, "Microsoft.ContainerService/managedClusters/managedNamespaces@2026-03-01")
  })
  default = {}
}

variable "retry" {
  description = "Retry configuration applied to the AzAPI resources in this module.\n\n- error_message_regex - Regular expressions matching error messages that should be retried.\n- interval_seconds - Initial delay between retries, in seconds.\n- max_interval_seconds - Maximum delay between retries, in seconds.\n"
  type = object({
    error_message_regex  = optional(list(string))
    interval_seconds     = optional(number)
    max_interval_seconds = optional(number)
  })
  default = null
}

variable "tags" {
  description = "A mapping of tags to assign to the resource.\n"
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "Timeouts applied to the AzAPI resources in this module.\n\n- create - Timeout for create operations.\n- read - Timeout for read operations.\n- update - Timeout for update operations.\n- delete - Timeout for delete operations.\n"
  type = object({
    create = optional(string)
    read   = optional(string)
    update = optional(string)
    delete = optional(string)
  })
  default = null
}
