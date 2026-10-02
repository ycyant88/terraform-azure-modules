variable "bulk_subscribe" {
  description = "Bulk subscription options\n\n- enabled - Enable bulk subscription\n- max_await_duration_ms - Maximum duration in milliseconds to wait before a bulk message is sent to the app.\n- max_messages_count - Maximum number of messages to deliver in a bulk message.\n\n"
  type = object({
    enabled               = optional(bool)
    max_await_duration_ms = optional(number)
    max_messages_count    = optional(number)
  })
  default = null
}

variable "dead_letter_topic" {
  description = "Deadletter topic name\n"
  type        = string
  default     = null
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module. For more information see https://aka.ms/avm/telemetryinfo.\n"
  type        = bool
  default     = true
}

variable "metadata" {
  description = "Subscription metadata\n"
  type        = map(string)
  default     = null
}

variable "name" {
  description = "The name of the resource.\n"
  type        = string
  default     = ""
}

variable "parent_id" {
  description = "The parent resource ID for this resource.\n"
  type        = string
  default     = ""
}

variable "pubsub_name" {
  description = "Dapr PubSub component name\n"
  type        = string
  default     = null
}

variable "routes" {
  description = "Subscription routes\n\n- default - The default path to deliver events that do not match any of the rules.\n- rules - The list of Dapr PubSub Event Subscription Route Rules.\n\n"
  type = object({
    default = optional(string)
    rules = optional(list(object({
      match = optional(string)
      path  = optional(string)
    })))
  })
  default = null
}

variable "scopes" {
  description = "Application scopes to restrict the subscription to specific apps.\n"
  type        = list(string)
  default     = null
}

variable "topic" {
  description = "Topic name\n"
  type        = string
  default     = null
}
