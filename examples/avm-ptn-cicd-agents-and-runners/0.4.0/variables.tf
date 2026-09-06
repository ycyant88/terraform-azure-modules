variable "compute_types" {
  description = "The types of compute to use. Allowed values are 'azure_container_app' and 'azure_container_instance'."
  type        = set(string)
  default     = ["azure_container_app"]
}

variable "container_app_container_cpu" {
  description = "Required CPU in cores, e.g. 0.5"
  type        = number
  default     = 1
}

variable "container_app_container_memory" {
  description = "Required memory, e.g. '250Mb'"
  type        = string
  default     = "2Gi"
}

variable "container_app_environment_creation_enabled" {
  description = "Whether or not to create a Container App Environment."
  type        = bool
  default     = true
}

variable "container_app_environment_id" {
  description = "The resource id of the Container App Environment. Only required if container_app_environment_creation_enabled is false."
  type        = string
  default     = null
}

variable "container_app_environment_name" {
  description = "The name of the Container App Environment. Only required if container_app_environment_creation_enabled is true."
  type        = string
  default     = null
}

variable "container_app_environment_variables" {
  description = "List of additional environment variables to pass to the container."
  type = set(object({
    name  = string
    value = string
  }))
  default = []
}

variable "container_app_infrastructure_resource_group_name" {
  description = "The name of the resource group where the Container Apps infrastructure is deployed."
  type        = string
  default     = null
}

variable "container_app_job_container_name" {
  description = "The name of the container for the runner Container Apps job."
  type        = string
  default     = null
}

variable "container_app_job_name" {
  description = "The name of the Container App runner job."
  type        = string
  default     = null
}

variable "container_app_max_execution_count" {
  description = "The maximum number of executions (ADO jobs) to spawn per polling interval."
  type        = number
  default     = 100
}

variable "container_app_min_execution_count" {
  description = "The minimum number of executions (ADO jobs) to spawn per polling interval."
  type        = number
  default     = 0
}

variable "container_app_placeholder_container_name" {
  description = "The name of the container for the placeholder Container Apps job."
  type        = string
  default     = null
}

variable "container_app_placeholder_job_name" {
  description = "The name of the Container App placeholder job."
  type        = string
  default     = null
}

variable "container_app_placeholder_replica_retry_limit" {
  description = "The number of times to retry the placeholder Container Apps job."
  type        = number
  default     = 0
}

variable "container_app_placeholder_replica_timeout" {
  description = "The timeout in seconds for the placeholder Container Apps job."
  type        = number
  default     = 300
}

variable "container_app_polling_interval_seconds" {
  description = "How often should the pipeline queue be checked for new events, in seconds."
  type        = number
  default     = 30
}

variable "container_app_replica_retry_limit" {
  description = "The number of times to retry the runner Container Apps job."
  type        = number
  default     = 3
}

variable "container_app_replica_timeout" {
  description = "The timeout in seconds for the runner Container Apps job."
  type        = number
  default     = 1800
}

variable "container_app_sensitive_environment_variables" {
  description = "List of additional sensitive environment variables to pass to the container."
  type = set(object({
    name                      = string
    value                     = string
    container_app_secret_name = string
    keda_auth_name            = optional(string)
  }))
  default = []
}

variable "container_app_subnet_address_prefix" {
  description = "The address prefix for the Container App Environment. Either subnet_id or subnet_name and subnet_address_prefix must be specified."
  type        = string
  default     = null
}

variable "container_app_subnet_cidr_size" {
  description = "The CIDR size for the container instance subnet."
  type        = number
  default     = 27
}

variable "container_app_subnet_id" {
  description = "The ID of a pre-existing subnet to use. Required if virtual_network_creation_enabled is false."
  type        = string
  default     = null
}

variable "container_app_subnet_name" {
  description = "The name of the subnet. Must be specified if virtual_network_creation_enabled is true."
  type        = string
  default     = null
}

variable "container_instance_container_cpu" {
  description = "The CPU value for the container instance"
  type        = number
  default     = 2
}

