enable_telemetry = true

location = ""

log_analytics_workspace_name = ""

managed_identities = {}

private_endpoints = {}

public_network_access_enabled = true

registration_expiration_period = "48h"

resource_group_name = ""

role_assignments = {}

schedules = { "schedule1" : { "days_of_week" : ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"], "name" : "Weekdays", "off_peak_load_balancing_algorithm" : "DepthFirst", "off_peak_start_time" : "22:00", "peak_load_balancing_algorithm" : "BreadthFirst", "peak_start_time" : "09:00", "ramp_down_capacity_threshold_percent" : 5, "ramp_down_force_logoff_users" : false, "ramp_down_load_balancing_algorithm" : "DepthFirst", "ramp_down_minimum_hosts_percent" : 10, "ramp_down_notification_message" : "Please log off in the next 45 minutes...", "ramp_down_start_time" : "19:00", "ramp_down_stop_hosts_when" : "ZeroSessions", "ramp_down_wait_time_minutes" : 45, "ramp_up_capacity_threshold_percent" : 10, "ramp_up_load_balancing_algorithm" : "BreadthFirst", "ramp_up_minimum_hosts_percent" : 20, "ramp_up_start_time" : "05:00" } }

subresource_names = []

time_zone = "Eastern Standard Time"

tracing_tags_enabled = false

tracing_tags_prefix = "avm_"

virtual_desktop_application_group_default_desktop_display_name = null

virtual_desktop_application_group_description = null

virtual_desktop_application_group_friendly_name = null

virtual_desktop_application_group_name = ""

virtual_desktop_application_group_tags = null

virtual_desktop_application_group_timeouts = null

virtual_desktop_application_group_type = ""

virtual_desktop_host_pool_custom_rdp_properties = "drivestoredirect:s:*;audiomode:i:0;videoplaybackmode:i:1;redirectclipboard:i:1;redirectprinters:i:1;devicestoredirect:s:*;redirectcomports:i:1;redirectsmartcards:i:1;usbdevicestoredirect:s:*;enablecredsspsupport:i:1;use multimon:i:0"

virtual_desktop_host_pool_description = null

virtual_desktop_host_pool_friendly_name = null

virtual_desktop_host_pool_load_balancer_type = ""

virtual_desktop_host_pool_maximum_sessions_allowed = null

virtual_desktop_host_pool_name = ""

virtual_desktop_host_pool_personal_desktop_assignment_type = null

virtual_desktop_host_pool_preferred_app_group_type = null

virtual_desktop_host_pool_scheduled_agent_updates = null

virtual_desktop_host_pool_start_vm_on_connect = null

virtual_desktop_host_pool_tags = null

virtual_desktop_host_pool_timeouts = null

virtual_desktop_host_pool_type = ""

virtual_desktop_host_pool_validate_environment = null

virtual_desktop_scaling_plan_description = null

virtual_desktop_scaling_plan_exclusion_tag = null

virtual_desktop_scaling_plan_friendly_name = null

virtual_desktop_scaling_plan_host_pool = null

virtual_desktop_scaling_plan_name = ""

virtual_desktop_scaling_plan_tags = null

virtual_desktop_scaling_plan_time_zone = ""

virtual_desktop_scaling_plan_timeouts = null

virtual_desktop_workspace_description = null

virtual_desktop_workspace_friendly_name = null

virtual_desktop_workspace_name = ""

virtual_desktop_workspace_public_network_access_enabled = null

virtual_desktop_workspace_tags = null

virtual_desktop_workspace_timeouts = null
