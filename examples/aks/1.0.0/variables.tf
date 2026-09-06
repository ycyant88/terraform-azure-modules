variable "CLIENT_ID" {
  description = "The Client ID (appId) for the Service Principal used for the AKS deployment"
  type        = string
  default     = ""
}

variable "CLIENT_SECRET" {
  description = "The Client Secret (password) for the Service Principal used for the AKS deployment"
  type        = string
  default     = ""
}

variable "admin_username" {
  description = "The username of the local administrator to be created on the Kubernetes cluster"
  type        = string
  default     = "azureuser"
}

variable "agents_count" {
  description = "The number of Agents that should exist in the Agent Pool"
  type        = string
  default     = 2
}

variable "agents_size" {
  description = "The default virtual machine size for the Kubernetes agents"
  type        = string
  default     = "Standard_F2"
}

variable "kubernetes_version" {
  description = "Version of Kubernetes to install"
  type        = string
  default     = "1.11.3"
}

variable "location" {
  description = "The location for the AKS deployment"
  type        = string
  default     = "eastus"
}

variable "log_analytics_workspace_sku" {
  description = "The SKU (pricing level) of the Log Analytics workspace. For new subscriptions the SKU should be set to PerGB2018"
  type        = string
  default     = "PerGB2018"
}

variable "log_retention_in_days" {
  description = "The retention period for the logs in days"
  type        = string
  default     = 30
}

variable "prefix" {
  description = "The prefix for the resources created in the specified Azure Resource Group"
  type        = string
  default     = "cluster"
}

variable "public_ssh_key" {
  description = "A custom ssh key to control access to the AKS cluster"
  type        = string
  default     = ""
}
