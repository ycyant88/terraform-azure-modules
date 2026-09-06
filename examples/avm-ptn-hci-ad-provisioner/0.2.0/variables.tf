variable "adou_path" {
  description = "The Active Directory OU path."
  type        = string
  default     = ""
}

variable "authentication_method" {
  description = "The authentication method for Enter-PSSession."
  type        = string
  default     = "Default"
}

variable "dc_ip" {
  description = "The ip of the server."
  type        = string
  default     = ""
}

variable "dc_port" {
  description = "Domain controller winrm port in virtual host"
  type        = number
  default     = 5985
}

variable "deployment_user" {
  description = "The username for deployment user."
  type        = string
  default     = ""
}

variable "deployment_user_password" {
  description = "The password for deployment user."
  type        = string
  default     = ""
}

variable "destory_adou" {
  description = "whether destroy previous adou"
  type        = bool
  default     = false
}

variable "domain_admin_password" {
  description = "The password for the domain administrator account."
  type        = string
  default     = ""
}

variable "domain_admin_user" {
  description = "The username for the domain administrator account."
  type        = string
  default     = ""
}

variable "domain_fqdn" {
  description = "The domain FQDN."
  type        = string
  default     = ""
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
}
