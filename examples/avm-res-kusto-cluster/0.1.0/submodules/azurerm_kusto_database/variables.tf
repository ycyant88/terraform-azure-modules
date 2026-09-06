variable "cluster_name" {
  description = "(Required) Specifies the name of the Kusto Cluster this database will be added to. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "hot_cache_period" {
  description = "(Optional) The time the data that should be kept in cache for fast queries as ISO 8601 timespan. Default is unlimited. For more information see: ISO 8601 Timespan."
  type        = string
  default     = null
}

variable "location" {
  description = "(Required) The location where the Kusto Database should be created. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "name" {
  description = "(Required) The name of the Kusto Database to create. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "(Required) Specifies the Resource Group where the Kusto Database should exist. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "soft_delete_period" {
  description = "(Optional) The time the data should be kept before it stops being accessible to queries as ISO 8601 timespan. Default is unlimited. For more information see: ISO 8601 Timespan."
  type        = string
  default     = null
}