variable "container_instance_container_cpu_limit" {
  description = "The CPU limit value for the container instance"
  type        = number
  default     = 2
}

variable "container_instance_container_memory" {
  description = "The memory value for the container instance"
  type        = number
  default     = 4
}

variable "container_instance_container_memory_limit" {
  description = "The memory limit value for the container instance"
  type        = number
  default     = 4
}

variable "container_instance_container_name" {
  description = "The name of the container instance"
  type        = string
  default     = null
}

variable "container_instance_count" {
  description = "The number of container instances to create"
  type        = number
  default     = 2
}

variable "container_instance_environment_variables" {
  description = "List of additional environment variables to pass to the container."
  type = set(object({
    name  = string
    value = string
  }))
  default = []
}

variable "container_instance_name_prefix" {
  description = "The name prefix of the container instance"
  type        = string
  default     = null
}

variable "container_instance_sensitive_environment_variables" {
  description = "List of additional sensitive environment variables to pass to the container."
  type = set(object({
    name  = string
    value = string
  }))
  default = []
}

variable "container_instance_subnet_address_prefix" {
  description = "The address prefix for the Container App Environment. Either subnet_id or subnet_name and subnet_address_prefix must be specified."
  type        = string
  default     = null
}

variable "container_instance_subnet_cidr_size" {
  description = "The CIDR size for the container instance subnet."
  type        = number
  default     = 28
}

variable "container_instance_subnet_id" {
  description = "The ID of a pre-existing subnet to use. Required if virtual_network_creation_enabled is false."
  type        = string
  default     = null
}

variable "container_instance_subnet_name" {
  description = "The name of the subnet. Must be specified if virtual_network_creation_enabled == false."
  type        = string
  default     = null
}

variable "container_instance_use_availability_zones" {
  description = "Whether to use availability zones for the container instance"
  type        = bool
  default     = true
}

variable "container_registry_creation_enabled" {
  description = "Whether or not to create a container registry."
  type        = bool
  default     = true
}

variable "container_registry_dns_zone_id" {
  description = "The ID of the private DNS zone to create for the container registry. Only required if container_registry_private_dns_zone_creation_enabled is false and you are not using policy to update the DNS zone."
  type        = string
  default     = null
}

variable "container_registry_name" {
  description = "The name of the container registry. Only required if container_registry_creation_enabled is true."
  type        = string
  default     = null
}

variable "container_registry_private_dns_zone_creation_enabled" {
  description = "Whether or not to create a private DNS zone for the container registry."
  type        = bool
  default     = true
}

variable "container_registry_private_endpoint_subnet_address_prefix" {
  description = "The address prefix for the Container App Environment. Either subnet_id or subnet_name and subnet_address_prefix must be specified."
  type        = string
  default     = null
}

variable "container_registry_private_endpoint_subnet_id" {
  description = "The ID of a pre-existing subnet to use. Required if virtual_network_creation_enabled is false."
  type        = string
  default     = null
}

variable "container_registry_private_endpoint_subnet_name" {
  description = "The name of the subnet. Must be specified if virtual_network_creation_enabled == false."
  type        = string
  default     = null
}

variable "container_registry_subnet_cidr_size" {
  description = "The CIDR size for the container registry subnet."
  type        = number
  default     = 29
}

variable "custom_container_registry_images" {
  description = "The images to build and push to the container registry. This is only relevant if container_registry_creation_enabled is true and use_default_container_image is set to false.\n\n- task_name: The name of the task to create for building the image (e.g. image-build-task)\n- dockerfile_path: The path to the Dockerfile to use for building the image (e.g. dockerfile)\n- context_path: The path to the context of the Dockerfile in three sections <repository-url>#<repository-commit>:<repository-folder-path> (e.g. https://github.com/Azure/avm-container-images-cicd-agents-and-runners#bc4087f:azure-devops-agent)\n- context_access_token: The access token to use for accessing the context. Supply a PAT if targetting a private repository.\n- image_names: A list of the names of the images to build (e.g. [\"image-name:tag\"])\n\n"
  type = map(object({
    task_name            = string
    dockerfile_path      = string
    context_path         = string
    context_access_token = optional(string, "a") # This `a` is a dummy value because the context_access_token should not be required in the provider
    image_names          = list(string)
  }))
  default = null
}

