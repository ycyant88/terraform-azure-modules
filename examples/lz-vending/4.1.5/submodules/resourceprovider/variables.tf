variable "features" {
  description = "The resource provider features to register, e.g. [MyFeature]\n"
  type        = set(string)
  default     = []
}

variable "resource_provider" {
  description = "The resource provider namespace, e.g. Microsoft.Compute.\n"
  type        = string
  default     = ""
}

variable "subscription_id" {
  description = "The subscription id to register the resource providers in.\n"
  type        = string
  default     = ""
}
