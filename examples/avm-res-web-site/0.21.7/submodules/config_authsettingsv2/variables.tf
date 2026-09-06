variable "auth_enabled" {
  description = "Is authentication enabled? Defaults to false."
  type        = bool
  default     = false
}

variable "config_file_path" {
  description = "The path to the auth configuration file."
  type        = string
  default     = null
}

variable "excluded_paths" {
  description = "A list of paths excluded from authentication."
  type        = list(string)
  default     = null
}

variable "forward_proxy_convention" {
  description = "The convention for forwarding proxy headers. Defaults to NoProxy."
  type        = string
  default     = "NoProxy"
}

variable "forward_proxy_custom_host_header_name" {
  description = "The custom host header name for the forward proxy."
  type        = string
  default     = null
}

variable "forward_proxy_custom_proto_header_name" {
  description = "The custom proto header name for the forward proxy."
  type        = string
  default     = null
}

variable "http_route_api_prefix" {
  description = "The prefix for the HTTP route API. Defaults to /.auth."
  type        = string
  default     = "/.auth"
}

variable "identity_providers" {
  description = "The identity providers configuration for authentication. This mirrors the API structure of identityProviders.\n\n- apple - (Optional) The Apple provider configuration.\n  - enabled - (Optional) Whether the Apple provider is enabled.\n  - login - (Optional) The login configuration.\n    - scopes - (Optional) A list of scopes.\n  - registration - (Optional) The registration configuration.\n    - client_id - (Optional) The Client ID.\n    - client_secret_setting_name - (Optional) The app setting name containing the client secret.\n- azure_active_directory - (Optional) The Azure Active Directory provider configuration.\n  - enabled - (Optional) Whether the Azure AD provider is enabled.\n  - is_auto_provisioned - (Optional) Whether the Azure AD configuration was auto-provisioned.\n  - login - (Optional) The login configuration.\n    - disable_www_authenticate - (Optional) Whether to disable WWW-Authenticate.\n    - login_parameters - (Optional) Login parameters as a list of \"key=value\" strings.\n  - registration - (Optional) The registration configuration.\n    - client_id - (Optional) The Client ID.\n    - client_secret_certificate_issuer - (Optional) The certificate issuer for the client secret.\n    - client_secret_certificate_subject_alternative_name - (Optional) The certificate subject alternative name.\n    - client_secret_certificate_thumbprint - (Optional) The certificate thumbprint for the client secret.\n    - client_secret_setting_name - (Optional) The app setting name containing the client secret.\n    - open_id_issuer - (Optional) The OpenID Connect issuer URI.\n  - validation - (Optional) The validation configuration.\n    - allowed_audiences - (Optional) A list of allowed audiences.\n    - default_authorization_policy - (Optional) The default authorization policy.\n      - allowed_applications - (Optional) A list of allowed applications.\n      - allowed_principals - (Optional) The allowed principals.\n        - groups - (Optional) A list of allowed groups.\n        - identities - (Optional) A list of allowed identities.\n    - jwt_claim_checks - (Optional) JWT claim check configuration.\n      - allowed_client_applications - (Optional) A list of allowed client applications.\n      - allowed_groups - (Optional) A list of allowed groups.\n- azure_static_web_apps - (Optional) The Azure Static Web Apps provider configuration.\n  - enabled - (Optional) Whether the provider is enabled.\n  - registration - (Optional) The registration configuration.\n    - client_id - (Optional) The Client ID.\n- custom_open_id_connect_providers - (Optional) A map of custom OpenID Connect providers.\n  - enabled - (Optional) Whether the provider is enabled.\n  - login - (Optional) The login configuration.\n    - name_claim_type - (Optional) The name claim type.\n    - scopes - (Optional) A list of scopes.\n  - registration - (Optional) The registration configuration.\n    - client_id - (Optional) The Client ID.\n    - client_credential - (Optional) The client credential configuration.\n      - method - (Optional) The client credential method.\n      - client_secret_setting_name - (Optional) The app setting name containing the client secret.\n    - open_id_connect_configuration - (Optional) The OpenID Connect configuration.\n      - authorization_endpoint - (Optional) The authorization endpoint.\n      - certification_uri - (Optional) The certification URI.\n      - issuer - (Optional) The issuer endpoint.\n      - token_endpoint - (Optional) The token endpoint.\n      - well_known_open_id_configuration - (Optional) The well-known OpenID configuration endpoint.\n- facebook - (Optional) The Facebook provider configuration.\n  - enabled - (Optional) Whether the provider is enabled.\n  - graph_api_version - (Optional) The Graph API version.\n  - login - (Optional) The login configuration.\n    - scopes - (Optional) A list of scopes.\n  - registration - (Optional) The registration configuration.\n    - app_id - (Optional) The App ID.\n    - app_secret_setting_name - (Optional) The app setting name containing the app secret.\n- github - (Optional) The GitHub provider configuration.\n  - enabled - (Optional) Whether the provider is enabled.\n  - login - (Optional) The login configuration.\n    - scopes - (Optional) A list of scopes.\n  - registration - (Optional) The registration configuration.\n    - client_id - (Optional) The Client ID.\n    - client_secret_setting_name - (Optional) The app setting name containing the client secret.\n- google - (Optional) The Google provider configuration.\n  - enabled - (Optional) Whether the provider is enabled.\n  - login - (Optional) The login configuration.\n    - scopes - (Optional) A list of scopes.\n  - registration - (Optional) The registration configuration.\n    - client_id - (Optional) The Client ID.\n    - client_secret_setting_name - (Optional) The app setting name containing the client secret.\n  - validation - (Optional) The validation configuration.\n    - allowed_audiences - (Optional) A list of allowed audiences.\n- legacy_microsoft_account - (Optional) The legacy Microsoft Account provider configuration.\n  - enabled - (Optional) Whether the provider is enabled.\n  - login - (Optional) The login configuration.\n    - scopes - (Optional) A list of scopes.\n  - registration - (Optional) The registration configuration.\n    - client_id - (Optional) The Client ID.\n    - client_secret_setting_name - (Optional) The app setting name containing the client secret.\n  - validation - (Optional) The validation configuration.\n    - allowed_audiences - (Optional) A list of allowed audiences.\n- twitter - (Optional) The Twitter provider configuration.\n  - enabled - (Optional) Whether the provider is enabled.\n  - registration - (Optional) The registration configuration.\n    - consumer_key - (Optional) The consumer key.\n    - consumer_secret_setting_name - (Optional) The app setting name containing the consumer secret.\n"
  type = object({
    apple = optional(object({
      enabled = optional(bool)
      login = optional(object({
        scopes = optional(list(string))
      }))
      registration = optional(object({
        client_id                  = optional(string)
        client_secret_setting_name = optional(string)
      }))
    }))
    azure_active_directory = optional(object({
      enabled             = optional(bool)
      is_auto_provisioned = optional(bool)
      login = optional(object({
        disable_www_authenticate = optional(bool)
        login_parameters         = optional(list(string))
      }))
      registration = optional(object({
        client_id                                          = optional(string)
        client_secret_certificate_issuer                   = optional(string)
        client_secret_certificate_subject_alternative_name = optional(string)
        client_secret_certificate_thumbprint               = optional(string)
        client_secret_setting_name                         = optional(string)
        open_id_issuer                                     = optional(string)
      }))
      validation = optional(object({
        allowed_audiences = optional(list(string))
        default_authorization_policy = optional(object({
          allowed_applications = optional(list(string))
          allowed_principals = optional(object({
            groups     = optional(list(string))
            identities = optional(list(string))
          }))
        }))
        jwt_claim_checks = optional(object({
          allowed_client_applications = optional(list(string))
          allowed_groups              = optional(list(string))
        }))
      }))
    }))
    azure_static_web_apps = optional(object({
      enabled = optional(bool)
      registration = optional(object({
        client_id = optional(string)
      }))
    }))
    custom_open_id_connect_providers = optional(map(object({
      enabled = optional(bool)
      login = optional(object({
        name_claim_type = optional(string)
        scopes          = optional(list(string))
      }))
      registration = optional(object({
        client_id = optional(string)
        client_credential = optional(object({
          method                     = optional(string)
          client_secret_setting_name = optional(string)
        }))
        open_id_connect_configuration = optional(object({
          authorization_endpoint           = optional(string)
          certification_uri                = optional(string)
          issuer                           = optional(string)
          token_endpoint                   = optional(string)
          well_known_open_id_configuration = optional(string)
        }))
      }))
    })))
    facebook = optional(object({
      enabled           = optional(bool)
      graph_api_version = optional(string)
      login = optional(object({
        scopes = optional(list(string))
      }))
      registration = optional(object({
        app_id                  = optional(string)
        app_secret_setting_name = optional(string)
      }))
    }))
    github = optional(object({
      enabled = optional(bool)
      login = optional(object({
        scopes = optional(list(string))
      }))
      registration = optional(object({
        client_id                  = optional(string)
        client_secret_setting_name = optional(string)
      }))
    }))
    google = optional(object({
      enabled = optional(bool)
      login = optional(object({
        scopes = optional(list(string))
      }))
      registration = optional(object({
        client_id                  = optional(string)
        client_secret_setting_name = optional(string)
      }))
      validation = optional(object({
        allowed_audiences = optional(list(string))
      }))
    }))
    legacy_microsoft_account = optional(object({
      enabled = optional(bool)
      login = optional(object({
        scopes = optional(list(string))
      }))
      registration = optional(object({
        client_id                  = optional(string)
        client_secret_setting_name = optional(string)
      }))
      validation = optional(object({
        allowed_audiences = optional(list(string))
      }))
    }))
    twitter = optional(object({
      enabled = optional(bool)
      registration = optional(object({
        consumer_key                 = optional(string)
        consumer_secret_setting_name = optional(string)
      }))
    }))
  })
  default = null
}

