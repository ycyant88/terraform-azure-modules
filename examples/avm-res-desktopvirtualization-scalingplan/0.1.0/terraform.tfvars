diagnostic_settings = {}

enable_telemetry = true

hostpool = ""

location = ""

lock = {}

resource_group_name = ""

role_assignments = {}

scalingplan = ""

schedules = { "schedule1" : { "days_of_week" : ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"], "name" : "Weekdays", "off_peak_load_balancing_algorithm" : "DepthFirst", "off_peak_start_time" : "22:00", "peak_load_balancing_algorithm" : "BreadthFirst", "peak_start_time" : "09:00", "ramp_down_capacity_threshold_percent" : 5, "ramp_down_force_logoff_users" : false, "ramp_down_load_balancing_algorithm" : "DepthFirst", "ramp_down_minimum_hosts_percent" : 10, "ramp_down_notification_message" : "Please log off in the next 45 minutes...", "ramp_down_start_time" : "19:00", "ramp_down_stop_hosts_when" : "ZeroSessions", "ramp_down_wait_time_minutes" : 45, "ramp_up_capacity_threshold_percent" : 10, "ramp_up_load_balancing_algorithm" : "BreadthFirst", "ramp_up_minimum_hosts_percent" : 20, "ramp_up_start_time" : "05:00" } }

tags = null

time_zone = "Eastern Standard Time"

tracing_tags_enabled = false

tracing_tags_prefix = "avm_"
