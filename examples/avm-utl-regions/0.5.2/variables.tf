variable "availability_zones_filter" {
  description = "If true, the module will only return regions that have availability zones.\n"
  type        = bool
  default     = false
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see https://aka.ms/avm/telemetryinfo.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "geography_filter" {
  description = "If set, the module will only return regions that match the specified geography.\n"
  type        = string
  default     = null
}

variable "geography_group_filter" {
  description = "If set, the module will only return regions that match the specified geography group.\n"
  type        = string
  default     = null
}

variable "recommended_filter" {
  description = "If true, the module will only return regions that are have the category set to Recommended by the locations API.\nThis is default true as several regions are not available for general deployment and must be explicitly made available via support ticket.\nEnabling these regions by default may lead to deployment failures.\n"
  type        = bool
  default     = true
}

variable "use_cached_data" {
  description = "If true, the module will use cached data from the data directory. If false, the module will use live data from the Azure API.\n\nThe default is true to avoid unnecessary API calls and provide a guaranteed consistent output.\nSet to false to ensure the latest data is used.\n\nUsing data from the Azure APIs means that if the API response changes, then the module output will change.\nThis may affect deployed resources that rely on this data.\n"
  type        = bool
  default     = true
}