variable "login" {
  description = "Login configuration for auth settings V2. Mirrors the API structure of login.\n\n- allowed_external_redirect_urls - (Optional) A list of allowed external redirect URLs.\n- cookie_expiration - (Optional) The cookie expiration configuration.\n  - convention - (Optional) The cookie expiration convention. Defaults to FixedTime.\n  - time_to_expiration - (Optional) The time after request when the session cookie should expire. Defaults to 08:00:00.\n- nonce - (Optional) The nonce configuration.\n  - nonce_expiration_interval - (Optional) The time after request when the nonce should expire. Defaults to 00:05:00.\n  - validate_nonce - (Optional) Should the nonce be validated? Defaults to true.\n- preserve_url_fragments_for_logins - (Optional) Should URL fragments be preserved for logins? Defaults to false.\n- routes - (Optional) The login routes configuration.\n  - logout_endpoint - (Optional) The logout endpoint.\n- token_store - (Optional) The token store configuration.\n  - azure_blob_storage - (Optional) The Azure Blob Storage token store configuration.\n    - sas_url_setting_name - (Optional) The app setting name containing the SAS URL.\n  - enabled - (Optional) Should the token store be enabled? Defaults to false.\n  - file_system - (Optional) The file system token store configuration.\n    - directory - (Optional) The directory for token storage.\n  - token_refresh_extension_hours - (Optional) Hours after session token expiry for refresh. Defaults to 72.\n"
  type = object({
    allowed_external_redirect_urls = optional(list(string))
    cookie_expiration = optional(object({
      convention         = optional(string, "FixedTime")
      time_to_expiration = optional(string, "08:00:00")
    }))
    nonce = optional(object({
      nonce_expiration_interval = optional(string, "00:05:00")
      validate_nonce            = optional(bool, true)
    }))
    preserve_url_fragments_for_logins = optional(bool, false)
    routes = optional(object({
      logout_endpoint = optional(string)
    }))
    token_store = optional(object({
      azure_blob_storage = optional(object({
        sas_url_setting_name = optional(string)
      }))
      enabled = optional(bool, false)
      file_system = optional(object({
        directory = optional(string)
      }))
      token_refresh_extension_hours = optional(number, 72)
    }))
  })
  default = null
}

variable "parent_id" {
  description = "The resource ID of the App Service site."
  type        = string
  default     = ""
}

variable "redirect_to_provider" {
  description = "The default authentication provider to use when multiple providers are configured."
  type        = string
  default     = null
}

variable "require_authentication" {
  description = "Should authentication be required? Defaults to false."
  type        = bool
  default     = false
}

variable "require_https" {
  description = "Should HTTPS be required? Defaults to true."
  type        = bool
  default     = true
}

variable "runtime_version" {
  description = "The runtime version of the auth module. Defaults to ~1."
  type        = string
  default     = "~1"
}

variable "unauthenticated_client_action" {
  description = "The action for unauthenticated requests. Defaults to RedirectToLoginPage."
  type        = string
  default     = "RedirectToLoginPage"
}
