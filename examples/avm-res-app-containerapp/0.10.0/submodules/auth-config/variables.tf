variable "container_app_resource_id" {
  description = "The Azure resource ID of the Container App that this auth config will be attached to."
  type        = string
  default     = ""
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "encryption_settings" {
  description = "The configuration settings of the secrets references of encryption and signing key used in Service Authentication/Authorization. The encryption_settings block supports the following:\n\n  - container_app_auth_encryption_secret_name - (Optional) The secret name which is referenced for EncryptionKey.\n  - container_app_auth_signing_secret_name - (Optional) The secret name which is referenced for SigningKey.\n"
  type = object({
    container_app_auth_encryption_secret_name = optional(string)
    container_app_auth_signing_secret_name    = optional(string)
  })
  default = null
}

variable "global_validation" {
  description = "The configuration settings that determines the validation flow of users using Service Authentication/Authorization. The global_validation block supports the following:\n\n  - unauthenticated_client_action - (Optional) The action to take when an unauthenticated client attempts to access the app. Possible values include AllowAnonymous, RedirectToLoginPage, Return401 and Return403.\n  - redirect_to_provider - (Optional) The default authentication provider to use when multiple providers are configured. This setting is only needed if multiple providers are configured and the unauthenticated client action is set to \"RedirectToLoginPage\".\n  - exclude_paths - (Optional) The paths for which unauthenticated flow would not be redirected to the login page.\n"
  type = object({
    unauthenticated_client_action = optional(string)
    redirect_to_provider          = optional(string)
    exclude_paths                 = optional(list(string))
  })
  default = null
}

variable "http_settings" {
  description = "The configuration settings of the HTTP requests for authentication and authorization requests made against ContainerApp Service Authentication/Authorization. The http_settings block supports the following:\n\n  - require_https - (Optional) true if the authentication/authorization responses not having the HTTPS scheme are permissible; otherwise, false.\n  - forward_proxy - (Optional) The configuration settings of a forward proxy used to make the requests. The forward_proxy block supports convention, custom_host_header_name and custom_proto_header_name.\n  - routes - (Optional) The configuration settings of the paths HTTP requests. The routes block supports api_prefix.\n"
  type = object({
    require_https = optional(bool)
    forward_proxy = optional(object({
      convention               = optional(string)
      custom_host_header_name  = optional(string)
      custom_proto_header_name = optional(string)
    }))
    routes = optional(object({
      api_prefix = string
    }))
  })
  default = null
}

variable "identity_providers" {
  description = "The configuration settings of each of the identity providers used to configure ContainerApp Service Authentication/Authorization. See the parent auth_configs variable in the root module for the full description of each supported provider.\n"
  type = object({
    azure_active_directory = optional(object({
      enabled = optional(bool)
      registration = optional(object({
        open_id_issuer                                     = optional(string)
        client_id                                          = optional(string)
        client_secret_setting_name                         = optional(string)
        client_secret_certificate_issuer                   = optional(string)
        client_secret_certificate_subject_alternative_name = optional(string)
        client_secret_certificate_thumbprint               = optional(string)
      }))
      login = optional(object({
        login_parameters         = list(string)
        disable_www_authenticate = bool
      }))
      validation = optional(object({
        jwt_claim_checks = optional(object({
          allowed_groups              = optional(list(string))
          allowed_client_applications = optional(list(string))
        }))
        allowed_audiences = optional(list(string))
        default_authorization_policy = optional(object({
          allowed_principals = optional(object({
            groups     = optional(list(string))
            identities = optional(list(string))
          }))
          allowed_applications = optional(list(string))
        }))
      }))
      is_auto_provisioned = optional(bool)
    }))
    facebook = optional(object({
      enabled = optional(bool)
      registration = optional(object({
        app_id                  = optional(string)
        app_secret_setting_name = optional(string)
      }))
      graph_api_version = optional(string)
      login = optional(object({
        scopes = list(string)
      }))
    }))
    github = optional(object({
      enabled = optional(bool)
      registration = optional(object({
        client_id                  = optional(string)
        client_secret_setting_name = optional(string)
      }))
      login = optional(object({
        scopes = list(string)
      }))
    }))
    google = optional(object({
      enabled = optional(bool)
      registration = optional(object({
        client_id                  = optional(string)
        client_secret_setting_name = optional(string)
      }))
      login = optional(object({
        scopes = list(string)
      }))
      validation = optional(object({
        allowed_audiences = list(string)
      }))
    }))
    twitter = optional(object({
      enabled = optional(bool)
      registration = optional(object({
        consumer_key                 = string
        consumer_secret_setting_name = optional(string)
      }))
    }))
    apple = optional(object({
      enabled = optional(bool)
      registration = optional(object({
        client_id                  = string
        client_secret_setting_name = optional(string)
      }))
      login = optional(object({
        scopes = list(string)
      }))
    }))
    azure_static_web_apps = optional(object({
      enabled = optional(bool)
      registration = optional(object({
        client_id = string
      }))
    }))
    custom_open_id_connect_providers = optional(map(object({
      enabled = optional(bool)
      registration = optional(object({
        client_id = optional(string)
        client_credential = optional(object({
          method                     = string
          client_secret_setting_name = string
        }))
        open_id_connect_configuration = optional(object({
          authorization_endpoint           = string
          token_endpoint                   = string
          issuer                           = string
          certification_uri                = string
          well_known_open_id_configuration = optional(string)
        }))
      }))
      login = optional(object({
        name_claim_type = string
        scopes          = list(string)
      }))
    })), {})
  })
  default = null
}

variable "location" {
  description = "The Azure region for the auth config telemetry deployment."
  type        = string
  default     = null
}

variable "login" {
  description = "The configuration settings of the login flow of users using ContainerApp Service Authentication/Authorization. The login block supports the following:\n\n  - routes - (Optional) The routes that specify the endpoints used for login and logout requests. routes supports logout_endpoint.\n  - token_store - (Optional) The configuration settings of the token store. token_store supports enabled, token_refresh_extension_hours and azure_blob_storage.\n  - preserve_url_fragments_for_logins - (Optional) Whether the fragments from the request are preserved after the login request is made.\n  - allowed_external_redirect_urls - (Optional) External URLs that can be redirected to as part of logging in or logging out of the app.\n  - cookie_expiration - (Optional) The configuration settings of the session cookie's expiration.\n  - nonce - (Optional) The configuration settings of the nonce used in the login flow.\n"
  type = object({
    routes = optional(object({
      logout_endpoint = string
    }))
    token_store = optional(object({
      enabled                       = bool
      token_refresh_extension_hours = number
      azure_blob_storage = optional(object({
        sas_url_setting_name = string
      }))
    }))
    preserve_url_fragments_for_logins = optional(bool)
    allowed_external_redirect_urls    = optional(list(string))
    cookie_expiration = optional(object({
      convention         = optional(string)
      time_to_expiration = optional(string)
    }))
    nonce = optional(object({
      validate_nonce            = bool
      nonce_expiration_interval = string
    }))
  })
  default = null
}

variable "name" {
  description = "The name of the Container App AuthConfig resource. The Azure API only accepts the value current."
  type        = string
  default     = ""
}

variable "platform" {
  description = "The configuration settings of the platform of ContainerApp Service Authentication/Authorization. The platform block supports the following:\n\n  - enabled - (Optional) true if the Authentication / Authorization feature is enabled for the current app; otherwise, false.\n  - runtime_version - (Optional) The RuntimeVersion of the Authentication / Authorization feature in use for the current app.\n"
  type = object({
    enabled         = optional(bool)
    runtime_version = optional(string)
  })
  default = null
}

variable "retry" {
  description = "Retry configuration applied to the azapi_resource managed by this submodule.\n\n- error_message_regex  - (Optional) A list of regex patterns matching error messages that trigger a retry.\n- interval_seconds     - (Optional) Initial interval between retries in seconds.\n- max_interval_seconds - (Optional) Maximum interval between retries in seconds.\n\nSee <https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/resource#retry> for full semantics.\n"
  type = object({
    error_message_regex  = optional(list(string))
    interval_seconds     = optional(number)
    max_interval_seconds = optional(number)
  })
  default = null
}

variable "timeouts" {
  description = "Per-operation timeouts applied to the azapi_resource managed by this submodule. Each value is a Go duration string (e.g. 30m, 1h).\n\n- create - (Optional) Timeout for create operations.\n- delete - (Optional) Timeout for delete operations.\n- read   - (Optional) Timeout for read operations.\n- update - (Optional) Timeout for update operations.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}