variable "custom_container_registry_login_server" {
  description = "The login server of the container registry to use if container_registry_creation_enabled is false."
  type        = string
  default     = null
}

variable "custom_container_registry_password" {
  description = "The password of the container registry to use if container_registry_creation_enabled is false."
  type        = string
  default     = null
}

variable "custom_container_registry_username" {
  description = "The username of the container registry to use if container_registry_creation_enabled is false."
  type        = string
  default     = null
}

variable "default_image_name" {
  description = "The default image name to use if no custom image is provided."
  type        = string
  default     = null
}

variable "default_image_registry_dockerfile_path" {
  description = "The default image registry Dockerfile path to use if no custom image is provided."
  type        = string
  default     = "dockerfile"
}

variable "default_image_repository_commit" {
  description = "The default image repository commit to use if no custom image is provided."
  type        = string
  default     = "bc4087f"
}

variable "default_image_repository_folder_paths" {
  description = "The default image repository folder path to use if no custom image is provided."
  type        = map(string)
  default     = { "azuredevops-container-app" : "azure-devops-agent-aca", "azuredevops-container-instance" : "azure-devops-agent-aci", "github-container-app" : "github-runner-aca", "github-container-instance" : "github-runner-aci" }
}

variable "default_image_repository_url" {
  description = "The default image repository URL to use if no custom image is provided."
  type        = string
  default     = "https://github.com/Azure/avm-container-images-cicd-agents-and-runners"
}

