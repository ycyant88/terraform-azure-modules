compute_types = ["azure_container_app"]

container_app_container_cpu = 1

container_app_container_memory = "2Gi"

container_app_environment_creation_enabled = true

container_app_environment_id = null

container_app_environment_name = null

container_app_environment_variables = []

container_app_infrastructure_resource_group_name = null

container_app_job_container_name = null

container_app_job_name = null

container_app_max_execution_count = 100

container_app_min_execution_count = 0

container_app_placeholder_container_name = null

container_app_placeholder_job_name = null

container_app_placeholder_replica_retry_limit = 0

container_app_placeholder_replica_timeout = 300

container_app_polling_interval_seconds = 30

container_app_replica_retry_limit = 3

container_app_replica_timeout = 1800

container_app_sensitive_environment_variables = []

container_app_subnet_address_prefix = null

container_app_subnet_cidr_size = 27

container_app_subnet_id = null

container_app_subnet_name = null

container_instance_container_cpu = 2

container_instance_container_cpu_limit = 2

container_instance_container_memory = 4

container_instance_container_memory_limit = 4

container_instance_container_name = null

container_instance_count = 2

container_instance_environment_variables = []

container_instance_name_prefix = null

container_instance_sensitive_environment_variables = []

container_instance_subnet_address_prefix = null

container_instance_subnet_cidr_size = 28

container_instance_subnet_id = null

container_instance_subnet_name = null

container_instance_use_availability_zones = true

container_registry_creation_enabled = true

container_registry_dns_zone_id = null

container_registry_name = null

container_registry_private_dns_zone_creation_enabled = true

container_registry_private_endpoint_subnet_address_prefix = null

container_registry_private_endpoint_subnet_id = null

container_registry_private_endpoint_subnet_name = null

container_registry_subnet_cidr_size = 29

custom_container_registry_images = null

custom_container_registry_login_server = null

custom_container_registry_password = null

custom_container_registry_username = null

default_image_name = null

default_image_registry_dockerfile_path = "dockerfile"

default_image_repository_commit = "221742d"

default_image_repository_folder_paths = { "azuredevops-container-app" : "azure-devops-agent-aca", "azuredevops-container-instance" : "azure-devops-agent-aci", "github-container-app" : "github-runner-aca", "github-container-instance" : "github-runner-aci" }

default_image_repository_url = "https://github.com/Azure/avm-container-images-cicd-agents-and-runners"

delays = {}

enable_telemetry = true

location = ""

lock = null

log_analytics_workspace_creation_enabled = true

log_analytics_workspace_id = null

log_analytics_workspace_internet_ingestion_enabled = null

log_analytics_workspace_internet_query_enabled = null

log_analytics_workspace_name = null

log_analytics_workspace_retention_in_days = 30

log_analytics_workspace_sku = "PerGB2018"

nat_gateway_creation_enabled = true

nat_gateway_id = null

nat_gateway_name = null

postfix = ""

public_ip_creation_enabled = true

public_ip_id = null

public_ip_name = null

public_ip_zones = ["1", "2", "3"]

resource_group_creation_enabled = true

resource_group_name = null

tags = null

use_default_container_image = true

use_private_networking = true

user_assigned_managed_identity_client_id = null

user_assigned_managed_identity_creation_enabled = true

user_assigned_managed_identity_id = null

user_assigned_managed_identity_name = null

user_assigned_managed_identity_principal_id = null

version_control_system_agent_name_prefix = null

version_control_system_agent_target_queue_length = 1

version_control_system_authentication_method = "pat"

version_control_system_enterprise = null

version_control_system_github_application_id = ""

version_control_system_github_application_installation_id = ""

version_control_system_github_application_key = null

version_control_system_organization = ""

version_control_system_personal_access_token = null

version_control_system_placeholder_agent_name = null

version_control_system_pool_name = null

version_control_system_repository = null

version_control_system_runner_group = null

version_control_system_runner_scope = "repo"

version_control_system_type = ""

virtual_network_address_space = null

virtual_network_creation_enabled = true

virtual_network_id = null

virtual_network_name = null
