variable "aks_cluster_id" {
  description = "The resource ID of the AKS cluster"
  type        = string
  default     = ""
}

variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
  default     = ""
}

variable "log_analytics_workspace_id" {
  description = "The resource ID of the Log Analytics workspace"
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "The resource ID of the parent resource group"
  type        = string
  default     = ""
}

variable "prometheus_workspace_id" {
  description = "The resource ID of the Azure Monitor workspace for managed Prometheus"
  type        = string
  default     = ""
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}