variable "delays" {
  description = "Delays (in seconds) to apply to the module operations."
  type = object({
    delay_after_container_image_build              = optional(number, 60)
    delay_after_container_app_environment_creation = optional(number, 120)
  })
  default = {}
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "location" {
  description = "Azure region where the resource should be deployed."
  type        = string
  default     = ""
}

variable "lock" {
  description = "  Controls the Resource Lock configuration for this resource. The following properties can be specified:\n\n  - kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n  - name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n"
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "log_analytics_workspace_creation_enabled" {
  description = "Whether or not to create a log analytics workspace."
  type        = bool
  default     = true
}

variable "log_analytics_workspace_id" {
  description = "The resource Id of the Log Analytics Workspace."
  type        = string
  default     = null
}

variable "log_analytics_workspace_name" {
  description = "The name of the log analytics workspace. Only required if log_analytics_workspace_creation_enabled == false."
  type        = string
  default     = null
}

variable "log_analytics_workspace_retention_in_days" {
  description = "The retention period for the Log Analytics Workspace."
  type        = number
  default     = 30
}

variable "log_analytics_workspace_sku" {
  description = "The SKU of the Log Analytics Workspace."
  type        = string
  default     = "PerGB2018"
}

variable "nat_gateway_creation_enabled" {
  description = "Whether or not to create a NAT Gateway."
  type        = bool
  default     = true
}

variable "nat_gateway_id" {
  description = "The ID of the NAT Gateway. Only required if nat_gateway_creation_enabled is false."
  type        = string
  default     = null
}

variable "nat_gateway_name" {
  description = "The name of the NAT Gateway."
  type        = string
  default     = null
}

variable "postfix" {
  description = "A postfix used to build default names if no name has been supplied for a specific resource type."
  type        = string
  default     = ""
}

variable "public_ip_creation_enabled" {
  description = "Whether or not to create a public IP."
  type        = bool
  default     = true
}

variable "public_ip_id" {
  description = "The ID of the public IP. Only required if public_ip_creation_enabled is false."
  type        = string
  default     = null
}

variable "public_ip_name" {
  description = "The name of the public IP."
  type        = string
  default     = null
}

variable "public_ip_zones" {
  description = "The availability zones for the public IP. Only required if public_ip_creation_enabled is true."
  type        = set(string)
  default     = ["1", "2", "3"]
}

variable "resource_group_creation_enabled" {
  description = "Whether or not to create a resource group."
  type        = bool
  default     = true
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed. Must be specified if resource_group_creation_enabled == false"
  type        = string
  default     = null
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}

variable "use_default_container_image" {
  description = "Whether or not to use the default container image provided by the module."
  type        = bool
  default     = true
}

variable "use_private_networking" {
  description = "Whether or not to use private networking for the container registry."
  type        = bool
  default     = true
}

variable "user_assigned_managed_identity_creation_enabled" {
  description = "Whether or not to create a user assigned managed identity."
  type        = bool
  default     = true
}

variable "user_assigned_managed_identity_id" {
  description = "The resource Id of the user assigned managed identity. Only required if user_assigned_managed_identity_creation_enabled == false."
  type        = string
  default     = null
}

variable "user_assigned_managed_identity_name" {
  description = "The name of the user assigned managed identity. Must be specified if user_assigned_managed_identity_creation_enabled == true."
  type        = string
  default     = null
}

variable "user_assigned_managed_identity_principal_id" {
  description = "The principal id of the user assigned managed identity. Only required if user_assigned_managed_identity_creation_enabled == false."
  type        = string
  default     = null
}

variable "version_control_system_agent_name_prefix" {
  description = "The version control system agent name prefix."
  type        = string
  default     = null
}

variable "version_control_system_agent_target_queue_length" {
  description = "The target value for the amound of pending jobs to scale on."
  type        = number
  default     = 1
}

variable "version_control_system_authentication_method" {
  description = "GitHub authentication method. Possible values: pat or github_app"
  type        = string
  default     = "pat"
}

variable "version_control_system_enterprise" {
  description = "The enterprise name for the version control system."
  type        = string
  default     = null
}

variable "version_control_system_github_application_id" {
  description = "The application ID for the GitHub App authentication method."
  type        = string
  default     = ""
}

variable "version_control_system_github_application_installation_id" {
  description = "The installation ID for the GitHub App authentication method."
  type        = string
  default     = ""
}

variable "version_control_system_github_application_key" {
  description = "The application key for the GitHub App authentication method."
  type        = string
  default     = null
}

variable "version_control_system_organization" {
  description = "The version control system organization to deploy the agents too."
  type        = string
  default     = ""
}

variable "version_control_system_personal_access_token" {
  description = "The personal access token for the version control system."
  type        = string
  default     = null
}

variable "version_control_system_placeholder_agent_name" {
  description = "The version control system placeholder agent name."
  type        = string
  default     = null
}

variable "version_control_system_pool_name" {
  description = "The name of the agent pool in the version control system."
  type        = string
  default     = null
}

variable "version_control_system_repository" {
  description = "The version control system repository to deploy the agents too."
  type        = string
  default     = null
}

variable "version_control_system_runner_group" {
  description = "The runner group to add the runner to."
  type        = string
  default     = null
}

variable "version_control_system_runner_scope" {
  description = "The scope of the runner. Must be ent, org, or repo. This is ignored for Azure DevOps."
  type        = string
  default     = "repo"
}

variable "version_control_system_type" {
  description = "The type of the version control system to deploy the agents too. Allowed values are 'azuredevops' or 'github'"
  type        = string
  default     = ""
}

variable "virtual_network_address_space" {
  description = "The address space for the virtual network. Must be specified if virtual_network_creation_enabled is true."
  type        = string
  default     = null
}

variable "virtual_network_creation_enabled" {
  description = "Whether or not to create a virtual network."
  type        = bool
  default     = true
}

variable "virtual_network_id" {
  description = "The ID of the virtual network. Only required if virtual_network_creation_enabled is false."
  type        = string
  default     = null
}

variable "virtual_network_name" {
  description = "The name of the virtual network. Must be specified if virtual_network_creation_enabled is true."
  type        = string
  default     = null
}
