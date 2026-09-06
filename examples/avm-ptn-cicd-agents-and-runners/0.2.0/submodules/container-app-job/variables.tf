variable "container_app_environment_id" {
  description = "The resource id of the Container App Environment."
  type        = string
  default     = ""
}

variable "container_cpu" {
  description = "Required CPU in cores, e.g. 0.5"
  type        = number
  default     = ""
}

variable "container_image_name" {
  description = "Fully qualified name of the Docker image the agents should run."
  type        = string
  default     = ""
}

variable "container_memory" {
  description = "Required memory, e.g. '250Mb'"
  type        = string
  default     = ""
}

variable "environment_variables" {
  description = "List of environment variables to pass to the container."
  type = set(object({
    name  = string
    value = string
  }))
  default = ""
}

variable "environment_variables_placeholder" {
  description = "List of environment variables to pass only to the placeholder container."
  type = set(object({
    name  = string
    value = string
  }))
  default = []
}

variable "job_container_name" {
  description = "The name of the container for the runner Container Apps job."
  type        = string
  default     = ""
}

variable "job_name" {
  description = "The name of the Container App job."
  type        = string
  default     = ""
}

variable "keda_meta_data" {
  description = "The metadata for the KEDA scaler."
  type        = map(string)
  default     = ""
}

variable "keda_rule_type" {
  description = "The type of the KEDA rule."
  type        = string
  default     = ""
}

variable "location" {
  description = "Azure region where the resource should be deployed."
  type        = string
  default     = ""
}

variable "max_execution_count" {
  description = "The maximum number of executions to spawn per polling interval."
  type        = number
  default     = ""
}

variable "min_execution_count" {
  description = "The minimum number of executions to spawn per polling interval."
  type        = number
  default     = ""
}

variable "placeholder_container_name" {
  description = "The name of the container for the placeholder Container Apps job."
  type        = string
  default     = null
}

variable "placeholder_job_creation_enabled" {
  description = "Whether or not to create a placeholder job."
  type        = bool
  default     = false
}

variable "placeholder_job_name" {
  description = "The name of the Container App placeholder job."
  type        = string
  default     = null
}

variable "placeholder_replica_retry_limit" {
  description = "The number of times to retry the placeholder Container Apps job."
  type        = number
  default     = 3
}

variable "placeholder_replica_timeout" {
  description = "The timeout in seconds for the placeholder Container Apps job."
  type        = number
  default     = 300
}

variable "polling_interval_seconds" {
  description = "How often should the pipeline queue be checked for new events, in seconds."
  type        = number
  default     = ""
}

variable "postfix" {
  description = "Postfix used for naming the resources where the name isn't supplied."
  type        = string
  default     = ""
}

variable "registry_login_server" {
  description = "The login server of the container registry."
  type        = string
  default     = ""
}

variable "registry_password" {
  description = "Password of the container registry."
  type        = string
  default     = null
}

variable "registry_username" {
  description = "Name of the container registry."
  type        = string
  default     = null
}

variable "replica_retry_limit" {
  description = "The number of times to retry the runner Container Apps job."
  type        = number
  default     = ""
}

variable "replica_timeout" {
  description = "The timeout in seconds for the runner Container Apps job."
  type        = number
  default     = ""
}

variable "resource_group_id" {
  description = "The id of the resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "sensitive_environment_variables" {
  description = "List of sensitive environment variables to pass to the container."
  type = set(object({
    name                      = string
    value                     = string
    container_app_secret_name = string
    keda_auth_name            = optional(string)
  }))
  default = ""
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "user_assigned_managed_identity_id" {
  description = "The resource Id of the user assigned managed identity."
  type        = string
  default     = ""
}
