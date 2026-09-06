variable "auth_configs" {
  description = "- name - (Required) Name of the Container App AuthConfig.\n\n---\nplatform The configuration settings of the platform of ContainerApp Service Authentication/Authorization. The platform block supports the following:\n  - enabled - (Optional) true if the Authentication / Authorization feature is enabled for the current app; otherwise, false.\n  - runtime_version - (Optional) The RuntimeVersion of the Authentication / Authorization feature in use for the current app. The setting in this value can control the behavior of certain features in the Authentication / Authorization module.\n\n---\nglobal_validation The configuration settings that determines the validation flow of users using Service Authentication/Authorization. The global_validation block supports the following:\n  - unauthenticated_client_action - (Optional) The action to take when an unauthenticated client attempts to access the app. Possible values include AllowAnonymous, RedirectToLoginPage, Return401  and Return403.\n  - redirect_to_provider - (Optional) The default authentication provider to use when multiple providers are configured. This setting is only needed if multiple providers are configured and the unauthenticated client action is set to \"RedirectToLoginPage\".\n  - exclude_paths - (Optional) The paths for which unauthenticated flow would not be redirected to the login page.\n\n---\nidentity_providers The configuration settings of each of the identity providers used to configure ContainerApp Service Authentication/Authorization. The identity_providers block supports the following:\n  - azure_active_directory - (Optional) The configuration settings of the Azure Active directory provider. The azure_active_directory block supports the following:\n    - enabled - (Optional) false if the Azure Active Directory provider should not be enabled despite the set registration; otherwise, true.\n    - is_auto_provisioned - (Optional) Gets a value indicating whether the Azure AD configuration was auto-provisioned using 1st party tooling. This is an internal flag primarily intended to support the Azure Management Portal. Users should not read or write to this property.\n    - registration - (Optional) The registration settings for the Azure Active Directory provider. The registration block supports the following:\n      - open_id_issuer - (Optional) The OpenID Connect Issuer URI that represents the entity which issues access tokens for this application. When using Azure Active Directory, this value is the URI of the directory tenant, e.g. https://login.microsoftonline.com/v2.0/{tenant-guid}/. This URI is a case-sensitive identifier for the token issuer. More information on OpenID Connect Discovery: http://openid.net/specs/openid-connect-discovery-1_0.html\n      - client_id - (Optional) The Client ID of this relying party application, known as the client_id. This setting is required for enabling OpenID Connection authentication with Azure Active Directory or other 3rd party OpenID Connect providers. More information on OpenID Connect: http://openid.net/specs/openid-connect-core-1_0.html\n      - client_secret_setting_name - (Optional) The app setting name that contains the client secret of the relying party application.\n      - client_secret_certificate_issuer - (Optional) An alternative to the client secret thumbprint, that is the issuer of a certificate used for signing purposes. This property acts as a replacement for the Client Secret Certificate Thumbprint. It is also optional.\n      - client_secret_certificate_subject_alternative_name - (Optional) An alternative to the client secret thumbprint, that is the subject alternative name of a certificate used for signing purposes. This property acts as a replacement for the Client Secret Certificate Thumbprint. It is also optional.\n    - login - (Optional) The login settings for the Azure Active Directory provider. The login block supports the following:\n      - login_parameters - (Optional) Login parameters to send to the OpenID Connect authorization endpoint when a user logs in. Each parameter must be in the form \"key=value\".\n      - disable_www_authenticate - (Optional) true if the www-authenticate provider should be omitted from the request; otherwise, false.\n    - validation - (Optional) The configuration settings of the Azure Active Directory token validation flow. The validation block supports the following:\n      - jwt_claim_checks - (Optional) The configuration settings of the checks that should be made while validating the JWT Claims. The jwt_claim_checks block supports the following:\n        - allowed_groups - (Optional) The list of the allowed groups.\n        - allowed_client_applications - (Optional) The list of the allowed client applications.\n      - allowed_audiences - (Optional) The list of audiences that can make successful authentication/authorization requests.\n      - default_authorization_policy - (Optional) The configuration settings of the default authorization policy. The default_authorization_policy block supports the following:\n        - allowed_applications - (Optional) The configuration settings of the Azure Active Directory allowed applications.\n        - allowed_principals - (Optional) The configuration settings of the Azure Active Directory allowed principals. The allowed_principals block supports the following:\n          - groups - (Optional) The list of the allowed groups.\n          - identities - (Optional) The list of the allowed identities.\n  - facebook - (Optional) The configuration settings of the Facebook provider. The facebook block supports the following:\n    - enabled - (Optional) false if the Facebook provider should not be enabled despite the set registration; otherwise, true.\n    - graph_api_version - (Optional) The version of the Facebook api to be used while logging in.\n    - registration - (Optional) The configuration settings of the app registration for the Facebook provider. The registration block supports the following:\n      - app_id - (Optional) The App ID of the app used for login.\n      - app_secret_setting_name - (Optional) The app setting name that contains the app secret.\n    - login - (Optional) The configuration settings of the login flow. The login block supports the following:\n      - scopes - (Optional) A list of the scopes that should be requested while authenticating.\n  - github - (Optional) The configuration settings of the GitHub provider. The github block supports the following:\n    - enabled - (Optional) false if the GitHub provider should not be enabled despite the set registration; otherwise, true.\n    - registration - (Optional) The configuration settings of the app registration for the GitHub provider. The registration block supports the following:\n      - client_id - (Optional) The Client ID of the app used for login.\n      - client_secret_setting_name - (Optional) The app setting name that contains the client secret.\n    - login - (Optional) The configuration settings of the login flow. The login block supports the following:\n      - scopes - (Optional) A list of the scopes that should be requested while authenticating.\n  - google - (Optional) The configuration settings of the Google provider.\n    - enabled - (Optional) false if the Google provider should not be enabled despite the set registration; otherwise, true.\n    - registration - (Optional) The configuration settings of the app registration for the Google provider. The registration block supports the following:\n      - client_id - (Optional) The Client ID of the app used for login.\n      - client_secret_setting_name - (Optional) The app setting name that contains the client secret.\n    - login - (Optional) The configuration settings of the login flow. The login block supports the following:\n      - scopes - (Optional) A list of the scopes that should be requested while authenticating.\n    - validation - (Optional) The configuration settings of the Azure Active Directory token validation flow. The validation block supports the following:\n      - allowed_audiences - (Optional) The configuration settings of the allowed list of audiences from which to validate the JWT token.\n  - twitter - (Optional) The configuration settings of the Twitter provider. The twitter block supports the following:\n    - enabled - (Optional) false if the Twitter provider should not be enabled despite the set registration; otherwise, true.\n    - registration - (Optional) The configuration settings of the app registration for the Twitter provider. The registration block supports the following:\n      - consumer_key - (Required) The OAuth 1.0a consumer key of the Twitter application used for sign-in. This setting is required for enabling Twitter Sign-In. Twitter Sign-In documentation: https://dev.twitter.com/web/sign-in\n      - consumer_secret_setting_name - (Optional) The app setting name that contains the OAuth 1.0a consumer secret of the Twitter application used for sign-in.\n  - apple - (Optional) The configuration settings of the Apple provider. The apple block supports the following:\n    - enabled - (Optional) false if the Apple provider should not be enabled despite the set registration; otherwise, true.\n    - registration - (Optional) The configuration settings of the Apple registration. The registration block supports the following:\n      - client_id - (Optional) The Client ID of the app used for login.\n      - client_secret_setting_name - (Optional) The app setting name that contains the client secret.\n    - login - (Optional) The configuration settings of the login flow. The login block supports the following:\n      - scopes - (Optional) A list of the scopes that should be requested while authenticating.\n  - azure_static_web_apps - (Optional) The configuration settings of the Azure Static Web Apps provider. The azure_static_web_apps block supports the following:\n    - enabled - (Optional) false if the Azure Static Web Apps provider should not be enabled despite the set registration; otherwise, true.\n    - registration - (Optional) The configuration settings of the Azure Static Web Apps registration. The registration block supports the following:\n      - client_id - (Optional) The Client ID of the app used for login.\n  - custom_open_id_connect_providers - (Optional) The map of the name of the alias of each custom Open ID Connect provider to the configuration settings of the custom Open ID Connect provider. The custom_open_id_connect_providers's value supports the following:\n    - enabled - (Optional) false if the custom Open ID provider provider should not be enabled; otherwise, true.\n    - registration - (Optional) The configuration settings of the app registration for the custom Open ID Connect provider. The registration block supports the following:\n      - client_id - (Optional) The client id of the custom Open ID Connect provider.\n      - client_credential - (Optional) The authentication credentials of the custom Open ID Connect provider. The client_credential block supports the following:\n        - method - (Optional) The method that should be used to authenticate the user. Possible values ClientSecretPost.\n        - client_secret_setting_name - (Optional) The app setting that contains the client secret for the custom Open ID Connect provider.\n      - open_id_connect_configuration - (Optional) The configuration settings of the endpoints used for the custom Open ID Connect provider. The open_id_connect_configuration block supports the following:\n        - authorization_endpoint - (Optional) The endpoint to be used to make an authorization request.\n        - certification_uri - (Optional) The endpoint that provides the keys necessary to validate the token.\n        - issuer - (Optional) The endpoint that issues the token.\n        - token_endpoint - (Optional) The endpoint to be used to request a token.\n        - well_known_open_id_configuration - (Optional) The endpoint that contains all the configuration endpoints for the provider.\n    - login - (Optional) The configuration settings of the login flow of the custom Open ID Connect provider. The login block supports the following:\n      - name_claim_type - (Optional) The name of the claim that contains the users name.\n      - scopes - (Optional) A list of the scopes that should be requested while authenticating.\n\n---\nlogin - The configuration settings of the login flow of users using ContainerApp Service Authentication/Authorization. The login block supports the following:\n  - routes - (Optional) The routes that specify the endpoints used for login and logout requests. The routes block supports the following:\n    - logout_endpoint - (Optional) The endpoint at which a logout request should be made.\n  - token_store - (Optional) The configuration settings of the token store. The token_store block supports the following:\n    - enabled - (Optional) true to durably store platform-specific security tokens that are obtained during login flows; otherwise, false.\n    - token_refresh_extension_hours - (Optional) The number of hours after session token expiration that a session token can be used to call the token refresh API\n    - azure_blob_storage - (Optional) The configuration settings of the storage of the tokens if blob storage is used. The azure_blob_storage block supports the following:\n      - sas_url_setting_name - (Required) The name of the app secrets containing the SAS URL of the blob storage containing the tokens.\n  - preserve_url_fragments_for_logins - (Optional) true if the fragments from the request are preserved after the login request is made; otherwise, false.\n  - allowed_external_redirect_urls - (Optional) External URLs that can be redirected to as part of logging in or logging out of the app. Note that the query string part of the URL is ignored. This is an advanced setting typically only needed by Windows Store application backends. Note that URLs within the current domain are always implicitly allowed.\n  - cookie_expiration - (Optional) The configuration settings of the session cookie's expiration. The cookie_expiration block supports the following:\n    - convention - (Optional) The convention used when determining the session cookie's expiration.\n    - time_to_expiration - (Optional) The time after the request is made when the session cookie should expire.\n  - nonce - (Optional) The configuration settings of the nonce used in the login flow. The nonce block supports the following:\n    - validate_nonce - (Optional) true if the nonce should not be validated while completing the login flow; otherwise, false.\n    - nonce_expiration_interval - (Optional) The time after the request is made when the nonce should expire.\n"
  type = map(object({
    name = string
    platform = optional(object({
      enabled         = optional(bool)
      runtime_version = optional(string)
    }))
    global_validation = optional(object({
      unauthenticated_client_action = optional(string)
      redirect_to_provider          = optional(string)
      exclude_paths                 = optional(list(string))
    }))
    identity_providers = optional(object({
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
    }))
    login = optional(object({
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
    }))
    http_settings = optional(object({
      require_https = optional(bool)
      forward_proxy = optional(object({
        convention               = optional(string)
        custom_host_header_name  = optional(string)
        custom_proto_header_name = optional(string)
      }))
      routes = optional(object({
        api_prefix = string
      }))
    }))
    encryption_settings = optional(object({
      container_app_auth_encryption_secret_name = optional(string)
      container_app_auth_signing_secret_name    = optional(string)
    }))
  }))
  default = {}
}

