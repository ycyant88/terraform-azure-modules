account_replication_type = "ZRS"

adou_path = ""

allow_nested_items_to_be_public = false

azure_service_endpoint = "core.windows.net"

azure_stack_lcm_user_credential_content_type = null

azure_stack_lcm_user_credential_tags = null

bitlocker_boot_volume = true

bitlocker_data_volumes = true

cluster_name = ""

cluster_tags = null

compute_intent_name = "ManagementCompute"

compute_override_adapter_property = true

compute_qos_policy_overrides = { "bandwidthPercentage_SMB" : "", "priorityValue8021Action_Cluster" : "", "priorityValue8021Action_SMB" : "" }

compute_rdma_enabled = false

compute_traffic_type = ["Management", "Compute"]

configuration_mode = "Express"

create_key_vault = true

create_witness_storage_account = true

credential_guard_enforced = false

cross_tenant_replication_enabled = false

custom_location_name = ""

default_arb_application_content_type = null

default_arb_application_tags = null

default_gateway = ""

deployment_user = ""

deployment_user_password = ""

dns_servers = ""

domain_fqdn = ""

drift_control_enforced = true

drtm_protection = true

enable_telemetry = true

ending_address = ""

eu_location = false

hvci_protection = true

intent_name = "ManagementComputeStorage"

is_exported = false

key_vault_location = ""

key_vault_resource_group = ""

keyvault_name = ""

keyvault_purge_protection_enabled = true

keyvault_secrets = [{ "eceSecretName" : "AzureStackLCMUserCredential", "secretSuffix" : "AzureStackLCMUserCredential" }, { "eceSecretName" : "LocalAdminCredential", "secretSuffix" : "LocalAdminCredential" }, { "eceSecretName" : "DefaultARBApplication", "secretSuffix" : "DefaultARBApplication" }, { "eceSecretName" : "WitnessStorageKey", "secretSuffix" : "WitnessStorageKey" }]

keyvault_soft_delete_retention_days = 30

keyvault_tags = null

local_admin_credential_content_type = null

local_admin_credential_tags = null

local_admin_password = ""

local_admin_user = ""

location = ""

lock = null

management_adapters = ""

min_tls_version = "TLS1_2"

name = ""

naming_prefix = ""

operation_type = "ClusterProvisioning"

override_adapter_property = true

qos_policy_overrides = { "bandwidthPercentage_SMB" : "", "priorityValue8021Action_Cluster" : "", "priorityValue8021Action_SMB" : "" }

random_suffix = true

rdma_enabled = false

rdma_jumbo_packet = "9014"

rdma_protocol = "RoCEv2"

resource_group_name = ""

role_assignments = {}

rp_service_principal_object_id = ""

secrets_location = ""

servers = ""

service_principal_id = ""

service_principal_secret = ""

side_channel_mitigation_enforced = true

site_id = ""

smb_cluster_encryption = false

smb_signing_enforced = true

starting_address = ""

storage_adapter_ip_info = null

storage_connectivity_switchless = ""

storage_intent_name = "Storage"

storage_networks = ""

storage_override_adapter_property = true

storage_qos_policy_overrides = { "bandwidthPercentage_SMB" : "", "priorityValue8021Action_Cluster" : "", "priorityValue8021Action_SMB" : "" }

storage_rdma_enabled = false

storage_tags = null

storage_traffic_type = ["Storage"]

subnet_mask = "255.255.255.0"

traffic_type = ["Management", "Compute", "Storage"]

use_legacy_key_vault_model = false

wdac_enforced = true

witness_path = "Cloud"

witness_storage_account_name = ""

witness_storage_account_resource_group_name = ""

witness_storage_key_content_type = null

witness_storage_key_tags = null

witness_type = "Cloud"
