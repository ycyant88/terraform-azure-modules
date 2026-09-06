variable "aks_cluster_id" {
  description = "The resource ID of the AKS cluster"
  type        = string
  default     = ""
}

variable "alert_email" {
  description = "Email address for alert notifications"
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "The parent resource group ID"
  type        = string
  default     = ""
}
