variable "active_directory" {
  description = "Active Directory authentication configuration.\n\n- client_id - (Optional) The Client ID of the Azure AD application.\n- allowed_audiences - (Optional) A list of allowed audience values.\n- client_secret - (Optional) The Client Secret of the Azure AD application.\n- client_secret_setting_name - (Optional) The app setting name that contains the client secret.\n"
  type = object({
    client_id                  = optional(string)
    allowed_audiences          = optional(list(string))
    client_secret              = optional(string)
    client_secret_setting_name = optional(string)
  })
  default = null
}

variable "additional_login_parameters" {
  description = "A map of additional login parameters."
  type        = map(string)
  default     = null
}

variable "allowed_external_redirect_urls" {
  description = "A list of allowed external redirect URLs."
  type        = list(string)
  default     = null
}

variable "default_provider" {
  description = "The default authentication provider."
  type        = string
  default     = null
}

variable "enabled" {
  description = "Is authentication enabled? Defaults to false."
  type        = bool
  default     = false
}

variable "facebook" {
  description = "Facebook authentication configuration.\n\n- app_id - (Optional) The App ID of the Facebook application.\n- app_secret - (Optional) The App Secret of the Facebook application.\n- app_secret_setting_name - (Optional) The app setting name that contains the app secret.\n- oauth_scopes - (Optional) A list of OAuth scopes to request.\n"
  type = object({
    app_id                  = optional(string)
    app_secret              = optional(string)
    app_secret_setting_name = optional(string)
    oauth_scopes            = optional(list(string))
  })
  default = null
}

variable "github" {
  description = "GitHub authentication configuration.\n\n- client_id - (Optional) The Client ID of the GitHub application.\n- client_secret - (Optional) The Client Secret of the GitHub application.\n- client_secret_setting_name - (Optional) The app setting name that contains the client secret.\n- oauth_scopes - (Optional) A list of OAuth scopes to request.\n"
  type = object({
    client_id                  = optional(string)
    client_secret              = optional(string)
    client_secret_setting_name = optional(string)
    oauth_scopes               = optional(list(string))
  })
  default = null
}

variable "google" {
  description = "Google authentication configuration.\n\n- client_id - (Optional) The Client ID of the Google application.\n- client_secret - (Optional) The Client Secret of the Google application.\n- client_secret_setting_name - (Optional) The app setting name that contains the client secret.\n- oauth_scopes - (Optional) A list of OAuth scopes to request.\n"
  type = object({
    client_id                  = optional(string)
    client_secret              = optional(string)
    client_secret_setting_name = optional(string)
    oauth_scopes               = optional(list(string))
  })
  default = null
}

variable "ignore_body_changes" {
  description = "Body-relative paths whose changes are ignored, keyed by AzAPI resource type. Paths use dot notation, and a change takes effect only after an apply.\n\nThe AzAPI provider exposes ignore_body_changes on azapi_resource only, and this module manages its resource with a type that does not accept the argument. The variable exists for interface consistency; setting a non-empty value fails the plan with an explicit error rather than being silently ignored.\n- web_sites_config - Paths ignored on the v1 auth settings.\n"
  type = object({
    web_sites_config = optional(list(string), [])
  })
  default = {}
}

variable "issuer" {
  description = "The issuer URI."
  type        = string
  default     = null
}

variable "microsoft" {
  description = "Microsoft authentication configuration.\n\n- client_id - (Optional) The Client ID of the Microsoft application.\n- client_secret - (Optional) The Client Secret of the Microsoft application.\n- client_secret_setting_name - (Optional) The app setting name that contains the client secret.\n- oauth_scopes - (Optional) A list of OAuth scopes to request.\n"
  type = object({
    client_id                  = optional(string)
    client_secret              = optional(string)
    client_secret_setting_name = optional(string)
    oauth_scopes               = optional(list(string))
  })
  default = null
}

variable "parent_id" {
  description = "The resource ID of the App Service site."
  type        = string
  default     = ""
}

variable "resource_types" {
  description = "AzAPI resource types and API versions used by this module.\n\n- web_sites_config - Resource type and API version for the v1 auth settings.\n"
  type = object({
    web_sites_config = optional(string, "Microsoft.Web/sites/config@2025-03-01")
  })
  default = {}
}

variable "retry" {
  description = "Retry configuration for the AzAPI resources declared by this module. Defaults to retrying the conflict Azure returns while another operation on the site is in progress.\n\n- error_message_regex - (Optional) A list of regular expressions matched against error messages. A match triggers a retry.\n- interval_seconds - (Optional) The initial interval in seconds between retries.\n- max_interval_seconds - (Optional) The maximum interval in seconds between retries.\n"
  type = object({
    error_message_regex  = optional(list(string), ["Cannot modify this site because another operation is in progress"])
    interval_seconds     = optional(number, 10)
    max_interval_seconds = optional(number)
  })
  default = {}
}

variable "runtime_version" {
  description = "The runtime version of the authentication module."
  type        = string
  default     = null
}

variable "timeouts" {
  description = "Per-operation timeouts applied to the AzAPI resources declared by this module. Defaults to null, which uses the provider defaults. Each value is a Go duration string such as 30m.\n\n- create - (Optional) Timeout for create operations.\n- delete - (Optional) Timeout for delete operations.\n- read - (Optional) Timeout for read operations.\n- update - (Optional) Timeout for update operations.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}

variable "token_refresh_extension_hours" {
  description = "Hours before token expiry to refresh. Defaults to 72."
  type        = number
  default     = 72
}

variable "token_store_enabled" {
  description = "Should the token store be enabled? Defaults to false."
  type        = bool
  default     = false
}

variable "twitter" {
  description = "Twitter authentication configuration.\n\n- consumer_key - (Optional) The consumer key of the Twitter application.\n- consumer_secret - (Optional) The consumer secret of the Twitter application.\n- consumer_secret_setting_name - (Optional) The app setting name that contains the consumer secret.\n"
  type = object({
    consumer_key                 = optional(string)
    consumer_secret              = optional(string)
    consumer_secret_setting_name = optional(string)
  })
  default = null
}

variable "unauthenticated_client_action" {
  description = "The action to take for unauthenticated requests."
  type        = string
  default     = null
}
