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

variable "runtime_version" {
  description = "The runtime version of the authentication module."
  type        = string
  default     = null
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
