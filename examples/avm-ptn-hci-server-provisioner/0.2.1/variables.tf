variable "authentication_method" {
  description = "The authentication method for Enter-PSSession."
  type        = string
  default     = "Default"
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "expand_c" {
  description = "Expand C volume as much as possible"
  type        = bool
  default     = false
}

variable "local_admin_password" {
  description = "The password for the local administrator account."
  type        = string
  default     = ""
}

variable "local_admin_user" {
  description = "The username for the local administrator account."
  type        = string
  default     = ""
}

variable "location" {
  description = "Azure region where the resource should be deployed."
  type        = string
  default     = ""
}

variable "name" {
  description = "The name of the server."
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "server_ip" {
  description = "The IP address of the server."
  type        = string
  default     = ""
}

variable "service_principal_id" {
  description = "The service principal ID for the Azure account."
  type        = string
  default     = ""
}

variable "service_principal_secret" {
  description = "The service principal secret for the Azure account."
  type        = string
  default     = ""
}

variable "subscription_id" {
  description = "The subscription ID for the Azure account."
  type        = string
  default     = ""
}

variable "tenant" {
  description = "The tenant ID for the Azure account."
  type        = string
  default     = ""
}

variable "winrm_port" {
  description = "WinRM port"
  type        = number
  default     = 5985
}
