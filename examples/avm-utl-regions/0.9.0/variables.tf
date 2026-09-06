variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
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

variable "has_availability_zones" {
  description = "null means no filter is applied, true means only regions with availability zones are returned, and false means only regions without availability zones are returned.\n"
  type        = bool
  default     = null
}

variable "has_pair" {
  description = "null means no filter is applied, true means only regions with a paired region are returned, and false means only regions without a paired region are returned.\n"
  type        = bool
  default     = null
}

variable "is_recommended" {
  description = "null means no filter is applied, true means only regions that are recommended are returned, and false means only regions that are not recommended are returned.\n\nNOTE: Set the legacy recommended_filter variable to false to ensure this works as expected.\n"
  type        = bool
  default     = null
}

variable "region_filter" {
  description = "A set of region names (or display names) to filter the output by. If null, no filter is applied.\n"
  type        = set(string)
  default     = null
}

variable "use_cached_data" {
  description = "If true, the module will use cached data from the data directory. If false, the module will use live data from the Azure API.\n\nThe default is true to avoid unnecessary API calls and provide a guaranteed consistent output.\nSet to false to ensure the latest data is used.\n\nUsing data from the Azure APIs means that if the API response changes, then the module output will change.\nThis may affect deployed resources that rely on this data.\n"
  type        = bool
  default     = true
}
