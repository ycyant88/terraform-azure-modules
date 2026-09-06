variable "is_slot" {
  description = "Whether the parent resource is a deployment slot. Defaults to false."
  type        = bool
  default     = false
}

variable "parent_id" {
  description = "The resource ID of the App Service site or slot."
  type        = string
  default     = ""
}

variable "zip_deploy_file" {
  description = "The URL of the zip file to deploy to the App Service."
  type        = string
  default     = ""
}
