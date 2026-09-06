arc_server_ids = ""

arc_setting_id = ""

azurerm_monitor_data_collection_rule_association_name = ""

cmk_for_query_forced = false

counter_specifiers = ["\\Memory\\Available Bytes", "\\Network Interface(*)\\Bytes Total/sec", "\\Processor(_Total)\\% Processor Time", "\\RDMA Activity(*)\\RDMA Inbound Bytes/sec", "\\RDMA Activity(*)\\RDMA Outbound Bytes/sec"]

create_data_collection_resources = false

data_collection_endpoint_name = null

data_collection_endpoint_tags = {}

data_collection_resources_location = ""

data_collection_rule_destination_id = "2-90d1-e814dab6067e"

data_collection_rule_name = null

data_collection_rule_resource_id = null

data_collection_rule_tags = {}

enable_telemetry = true

immediate_data_purge_on_30_days_enabled = false

lock = null

name = "AzureMonitorWindowsAgent"

resource_group_name = ""

retention_in_days = 30

role_assignments = {}

sku = "PerGB2018"

workspace_name = null

workspace_tags = {}

x_path_queries = ["Microsoft-Windows-SDDC-Management/Operational!*[System[(EventID=3000 or EventID=3001 or EventID=3002 or EventID=3003 or EventID=3004)]]", "microsoft-windows-health/operational!*"]