variable "container_app_environment_resource_id" {
  description = "The ID of the Container App Environment to host this Container App."
  type        = string
  default     = ""
}

variable "dapr" {
  description = "- app_id - (Optional) The Dapr Application Identifier.\n- app_port - (Optional) The port which the application is listening on. This is the same as the ingress port.\n- app_protocol - (Optional) The protocol for the app. Possible values include http and grpc. Defaults to http.\n- enable_api_logging - (Optional) Enable API logging. Defaults to false.\n- enabled - (Optional) Enable Dapr for the application. Defaults to false.\n- http_max_request_size - (Optional) The maximum allowed HTTP request size in bytes.\n- http_read_buffer_size - (Optional) The size of the buffer used for reading the HTTP request body in bytes.\n- log_level - (Optional) The log level for Dapr. Possible values include \"debug\", \"info\", \"warn\", \"error\", and \"fatal\".\n"
  type = object({
    app_id                = optional(string)
    app_port              = optional(number)
    app_protocol          = optional(string, "http")
    enable_api_logging    = optional(bool, false)
    enabled               = optional(bool, false)
    http_max_request_size = optional(number)
    http_read_buffer_size = optional(number)
    log_level             = optional(string, "info")
  })
  default = null
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "identity_settings" {
  description = "A list of identity settings for the Container App.\n\n---\nidentity_settings block supports the following:\n- identity - (Required) The resource ID of the user-assigned managed identity.\n- lifecycle - (Required) The lifecycle state of the identity. Possible values are Init, None, Retain and All. Defaults to All.\n"
  type = list(object({
    identity  = string
    lifecycle = optional(string, "All")
  }))
  default = null
}

variable "ingress" {
  description = "\nThis object defines the ingress properties for the container app:\n\n- allow_insecure_connections - (Optional) Should this ingress allow insecure connections? Defaults to false.\n- client_certificate_mode - (Optional) The mode for client certificate authentication. Possible values include optional and required.\n- exposed_port - (Optional) The exposed port on the container for the Ingress traffic. Defaults to 0.\n- external_enabled - (Optional) Are connections to this Ingress from outside the Container App Environment enabled? Defaults to false.\n- target_port - (Required) The target port on the container for the Ingress traffic. Defaults to Auto.\n- transport - (Optional) The transport method for the Ingress. Possible values include auto, http, http2, and tcp. Defaults to auto.\n\n---\ntraffic_weight block supports the following:\n- label - (Optional) The label to apply to the revision as a name prefix for routing traffic.\n- latest_revision - (Optional) This traffic Weight relates to the latest stable Container Revision. Defaults to false.\n- revision_suffix - (Optional) The suffix string to which this traffic_weight applies.\n- percentage - (Required) The percentage of traffic which should be sent according to this configuration.\n\n---\ncors_policy block supports the following:\n- allow_credentials - (Optional) Indicates whether the browser should include credentials when making a request. Defaults to false.\n- allowed_headers - (Optional) List of headers that can be used when making the actual request.\n- allowed_methods - (Optional) List of HTTP methods that can be used when making the actual request.\n- allowed_origins - (Optional) List of origins that are allowed to access the resource.\n- expose_headers - (Optional) List of response headers that can be exposed when making the actual request.\n- max_age - (Optional) The maximum number of seconds the results of a preflight request can be cached.\n\n---\ncustom_domain block supports the following (DEPRECATED - use custom_domains instead):\n- certificate_binding_type - (Optional) The Binding type. Possible values include Disabled and SniEnabled. Defaults to Disabled.\n- certificate_id - (Optional) The ID of the Container App Environment Certificate.\n- name - (Optional) The hostname of the Certificate. Must be the CN or a named SAN in the certificate.\n\n---\ncustom_domains block supports the following:\n- certificate_binding_type - (Optional) The Binding type. Possible values include Disabled and SniEnabled. Defaults to Disabled.\n- certificate_id - (Optional) The ID of the Container App Environment Certificate.\n- name - (Required) The hostname of the Certificate. Must be the CN or a named SAN in the certificate.\n\n---\nip_restrictions block supports the following:\n- action - (Optional) The action to take when the IP security restriction is triggered. Possible values include allow and deny.\n- description - (Optional) A description for the IP security restriction.\n- ip_range - (Optional) The IP address range for the security restriction.\n- name - (Optional) The name for the IP security restriction.\n\n---\nsticky_sessions block supports the following:\n- affinity - (Optional) The affinity type for sticky sessions. Possible values include None, ClientIP, and Server.\n\n"
  type = object({
    allow_insecure_connections = optional(bool, false)
    client_certificate_mode    = optional(string)
    exposed_port               = optional(number, 0)
    external_enabled           = optional(bool, false)
    target_port                = optional(number)
    transport                  = optional(string, "auto")

    traffic_weight = list(object({
      label           = optional(string)
      latest_revision = optional(bool, false)
      revision_suffix = optional(string)
      percentage      = number
    }))

    additional_port_mappings = optional(list(object({
      exposed_port = number
      external     = bool
      target_port  = number
    })))

    cors_policy = optional(object({
      allow_credentials = optional(bool, false)
      allowed_headers   = optional(list(string))
      allowed_methods   = optional(list(string))
      allowed_origins   = optional(list(string))
      expose_headers    = optional(list(string))
      max_age           = optional(number)
    }), null)

    # TODO: Remove custom_domain in v1.0.0 - replaced by custom_domains list
    custom_domain = optional(object({
      certificate_binding_type = optional(string)
      certificate_id           = optional(string)
      name                     = optional(string)
    }))

    custom_domains = optional(list(object({
      certificate_binding_type = optional(string)
      certificate_id           = optional(string)
      name                     = string
    })), [])

    ip_restrictions = optional(list(object({
      action      = optional(string)
      description = optional(string)
      ip_range    = optional(string)
      name        = optional(string)
    })))

    sticky_sessions = optional(object({
      affinity = optional(string, "none")
    }))
  })
  default = null
}

variable "kind" {
  description = "Metadata used to render different experiences for resources of the same type; e.g. WorkflowApp is a kind of Microsoft.App/ContainerApps type. If supported, the resource provider must validate and persist this value."
  type        = string
  default     = null
}

variable "location" {
  description = "Azure region where the resource should be deployed. If null, the location will be inferred from the resource group location. This variable would be required in v1.0.0."
  type        = string
  default     = null
}

variable "lock" {
  description = "  Controls the Resource Lock configuration for this resource. The following properties can be specified:\n\n  - kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n  - name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n"
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "managed_identities" {
  description = "Configurations for managed identities in Azure. This variable allows you to specify both system-assigned and user-assigned managed identities for resources that support identity-based authentication.\n\n- system_assigned - (Optional) A boolean flag indicating whether to enable the system-assigned managed identity. Defaults to false.\n- user_assigned_resource_ids - (Optional) A set of user-assigned managed identity resource IDs to be associated with the resource.\n"
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default = {}
}

variable "max_inactive_revisions" {
  description = "(Optional). Max inactive revisions a Container App can have."
  type        = number
  default     = 0
}

variable "name" {
  description = "The name of the Container App."
  type        = string
  default     = ""
}

variable "registries" {
  description = "\n- identity - (Optional) Resource ID for the User Assigned Managed identity to use when pulling from the Container Registry.\n- password_secret_name  - (Optional) The name of the Secret Reference containing the password value for this user on the Container Registry, username must also be supplied.\n- server - (Optional) The hostname for the Container Registry.\n- username - (Optional) The username to use for this Container Registry, password_secret_name must also be supplied.\n\n"
  type = list(object({
    identity             = optional(string)
    password_secret_name = optional(string)
    server               = optional(string)
    username             = optional(string)
  }))
  default = null
}

variable "resource_group_id" {
  description = "(Optional) The id of the resource group in which the Container App Environment is to be created. Set only when you see recreation in Terraform plan caused by known after apply value assigned to azapi_resource.container_app.parent_id(when use this module along with depends_on another resource, all data source in this module would be defer to the apply time, which causes data.azapi_client_config.current's values be known after apply). Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which the Container App Environment is to be created. Changing this forces a new resource to be created."
  type        = string
  default     = ""
}

variable "revision_mode" {
  description = "(Required) The revisions operational mode for the Container App. Possible values include Single and Multiple. In Single mode, a single revision is in operation at any given time. In Multiple mode, more than one revision can be active at a time and can be configured with load distribution via the traffic_weight block in the ingress configuration."
  type        = string
  default     = "Single"
}

variable "role_assignments" {
  description = "  A map of role assignments to create on the <RESOURCE>. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n  - role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n  - principal_id - The ID of the principal to assign the role to.\n  - description - (Optional) The description of the role assignment.\n  - skip_service_principal_aad_check - (Optional) If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n  - condition - (Optional) The condition which will be used to scope the role assignment.\n  - condition_version - (Optional) The version of the condition syntax. Leave as null if you are not using a condition, if you are then valid values are '2.0'.\n  - delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\n  - principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n\n  > Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
  type = map(object({
    role_definition_id_or_name             = string
    principal_id                           = string
    description                            = optional(string, null)
    skip_service_principal_aad_check       = optional(bool, false)
    condition                              = optional(string, null)
    condition_version                      = optional(string, null)
    delegated_managed_identity_resource_id = optional(string, null)
    principal_type                         = optional(string, null)
  }))
  default = {}
}

variable "runtime" {
  description = "Runtime configuration for the Container App.\n\n---\nruntime block supports the following:\n- java - (Optional) Java runtime configuration.\n\n---\njava block supports the following:\n- enable_metrics - (Optional) Whether to enable Java metrics collection. Defaults to false.\n"
  type = object({
    java = optional(object({
      enable_metrics = optional(bool, false)
    }))
  })
  default = null
}

variable "secrets" {
  description = "\n- key_vault_secret_id - (Optional) The URL of the Azure Key Vault containing the secret. Required when identity is specified.\n- identity - (Optional) The identity associated with the secret.\n- name - (Required) The secret name.\n- value - (Optional) The value for this secret. Required when key_vault_secret_id is not specified.\n\n"
  type = map(object({
    identity            = optional(string)
    key_vault_secret_id = optional(string)
    name                = string
    value               = optional(string)
  }))
  default = null
}

variable "service" {
  description = "Service configuration for the Container App.\n\n---\nservice block supports the following:\n- type - (Required) The type of service. Possible values include service types supported by Azure Container Apps.\n"
  type = object({
    type = string
  })
  default = null
}

variable "tags" {
  description = "Custom tags to apply to the resource."
  type        = map(string)
  default     = null
}

variable "template" {
  description = " - cooldown_period - (Optional) The cooldown period in seconds after a scaling action before another scaling action can be triggered. Defaults to 300.\n - max_replicas - (Optional) The maximum number of replicas for this container.\n - min_replicas - (Optional) The minimum number of replicas for this container.\n - polling_interval - (Optional) The interval in seconds at which the scaling rules are evaluated. Defaults to 30.\n - revision_suffix - (Optional) The suffix for the revision. This value must be unique for the lifetime of the Resource. If omitted the service will use a hash function to create one.\n\n ---\n azure_queue_scale_rule block supports the following:\n - name - (Required) The name of the Scaling Rule\n - queue_length - (Required) The value of the length of the queue to trigger scaling actions.\n - queue_name - (Required) The name of the Azure Queue\n\n ---\n authentication block supports the following:\n - secret_name - (Required) The name of the Container App Secret to use for this Scale Rule Authentication.\n - trigger_parameter - (Required) The Trigger Parameter name to use the supply the value retrieved from the secret_name.\n\n ---\n containers block supports the following:\n - args - (Optional) A list of extra arguments to pass to the container.\n - command - (Optional) A command to pass to the container to override the default. This is provided as a list of command line elements without spaces.\n - cpu - (Required) The amount of vCPU to allocate to the container. Possible values include 0.25, 0.5, 0.75, 1.0, 1.25, 1.5, 1.75, and 2.0. When there's a workload profile specified, there's no such constraint.\n - image - (Required) The image to use to create the container.\n - memory - (Required) The amount of memory to allocate to the container. Possible values are 0.5Gi, 1Gi, 1.5Gi, 2Gi, 2.5Gi, 3Gi, 3.5Gi and 4Gi. When there's a workload profile specified, there's no such constraint.\n - name - (Required) The name of the container\n\n ---\n env block supports the following:\n - name - (Required) The name of the environment variable for the container.\n - secret_name - (Optional) The name of the secret that contains the value for this environment variable.\n - value - (Optional) The value for this environment variable.\n\n ---\n liveness_probes block supports the following:\n - failure_count_threshold - (Optional) The number of consecutive failures required to consider this probe as failed. Possible values are between 1 and 10. Defaults to 3.\n - host - (Optional) The probe hostname. Defaults to the pod IP address. Setting a value for Host in headers can be used to override this for HTTP and HTTPS type probes.\n - initial_delay - (Optional) The time in seconds to wait after the container has started before the probe is started.\n - interval_seconds - (Optional) How often, in seconds, the probe should run. Possible values are in the range 1\n - path - (Optional) The URI to use with the host for http type probes. Not valid for TCP type probes. Defaults to /.\n - port - (Required) The port number on which to connect. Possible values are between 1 and 65535.\n - timeout - (Optional) Time in seconds after which the probe times out. Possible values are in the range 1\n - transport - (Required) Type of probe. Possible values are TCP, HTTP, and HTTPS.\n\n ---\n header block supports the following:\n - name - (Required) The HTTP Header Name.\n - value - (Required) The HTTP Header value.\n\n ---\n readiness_probes block supports the following:\n - failure_count_threshold - (Optional) The number of consecutive failures required to consider this probe as failed. Possible values are between 1 and 10. Defaults to 3.\n - host - (Optional) The probe hostname. Defaults to the pod IP address. Setting a value for Host in headers can be used to override this for HTTP and HTTPS type probes.\n - initial_delay - (Optional) The number of seconds elapsed after the container has started before the probe is initiated. Possible values are between 0 and 60. Defaults to 0 seconds.\n - interval_seconds - (Optional) How often, in seconds, the probe should run. Possible values are between 1 and 240. Defaults to 10\n - path - (Optional) The URI to use for http type probes. Not valid for TCP type probes. Defaults to /.\n - port - (Required) The port number on which to connect. Possible values are between 1 and 65535.\n - success_count_threshold - (Optional) The number of consecutive successful responses required to consider this probe as successful. Possible values are between 1 and 10. Defaults to 3.\n - timeout - (Optional) Time in seconds after which the probe times out. Possible values are in the range 1\n - transport - (Required) Type of probe. Possible values are TCP, HTTP, and HTTPS.\n\n ---\n header block supports the following:\n - name - (Required) The HTTP Header Name.\n - value - (Required) The HTTP Header value.\n\n---\n startup_probe block has been deprecated and would be removed in v1, please use startup_probes instead! startup_probe block supports the following:\n - failure_count_threshold - (Optional) The number of consecutive failures required to consider this probe as failed. Possible values are between 1 and 10. Defaults to 3.\n - host - (Optional) The value for the host header which should be sent with this probe. If unspecified, the IP Address of the Pod is used as the host header. Setting a value for Host in headers can be used to override this for HTTP and HTTPS type probes.\n - initial_delay - (Optional) The number of seconds elapsed after the container has started before the probe is initiated. Possible values are between 0 and 60. Defaults to 0 seconds.\n - interval_seconds - (Optional) How often, in seconds, the probe should run. Possible values are between 1 and 240. Defaults to 10\n - path - (Optional) The URI to use with the host for http type probes. Not valid for TCP type probes. Defaults to /.\n - port - (Required) The port number on which to connect. Possible values are between 1 and 65535.\n - timeout - (Optional) Time in seconds after which the probe times out. Possible values are in the range 1\n - transport - (Required) Type of probe. Possible values are TCP, HTTP, and HTTPS.\n\n ---\n startup_probes block supports the following:\n - failure_count_threshold - (Optional) The number of consecutive failures required to consider this probe as failed. Possible values are between 1 and 10. Defaults to 3.\n - host - (Optional) The value for the host header which should be sent with this probe. If unspecified, the IP Address of the Pod is used as the host header. Setting a value for Host in headers can be used to override this for HTTP and HTTPS type probes.\n - initial_delay - (Optional) The number of seconds elapsed after the container has started before the probe is initiated. Possible values are between 0 and 60. Defaults to 0 seconds.\n - interval_seconds - (Optional) How often, in seconds, the probe should run. Possible values are between 1 and 240. Defaults to 10\n - path - (Optional) The URI to use with the host for http type probes. Not valid for TCP type probes. Defaults to /.\n - port - (Required) The port number on which to connect. Possible values are between 1 and 65535.\n - timeout - (Optional) Time in seconds after which the probe times out. Possible values are in the range 1\n - transport - (Required) Type of probe. Possible values are TCP, HTTP, and HTTPS.\n\n ---\n header block supports the following:\n - name - (Required) The HTTP Header Name.\n - value - (Required) The HTTP Header value.\n\n ---\n volume_mounts block supports the following:\n - name - (Required) The name of the Volume to be mounted in the container.\n - path - (Required) The path in the container at which to mount this volume.\n\n ---\n custom_scale_rule block supports the following:\n - custom_rule_type - (Required) The Custom rule type. Possible values include: activemq, artemis-queue, kafka, pulsar, aws-cloudwatch, aws-dynamodb, aws-dynamodb-streams, aws-kinesis-stream, aws-sqs-queue, azure-app-insights, azure-blob, azure-data-explorer, azure-eventhub, azure-log-analytics, azure-monitor, azure-pipelines, azure-servicebus, azure-queue, cassandra, cpu, cron, datadog, elasticsearch, external, external-push, gcp-stackdriver, gcp-storage, gcp-pubsub, graphite, http, huawei-cloudeye, ibmmq, influxdb, kubernetes-workload, liiklus, memory, metrics-api, mongodb, mssql, mysql, nats-jetstream, stan, tcp, new-relic, openstack-metric, openstack-swift, postgresql, predictkube, prometheus, rabbitmq, redis, redis-cluster, redis-sentinel, redis-streams, redis-cluster-streams, redis-sentinel-streams, selenium-grid,solace-event-queue, and github-runner.\n - metadata - (Required)\n - name - (Required) The name of the Scaling Rule\n\n ---\n authentication block supports the following:\n - secret_name - (Required) The name of the Container App Secret to use for this Scale Rule Authentication.\n - trigger_parameter - (Required) The Trigger Parameter name to use the supply the value retrieved from the secret_name.\n\n ---\n http_scale_rule block supports the following:\n - concurrent_requests - (Required)\n - name - (Required) The name of the Scaling Rule\n\n ---\n authentication block supports the following:\n - secret_name - (Required) The name of the Container App Secret to use for this Scale Rule Authentication.\n - trigger_parameter - (Required) The Trigger Parameter name to use the supply the value retrieved from the secret_name.\n\n ---\n init_container block supports the following:\n - args - (Optional) A list of extra arguments to pass to the container.\n - command - (Optional) A command to pass to the container to override the default. This is provided as a list of command line elements without spaces.\n - cpu - (Optional) The amount of vCPU to allocate to the container. Possible values include 0.25, 0.5, 0.75, 1.0, 1.25, 1.5, 1.75, and 2.0. When there's a workload profile specified, there's no such constraint.\n - image - (Required) The image to use to create the container.\n - memory - (Optional) The amount of memory to allocate to the container. Possible values are 0.5Gi, 1Gi, 1.5Gi, 2Gi, 2.5Gi, 3Gi, 3.5Gi and 4Gi. When there's a workload profile specified, there's no such constraint.\n - name - (Required) The name of the container\n\n ---\n env block supports the following:\n - name - (Required) The name of the environment variable for the container.\n - secret_name - (Optional) The name of the secret that contains the value for this environment variable.\n - value - (Optional) The value for this environment variable.\n\n ---\n volume_mounts block supports the following:\n - name - (Required) The name of the Volume to be mounted in the container.\n - path - (Required) The path in the container at which to mount this volume.\n\n ---\n tcp_scale_rule block supports the following:\n - concurrent_requests - (Required)\n - name - (Required) The name of the Scaling Rule\n\n ---\n authentication block supports the following:\n - secret_name - (Required) The name of the Container App Secret to use for this Scale Rule Authentication.\n - trigger_parameter - (Required) The Trigger Parameter name to use the supply the value retrieved from the secret_name.\n\n ---\n volume block supports the following:\n - name - (Required) The name of the volume.\n - storage_name - (Optional) The name of the AzureFile storage.\n - storage_type - (Optional) The type of storage volume. Possible values are AzureFile, EmptyDir and Secret. Defaults to EmptyDir.\n"
  type = object({
    cooldown_period = optional(number, 300)
    max_replicas    = optional(number, 10)
    #TODO:Set `min_replicas` default value to `0` in `v1.0.0`
    min_replicas     = optional(number)
    polling_interval = optional(number, 30)
    revision_suffix  = optional(string)
    #TODO:Set `termination_grace_period_seconds` default value to `0` in `v1.0.0`
    termination_grace_period_seconds = optional(number)

    azure_queue_scale_rules = optional(list(object({
      name         = string
      queue_length = number
      queue_name   = string
      account_name = optional(string)
      identity     = optional(string)
      authentication = list(object({
        secret_name       = string
        trigger_parameter = string
      }))
    })))
    containers = list(object({
      args    = optional(list(string))
      command = optional(list(string))
      cpu     = number
      image   = string
      memory  = string
      name    = string
      env = optional(list(object({
        name        = string
        secret_name = optional(string)
        value       = optional(string)
      })))
      liveness_probes = optional(list(object({
        failure_count_threshold          = optional(number, 3)
        host                             = optional(string)
        initial_delay                    = optional(number, 1)
        interval_seconds                 = optional(number, 10)
        path                             = optional(string)
        port                             = number
        termination_grace_period_seconds = optional(number)
        timeout                          = optional(number, 1)
        transport                        = string
        header = optional(list(object({
          name  = string
          value = string
        })))
      })))
      readiness_probes = optional(list(object({
        failure_count_threshold = optional(number, 3)
        host                    = optional(string)
        initial_delay           = optional(number, 0)
        interval_seconds        = optional(number, 10)
        path                    = optional(string)
        port                    = number
        success_count_threshold = optional(number, 3)
        timeout                 = optional(number, 1)
        transport               = string
        header = optional(list(object({
          name  = string
          value = string
        })))
      })))
      #TODO:Remove startup_probe in v1.0.0
      startup_probe = optional(list(object({
        failure_count_threshold          = optional(number, 3)
        host                             = optional(string)
        initial_delay                    = optional(number, 0)
        interval_seconds                 = optional(number, 10)
        path                             = optional(string)
        port                             = number
        termination_grace_period_seconds = optional(number)
        timeout                          = optional(number, 1)
        transport                        = string
        header = optional(list(object({
          name  = string
          value = string
        })))
      })))
      startup_probes = optional(list(object({
        failure_count_threshold          = optional(number, 3)
        host                             = optional(string)
        initial_delay                    = optional(number, 0)
        interval_seconds                 = optional(number, 10)
        path                             = optional(string)
        port                             = number
        termination_grace_period_seconds = optional(number)
        timeout                          = optional(number, 1)
        transport                        = string
        header = optional(list(object({
          name  = string
          value = string
        })))
      })))
      volume_mounts = optional(list(object({
        name     = string
        path     = string
        sub_path = optional(string)
      })))
    }))
    custom_scale_rules = optional(list(object({
      custom_rule_type = string
      metadata         = map(string)
      name             = string
      identity         = optional(string)
      authentication = optional(list(object({
        secret_name       = string
        trigger_parameter = string
      })))
    })))
    http_scale_rules = optional(list(object({
      concurrent_requests = string
      name                = string
      identity            = optional(string)
      metadata            = optional(map(string))
      authentication = optional(list(object({
        secret_name       = string
        trigger_parameter = optional(string)
      })))
    })))
    init_containers = optional(list(object({
      args    = optional(list(string))
      command = optional(list(string))
      cpu     = optional(number)
      image   = string
      memory  = optional(string)
      name    = string
      env = optional(list(object({
        name        = string
        secret_name = optional(string)
        value       = optional(string)
      })))
      volume_mounts = optional(list(object({
        name     = string
        path     = string
        sub_path = optional(string)
      })))
    })))

    service_binds = optional(list(object({
      name       = string
      service_id = string
    })))

    tcp_scale_rules = optional(list(object({
      concurrent_requests = string
      name                = string
      identity            = optional(string)
      metadata            = optional(map(string))
      authentication = optional(list(object({
        secret_name       = string
        trigger_parameter = optional(string)
      })))
    })))
    volumes = optional(list(object({
      mount_options = optional(string)
      name          = string
      secrets = optional(list(object({
        path        = string
        secret_name = string
      })))
      storage_name = optional(string)
      storage_type = optional(string, "EmptyDir")
    })))
  })
  default = ""
}

variable "timeouts" {
  description = "- create - (Defaults to 30 minutes) Used when creating the Container App. Defaults to 30m.\n- delete - (Defaults to 30 minutes) Used when deleting the Container App. Defaults to 30m.\n- read - (Defaults to 5 minutes) Used when retrieving the Container App. Defaults to 5m.\n- update - (Defaults to 30 minutes) Used when updating the Container App. Defaults to 30m.\n"
  type = object({
    create = optional(string, "30m")
    delete = optional(string, "30m")
    read   = optional(string, "5m")
    update = optional(string, "30m")
  })
  default = null
}

variable "workload_profile_name" {
  description = "Workload profile name to pin for container app execution.  If not set, workload profiles are not used."
  type        = string
  default     = null
}
