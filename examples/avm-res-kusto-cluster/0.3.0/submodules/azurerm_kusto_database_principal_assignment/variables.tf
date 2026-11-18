variable "cluster_name" {
  description = "(Required) The name of the cluster in which to create the resource. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "database_name" {
  description = "(Required) The name of the database in which to create the resource. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "location" {
  description = "The Azure region for this module's resources or telemetry deployment."
  type        = string
  default     = null
}

variable "name" {
  description = "(Required) The name of the Kusto cluster principal assignment. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "principal_id" {
  description = "(Required) The object id of the principal. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "principal_type" {
  description = "(Required) The type of the principal. Valid values include App, Group, User. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the resource. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "role" {
  description = "(Required) The database role assigned to the principal. Valid values include Admin, Ingestor, Monitor, UnrestrictedViewer, User and Viewer. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "tenant_id" {
  description = "(Required) The tenant id in which the principal resides. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}
