archetype_config_overrides = {}

configure_connectivity_resources = { "advanced" : null, "location" : null, "settings" : { "ddos_protection_plan" : { "config" : { "location" : "" }, "enabled" : false }, "dns" : { "config" : { "enable_private_dns_zone_virtual_network_link_on_hubs" : true, "enable_private_dns_zone_virtual_network_link_on_spokes" : true, "enable_private_link_by_service" : { "azure_app_configuration_stores" : true, "azure_automation_dscandhybridworker" : true, "azure_automation_webhook" : true, "azure_backup" : true, "azure_cache_for_redis" : true, "azure_container_registry" : true, "azure_cosmos_db_cassandra" : true, "azure_cosmos_db_gremlin" : true, "azure_cosmos_db_mongodb" : true, "azure_cosmos_db_sql" : true, "azure_cosmos_db_table" : true, "azure_data_factory" : true, "azure_data_factory_portal" : true, "azure_data_lake_file_system_gen2" : true, "azure_database_for_mariadb_server" : true, "azure_database_for_mysql_server" : true, "azure_database_for_postgresql_server" : true, "azure_event_grid_domain" : true, "azure_event_grid_topic" : true, "azure_event_hubs_namespace" : true, "azure_file_sync" : true, "azure_iot_hub" : true, "azure_key_vault" : true, "azure_kubernetes_service_management" : true, "azure_machine_learning_workspace" : true, "azure_monitor" : true, "azure_relay_namespace" : true, "azure_search_service" : true, "azure_service_bus_namespace" : true, "azure_site_recovery" : true, "azure_sql_database_sqlserver" : true, "azure_synapse_analytics_sql" : true, "azure_synapse_analytics_sqlserver" : true, "azure_web_apps_sites" : true, "cognitive_services_account" : true, "signalr" : true, "storage_account_blob" : true, "storage_account_file" : true, "storage_account_queue" : true, "storage_account_table" : true, "storage_account_web" : true }, "location" : "", "private_dns_zones" : [], "private_link_locations" : [], "public_dns_zones" : [] }, "enabled" : true }, "hub_networks" : [{ "config" : { "address_space" : ["10.100.0.0/16"], "azure_firewall" : { "config" : { "address_prefix" : "10.100.0.0/24", "availability_zones" : { "zone_1" : true, "zone_2" : true, "zone_3" : true }, "base_policy_id" : "", "dns_servers" : [], "enable_dns_proxy" : true, "private_ip_ranges" : [], "sku_tier" : "", "threat_intelligence_allowlist" : [], "threat_intelligence_mode" : "" }, "enabled" : false }, "bgp_community" : "", "dns_servers" : [], "enable_hub_network_mesh_peering" : false, "enable_outbound_virtual_network_peering" : false, "link_to_ddos_protection_plan" : false, "location" : "", "spoke_virtual_network_resource_ids" : [], "subnets" : [], "virtual_network_gateway" : { "config" : { "address_prefix" : "10.100.1.0/24", "advanced_vpn_settings" : { "active_active" : null, "bgp_settings" : [], "custom_route" : [], "default_local_network_gateway_id" : "", "enable_bgp" : null, "private_ip_address_allocation" : "", "vpn_client_configuration" : [] }, "gateway_sku_expressroute" : "ErGw2AZ", "gateway_sku_vpn" : "VpnGw3" }, "enabled" : false } }, "enabled" : true }], "vwan_hub_networks" : [{ "config" : { "address_prefix" : "10.200.0.0/22", "azure_firewall" : { "config" : { "availability_zones" : { "zone_1" : true, "zone_2" : true, "zone_3" : true }, "base_policy_id" : "", "dns_servers" : [], "enable_dns_proxy" : false, "private_ip_ranges" : [], "sku_tier" : "Standard", "threat_intelligence_allowlist" : [], "threat_intelligence_mode" : "" }, "enabled" : false }, "enable_virtual_hub_connections" : false, "expressroute_gateway" : { "config" : { "scale_unit" : 1 }, "enabled" : false }, "location" : "", "routes" : [], "sku" : "", "spoke_virtual_network_resource_ids" : [], "vpn_gateway" : { "config" : { "bgp_settings" : [], "routing_preference" : "", "scale_unit" : 1 }, "enabled" : false } }, "enabled" : false }] }, "tags" : null }

configure_identity_resources = { "settings" : { "identity" : { "config" : { "enable_deny_public_ip" : true, "enable_deny_rdp_from_internet" : true, "enable_deny_subnet_without_nsg" : true, "enable_deploy_azure_backup_on_vms" : true }, "enabled" : true } } }

configure_management_resources = { "advanced" : null, "location" : null, "settings" : { "log_analytics" : { "config" : { "enable_monitoring_for_arc" : true, "enable_monitoring_for_vm" : true, "enable_monitoring_for_vmss" : true, "enable_sentinel" : true, "enable_solution_for_agent_health_assessment" : true, "enable_solution_for_anti_malware" : true, "enable_solution_for_azure_activity" : true, "enable_solution_for_change_tracking" : true, "enable_solution_for_service_map" : true, "enable_solution_for_sql_advanced_threat_detection" : true, "enable_solution_for_sql_assessment" : true, "enable_solution_for_sql_vulnerability_assessment" : true, "enable_solution_for_updates" : true, "enable_solution_for_vm_insights" : true, "retention_in_days" : 30 }, "enabled" : true }, "security_center" : { "config" : { "email_security_contact" : "security_contact@replace_me", "enable_defender_for_app_services" : true, "enable_defender_for_arm" : true, "enable_defender_for_containers" : true, "enable_defender_for_dns" : true, "enable_defender_for_key_vault" : true, "enable_defender_for_oss_databases" : true, "enable_defender_for_servers" : true, "enable_defender_for_sql_server_vms" : true, "enable_defender_for_sql_servers" : true, "enable_defender_for_storage" : true }, "enabled" : true } }, "tags" : null }

create_duration_delay = { "azurerm_management_group" : "30s", "azurerm_policy_assignment" : "30s", "azurerm_policy_definition" : "30s", "azurerm_policy_set_definition" : "30s", "azurerm_role_assignment" : "0s", "azurerm_role_definition" : "60s" }

custom_landing_zones = {}

custom_policy_roles = {}

default_location = "eastus"

default_tags = {}

deploy_connectivity_resources = false

deploy_core_landing_zones = true

deploy_corp_landing_zones = false

deploy_demo_landing_zones = false

deploy_identity_resources = false

deploy_management_resources = false

deploy_online_landing_zones = false

deploy_sap_landing_zones = false

destroy_duration_delay = { "azurerm_management_group" : "0s", "azurerm_policy_assignment" : "0s", "azurerm_policy_definition" : "0s", "azurerm_policy_set_definition" : "0s", "azurerm_role_assignment" : "0s", "azurerm_role_definition" : "0s" }

disable_base_module_tags = false

disable_telemetry = false

library_path = ""

root_id = "es"

root_name = "Enterprise-Scale"

root_parent_id = ""

strict_subscription_association = true

subscription_id_connectivity = ""

subscription_id_identity = ""

subscription_id_management = ""

subscription_id_overrides = {}

template_file_variables = {}
