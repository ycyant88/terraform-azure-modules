variable "cluster_name" {
  description = "(Required) The name of the cluster in which to create the resource. Changing this forces a new resource to be created."
  type        = string
  default     = ""
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
  description = "(Required) The cluster role assigned to the principal. Valid values include AllDatabasesAdmin and AllDatabasesViewer. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "tenant_id" {
  description = "(Required) The tenant id in which the principal resides. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}
