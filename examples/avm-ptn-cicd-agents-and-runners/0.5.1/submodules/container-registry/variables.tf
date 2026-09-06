variable "container_compute_identity_principal_id" {
  description = "The principal id of the managed identity used by the container compute to pull images from the container registry"
  type        = string
  default     = ""
}

variable "enable_telemetry" {
  description = "Whether to enable telemetry for the container registry"
  type        = bool
  default     = ""
}

variable "images" {
  description = "A map of objects that define the images to build in the container registry. The key of the map is the name of the image and the value is an object with the following attributes:\n\n- task_name - The name of the task to create for building the image (e.g. image-build-task)\n- dockerfile_path - The path to the Dockerfile to use for building the image (e.g. dockerfile)\n- context_path - The path to the context of the Dockerfile in three sections <repository-url>#<repository-commit>:<repository-folder-path> (e.g. https://github.com/Azure/terraform-azurerm-avm-ptn-cicd-agents-and-runners#8ff4b85:container-images/azure-devops-agent)\n- context_access_token - The access token to use for accessing the context. Supply a PAT if targetting a private repository.\n- image_names - A list of the names of the images to build (e.g. [\"image-name:tag\"])\n"
  type = map(object({
    task_name            = string
    dockerfile_path      = string
    context_path         = string
    context_access_token = optional(string, "a") # This `a` is a dummy value because the context_access_token should not be required in the provider
    image_names          = list(string)
  }))
  default = {}
}

variable "location" {
  description = "Azure region where the resource should be deployed."
  type        = string
  default     = ""
}

variable "name" {
  description = "The name of the container registry"
  type        = string
  default     = ""
}

variable "private_dns_zone_id" {
  description = "The id of the private DNS zone to create for the container registry. Only required if container_registry_private_dns_zone_creation_enabled is false and you are not using policy to update the DNS zone."
  type        = string
  default     = null
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the container registry"
  type        = string
  default     = ""
}

variable "subnet_id" {
  description = "The id of the subnet to use for the private endpoint"
  type        = string
  default     = null
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "use_private_networking" {
  description = "Whether to use private networking for the container registry"
  type        = bool
  default     = ""
}

variable "use_zone_redundancy" {
  description = "Enable zone redundancy for the deployment"
  type        = bool
  default     = true
}
