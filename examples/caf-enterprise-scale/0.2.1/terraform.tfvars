archetype_config_overrides = {}

configure_management_resources = { "advanced" : null, "location" : null, "settings" : { "log_analytics" : { "config" : { "enable_monitoring_for_arc" : true, "enable_monitoring_for_vm" : true, "enable_monitoring_for_vmss" : true, "enable_sentinel" : true, "enable_solution_for_agent_health_assessment" : true, "enable_solution_for_anti_malware" : true, "enable_solution_for_azure_activity" : true, "enable_solution_for_change_tracking" : true, "enable_solution_for_service_map" : true, "enable_solution_for_sql_assessment" : true, "enable_solution_for_updates" : true, "enable_solution_for_vm_insights" : true, "retention_in_days" : 30 }, "enabled" : true }, "security_center" : { "config" : { "email_security_contact" : "security_contact@replace_me", "enable_defender_for_acr" : true, "enable_defender_for_app_services" : true, "enable_defender_for_arm" : true, "enable_defender_for_dns" : true, "enable_defender_for_key_vault" : true, "enable_defender_for_kubernetes" : true, "enable_defender_for_servers" : true, "enable_defender_for_sql_server_vms" : true, "enable_defender_for_sql_servers" : true, "enable_defender_for_storage" : true }, "enabled" : true } }, "tags" : null }

create_duration_delay = { "azurerm_management_group" : "30s", "azurerm_policy_assignment" : "30s", "azurerm_policy_definition" : "30s", "azurerm_policy_set_definition" : "30s", "azurerm_role_assignment" : "0s", "azurerm_role_definition" : "60s" }

custom_landing_zones = {}

custom_policy_roles = {}

default_location = "eastus"

default_tags = {}

deploy_core_landing_zones = true

deploy_demo_landing_zones = false

deploy_management_resources = false

destroy_duration_delay = { "azurerm_management_group" : "0s", "azurerm_policy_assignment" : "0s", "azurerm_policy_definition" : "0s", "azurerm_policy_set_definition" : "0s", "azurerm_role_assignment" : "0s", "azurerm_role_definition" : "0s" }

library_path = ""

root_id = "es"

root_name = "Enterprise-Scale"

root_parent_id = ""

subscription_id_connectivity = ""

subscription_id_identity = ""

subscription_id_management = ""

subscription_id_overrides = {}

template_file_variables = {}
