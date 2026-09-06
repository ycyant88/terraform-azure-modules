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
  description = "Resource quota for the namespace.\n\n- cpu_limit - CPU limit of the namespace in one-thousandth CPU form. See [CPU resource units](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#meaning-of-cpu) for more details.\n- cpu_request - CPU request of the namespace in one-thousandth CPU form. See [CPU resource units](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#meaning-of-cpu) for more details.\n- memory_limit - Memory limit of the namespace in the power-of-two equivalents form: Ei, Pi, Ti, Gi, Mi, Ki. See [Memory resource units](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#meaning-of-memory) for more details.\n- memory_request - Memory request of the namespace in the power-of-two equivalents form: Ei, Pi, Ti, Gi, Mi, Ki. See [Memory resource units](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/#meaning-of-memory) for more details.\n\n"
  type = object({
    cpu_limit      = optional(string)
    cpu_request    = optional(string)
    memory_limit   = optional(string)
    memory_request = optional(string)
  })
  default = null
}

variable "delete_policy" {
  description = "Delete options of a namespace.\n"
  type        = string
  default     = null
}

variable "labels" {
  description = "The labels of managed namespace.\n"
  type        = map(string)
  default     = null
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

variable "tags" {
  description = "A mapping of tags to assign to the resource.\n"
  type        = map(string)
  default     = null
}
