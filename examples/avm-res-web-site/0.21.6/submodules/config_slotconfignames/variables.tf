variable "app_setting_names" {
  description = "A list of app setting names that should be sticky (not swapped during slot swaps)."
  type        = list(string)
  default     = []
}

variable "connection_string_names" {
  description = "A list of connection string names that should be sticky (not swapped during slot swaps)."
  type        = list(string)
  default     = []
}

variable "parent_id" {
  description = "The resource ID of the App Service site."
  type        = string
  default     = ""
}
