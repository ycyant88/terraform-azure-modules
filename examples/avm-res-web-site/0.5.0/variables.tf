variable "all_child_resources_inherit_lock" {
  description = "Should the Function App inherit the lock from the parent resource? Defaults to true."
  type        = bool
  default     = true
}

variable "all_child_resources_inherit_tags" {
  description = "Should the Function App inherit tags from the parent resource? Defaults to true."
  type        = bool
  default     = true
}

variable "app_settings" {
  description = "  A map of key-value pairs for [App Settings](https://docs.microsoft.com/en-us/azure/azure-functions/functions-app-settings) and custom values to assign to the Function App. \n  \n  terraform\n  app_settings = {\n    WEBSITE_NODE_DEFAULT_VERSION = \"10.14.1\"\n    WEBSITE_TIME_ZONE            = \"Pacific Standard Time\"\n    WEB_CONCURRENCY              = \"1\"\n    WEBSITE_RUN_FROM_PACKAGE     = \"1\"\n    WEBSITE_ENABLE_SYNC_UPDATE_SITE = \"true\"\n    WEBSITE_ENABLE_SYNC_UPDATE_SITE_LOCKED = \"false\"\n    WEBSITE_NODE_DEFAULT_VERSION_LOCKED = \"false\"\n    WEBSITE_TIME_ZONE_LOCKED = \"false\"\n    WEB_CONCURRENCY_LOCKED = \"false\"\n    WEBSITE_RUN_FROM_PACKAGE_LOCKED = \"false\"\n  }\n  \n"
  type        = map(string)
  default     = {}
}

variable "application_insights" {
  description = "\n  The Application Insights settings to assign to the Function App.\n\n"
  type = object({
    application_type                      = optional(string, "web")
    inherit_tags                          = optional(bool, false)
    location                              = optional(string)
    name                                  = optional(string)
    resource_group_name                   = optional(string)
    tags                                  = optional(map(any), null)
    workspace_resource_id                 = optional(string)
    daily_data_cap_in_gb                  = optional(number)
    daily_data_cap_notifications_disabled = optional(bool)
    retention_in_days                     = optional(number, 90)
    sampling_percentage                   = optional(number, 100)
    disable_ip_masking                    = optional(bool, false)
    local_authentication_disabled         = optional(bool, false)
    internet_ingestion_enabled            = optional(bool, true)
    internet_query_enabled                = optional(bool, true)
    force_customer_storage_for_profiler   = optional(bool, false)
  })
  default = {}
}

variable "auth_settings" {
  description = "  A map of authentication settings to assign to the Function App. \n - additional_login_parameters - (Optional) Specifies a map of login Parameters to send to the OpenID Connect authorization endpoint when a user logs in.\n - allowed_external_redirect_urls - (Optional) Specifies a list of External URLs that can be redirected to as part of logging in or logging out of the Linux Web App.\n - default_provider - (Optional) The default authentication provider to use when multiple providers are configured. Possible values include: AzureActiveDirectory, Facebook, Google, MicrosoftAccount, Twitter, Github\n - enabled - (Required) Should the Authentication / Authorization feature be enabled for the Linux Web App?\n - issuer - (Optional) The OpenID Connect Issuer URI that represents the entity which issues access tokens for this Linux Web App.\n - runtime_version - (Optional) The RuntimeVersion of the Authentication / Authorization feature in use for the Linux Web App.\n - token_refresh_extension_hours - (Optional) The number of hours after session token expiration that a session token can be used to call the token refresh API. Defaults to 72 hours.\n - token_store_enabled - (Optional) Should the Linux Web App durably store platform-specific security tokens that are obtained during login flows? Defaults to false.\n - unauthenticated_client_action - (Optional) The action to take when an unauthenticated client attempts to access the app. Possible values include: RedirectToLoginPage, AllowAnonymous.\n\n ---\n active_directory block supports the following:\n - allowed_audiences - (Optional) Specifies a list of Allowed audience values to consider when validating JWTs issued by Azure Active Directory.\n - client_id - (Required) The ID of the Client to use to authenticate with Azure Active Directory.\n - client_secret - (Optional) The Client Secret for the Client ID. Cannot be used with client_secret_setting_name.\n - client_secret_setting_name - (Optional) The App Setting name that contains the client secret of the Client. Cannot be used with client_secret.\n\n ---\n facebook block supports the following:\n - app_id - (Required) The App ID of the Facebook app used for login.\n - app_secret - (Optional) The App Secret of the Facebook app used for Facebook login. Cannot be specified with app_secret_setting_name.\n - app_secret_setting_name - (Optional) The app setting name that contains the app_secret value used for Facebook login. Cannot be specified with app_secret.\n - oauth_scopes - (Optional) Specifies a list of OAuth 2.0 scopes to be requested as part of Facebook login authentication.\n\n ---\n github block supports the following:\n - client_id - (Required) The ID of the GitHub app used for login.\n - client_secret - (Optional) The Client Secret of the GitHub app used for GitHub login. Cannot be specified with client_secret_setting_name.\n - client_secret_setting_name - (Optional) The app setting name that contains the client_secret value used for GitHub login. Cannot be specified with client_secret.\n - oauth_scopes - (Optional) Specifies a list of OAuth 2.0 scopes that will be requested as part of GitHub login authentication.\n\n ---\n google block supports the following:\n - client_id - (Required) The OpenID Connect Client ID for the Google web application.\n - client_secret - (Optional) The client secret associated with the Google web application. Cannot be specified with client_secret_setting_name.\n - client_secret_setting_name - (Optional) The app setting name that contains the client_secret value used for Google login. Cannot be specified with client_secret.\n - oauth_scopes - (Optional) Specifies a list of OAuth 2.0 scopes that will be requested as part of Google Sign-In authentication. If not specified, openid, profile, and email are used as default scopes.\n\n ---\n microsoft block supports the following:\n - client_id - (Required) The OAuth 2.0 client ID that was created for the app used for authentication.\n - client_secret - (Optional) The OAuth 2.0 client secret that was created for the app used for authentication. Cannot be specified with client_secret_setting_name.\n - client_secret_setting_name - (Optional) The app setting name containing the OAuth 2.0 client secret that was created for the app used for authentication. Cannot be specified with client_secret.\n - oauth_scopes - (Optional) Specifies a list of OAuth 2.0 scopes that will be requested as part of Microsoft Account authentication. If not specified, wl.basic is used as the default scope.\n\n ---\n twitter block supports the following:\n - consumer_key - (Required) The OAuth 1.0a consumer key of the Twitter application used for sign-in.\n - consumer_secret - (Optional) The OAuth 1.0a consumer secret of the Twitter application used for sign-in. Cannot be specified with consumer_secret_setting_name.\n - consumer_secret_setting_name - (Optional) The app setting name that contains the OAuth 1.0a consumer secret of the Twitter application used for sign-in. Cannot be specified with consumer_secret.\n  \n  terraform\n  auth_settings = {\n    example = {\n      enabled = true\n      active_directory = {\n        client_id                  = \"00000000-0000-0000-0000-000000000000\"\n        allowed_audiences          = [\"00000000-0000-0000-0000-000000000000\"]\n        client_secret              = \"00000000-0000-0000-0000-000000000000\"\n        client_secret_setting_name = \"00000000-0000-0000-0000-000000000000\"\n      }\n    }\n  }\n  \n"
  type = map(object({
    additional_login_parameters    = optional(list(string))
    allowed_external_redirect_urls = optional(list(string))
    default_provider               = optional(string)
    enabled                        = optional(bool, false)
    issuer                         = optional(string)
    runtime_version                = optional(string)
    token_refresh_extension_hours  = optional(number, 72)
    token_store_enabled            = optional(bool, false)
    unauthenticated_client_action  = optional(string)
    active_directory = optional(map(object({
      client_id                  = optional(string)
      allowed_audiences          = optional(list(string))
      client_secret              = optional(string)
      client_secret_setting_name = optional(string)
    })))
    facebook = optional(map(object({
      app_id                  = optional(string)
      app_secret              = optional(string)
      app_secret_setting_name = optional(string)
      oauth_scopes            = optional(list(string))
    })))
    github = optional(map(object({
      client_id                  = optional(string)
      client_secret              = optional(string)
      client_secret_setting_name = optional(string)
      oauth_scopes               = optional(list(string))
    })))
    google = optional(map(object({
      client_id                  = optional(string)
      client_secret              = optional(string)
      client_secret_setting_name = optional(string)
      oauth_scopes               = optional(list(string))
    })))
    microsoft = optional(map(object({
      client_id                  = optional(string)
      client_secret              = optional(string)
      client_secret_setting_name = optional(string)
      oauth_scopes               = optional(list(string))
    })))
    twitter = optional(map(object({
      consumer_key                 = optional(string)
      consumer_secret              = optional(string)
      consumer_secret_setting_name = optional(string)
    })))
  }))
  default = {}
}

variable "auth_settings_v2" {
  description = "A map of authentication settings (V2) to assign to the Function App.\n    \n- auth_enabled - (Optional) Should the AuthV2 Settings be enabled. Defaults to false.\n- config_file_path - (Optional) The path to the App Auth settings.\n- default_provider - (Optional) The Default Authentication Provider to use when the unauthenticated_action is set to RedirectToLoginPage. Possible values include: apple, azureactivedirectory, facebook, github, google, twitter and the name of your custom_oidc_v2 provider.\n- excluded_paths - (Optional) The paths which should be excluded from the unauthenticated_action when it is set to RedirectToLoginPage.\n- forward_proxy_convention - (Optional) The convention used to determine the url of the request made. Possible values include NoProxy, Standard, Custom. Defaults to NoProxy.\n- forward_proxy_custom_host_header_name - (Optional) The name of the custom header containing the host of the request.\n- forward_proxy_custom_scheme_header_name - (Optional) The name of the custom header containing the scheme of the request.\n- http_route_api_prefix - (Optional) The prefix that should precede all the authentication and authorisation paths. Defaults to /.auth.\n- require_authentication - (Optional) Should the authentication flow be used for all requests.\n- require_https - (Optional) Should HTTPS be required on connections? Defaults to true.\n- runtime_version - (Optional) The Runtime Version of the Authentication and Authorisation feature of this App. Defaults to ~1.\n- unauthenticated_action - (Optional) The action to take for requests made without authentication. Possible values include RedirectToLoginPage, AllowAnonymous, Return401, and Return403. Defaults to RedirectToLoginPage.\n\n---\nactive_directory_v2 block supports the following:\n- allowed_applications - (Optional) The list of allowed Applications for the Default Authorisation Policy.\n- allowed_audiences - (Optional) Specifies a list of Allowed audience values to consider when validating JWTs issued by Azure Active Directory.\n- allowed_groups - (Optional) The list of allowed Group Names for the Default Authorisation Policy.\n- allowed_identities - (Optional) The list of allowed Identities for the Default Authorisation Policy.\n- client_id - (Required) The ID of the Client to use to authenticate with Azure Active Directory.\n- client_secret_certificate_thumbprint - (Optional) The thumbprint of the certificate used for signing purposes.\n- client_secret_setting_name - (Optional) The App Setting name that contains the client secret of the Client.\n- jwt_allowed_client_applications - (Optional) A list of Allowed Client Applications in the JWT Claim.\n- jwt_allowed_groups - (Optional) A list of Allowed Groups in the JWT Claim.\n- login_parameters - (Optional) A map of key-value pairs to send to the Authorisation Endpoint when a user logs in.\n- tenant_auth_endpoint - (Required) The Azure Tenant Endpoint for the Authenticating Tenant. e.g. https://login.microsoftonline.com/v2.0/{tenant-guid}/\n- www_authentication_disabled - (Optional) Should the www-authenticate provider should be omitted from the request? Defaults to false.\n\n---\napple_v2 block supports the following:\n- client_id - (Required) The OpenID Connect Client ID for the Apple web application.\n- client_secret_setting_name - (Required) The app setting name that contains the client_secret value used for Apple Login.\n\n---\nazure_static_web_app_v2 block supports the following:\n- client_id - (Required) The ID of the Client to use to authenticate with Azure Static Web App Authentication.\n\n---\ncustom_oidc_v2 block supports the following:\n- client_id - (Required) The ID of the Client to use to authenticate with the Custom OIDC.\n- name - (Required) The name of the Custom OIDC Authentication Provider.\n- name_claim_type - (Optional) The name of the claim that contains the users name.\n- openid_configuration_endpoint - (Required) The app setting name that contains the client_secret value used for the Custom OIDC Login.\n- scopes - (Optional) The list of the scopes that should be requested while authenticating.\n\n---\nfacebook_v2 block supports the following:\n- app_id - (Required) The App ID of the Facebook app used for login.\n- app_secret_setting_name - (Required) The app setting name that contains the app_secret value used for Facebook Login.\n- graph_api_version - (Optional) The version of the Facebook API to be used while logging in.\n- login_scopes - (Optional) The list of scopes that should be requested as part of Facebook Login authentication.\n\n---\ngithub_v2 block supports the following:\n- client_id - (Required) The ID of the GitHub app used for login..\n- client_secret_setting_name - (Required) The app setting name that contains the client_secret value used for GitHub Login.\n- login_scopes - (Optional) The list of OAuth 2.0 scopes that should be requested as part of GitHub Login authentication.\n\n---\ngoogle_v2 block supports the following:\n- allowed_audiences - (Optional) Specifies a list of Allowed Audiences that should be requested as part of Google Sign-In authentication.\n- client_id - (Required) The OpenID Connect Client ID for the Google web application.\n- client_secret_setting_name - (Required) The app setting name that contains the client_secret value used for Google Login.\n- login_scopes - (Optional) The list of OAuth 2.0 scopes that should be requested as part of Google Sign-In authentication.\n\n---\nlogin block supports the following:\n- allowed_external_redirect_urls - (Optional) External URLs that can be redirected to as part of logging in or logging out of the app. This is an advanced setting typically only needed by Windows Store application backends.\n- cookie_expiration_convention - (Optional) The method by which cookies expire. Possible values include: FixedTime, and IdentityProviderDerived. Defaults to FixedTime.\n- cookie_expiration_time - (Optional) The time after the request is made when the session cookie should expire. Defaults to 08:00:00.\n- logout_endpoint - (Optional) The endpoint to which logout requests should be made.\n- nonce_expiration_time - (Optional) The time after the request is made when the nonce should expire. Defaults to 00:05:00.\n- preserve_url_fragments_for_logins - (Optional) Should the fragments from the request be preserved after the login request is made. Defaults to false.\n- token_refresh_extension_time - (Optional) The number of hours after session token expiration that a session token can be used to call the token refresh API. Defaults to 72 hours.\n- token_store_enabled - (Optional) Should the Token Store configuration Enabled. Defaults to false\n- token_store_path - (Optional) The directory path in the App Filesystem in which the tokens will be stored.\n- token_store_sas_setting_name - (Optional) The name of the app setting which contains the SAS URL of the blob storage containing the tokens.\n- validate_nonce - (Optional) Should the nonce be validated while completing the login flow. Defaults to true.\n\n---\nmicrosoft_v2 block supports the following:\n- allowed_audiences - (Optional) Specifies a list of Allowed Audiences that will be requested as part of Microsoft Sign-In authentication.\n- client_id - (Required) The OAuth 2.0 client ID that was created for the app used for authentication.\n- client_secret_setting_name - (Required) The app setting name containing the OAuth 2.0 client secret that was created for the app used for authentication.\n- login_scopes - (Optional) The list of Login scopes that should be requested as part of Microsoft Account authentication.\n\n---\ntwitter_v2 block supports the following:\n- consumer_key - (Required) The OAuth 1.0a consumer key of the Twitter application used for sign-in.\n- consumer_secret_setting_name - (Required) The app setting name that contains the OAuth 1.0a consumer secret of the Twitter application used for sign-in.\n\nterraform\nauth_settings_v2 = {\n  example = {\n    auth_enabled = true\n    active_directory_v2 = {\n      client_id                  = \"00000000-0000-0000-0000-000000000000\"\n      client_secret_setting_name = \"00000000-0000-0000-0000-000000000000\"\n      login_scopes               = [\"00000000-0000-0000-0000-000000000000\"]\n    }\n  }\n}\n\n\n"
  type = map(object({
    auth_enabled                            = optional(bool, false)
    config_file_path                        = optional(string)
    default_provider                        = optional(string)
    excluded_paths                          = optional(list(string))
    forward_proxy_convention                = optional(string, "NoProxy")
    forward_proxy_custom_host_header_name   = optional(string)
    forward_proxy_custom_scheme_header_name = optional(string)
    http_route_api_prefix                   = optional(string, "/.auth")
    require_authentication                  = optional(bool, false)
    require_https                           = optional(bool, true)
    runtime_version                         = optional(string, "~1")
    unauthenticated_action                  = optional(string, "RedirectToLoginPage")
    active_directory_v2 = optional(map(object({
      allowed_applications                 = optional(list(string))
      allowed_audiences                    = optional(list(string))
      allowed_groups                       = optional(list(string))
      allowed_identities                   = optional(list(string))
      client_id                            = optional(string)
      client_secret_certificate_thumbprint = optional(string)
      client_secret_setting_name           = optional(string)
      jwt_allowed_client_applications      = optional(list(string))
      jwt_allowed_groups                   = optional(list(string))
      login_parameters                     = optional(map(any))
      tenant_auth_endpoint                 = optional(string)
      www_authentication_disabled          = optional(bool, false)
    })))
    apple_v2 = optional(map(object({
      client_id                  = optional(string)
      client_secret_setting_name = optional(string)
      login_scopes               = optional(list(string))
    })))
    azure_static_web_app_v2 = optional(map(object({
      client_id = optional(string)
    })))
    custom_oidc_v2 = optional(map(object({
      authorization_endpoint        = optional(string)
      certification_uri             = optional(string)
      client_credential_method      = optional(string)
      client_id                     = optional(string)
      client_secret_setting_name    = optional(string)
      issuer_endpoint               = optional(string)
      name                          = optional(string)
      name_claim_type               = optional(string)
      openid_configuration_endpoint = optional(string)
      scopes                        = optional(list(string))
      token_endpoint                = optional(string)
    })))
    facebook_v2 = optional(map(object({
      app_id                  = optional(string)
      app_secret_setting_name = optional(string)
      graph_api_version       = optional(string)
      login_scopes            = optional(list(string))
    })))
    github_v2 = optional(map(object({
      client_id                  = optional(string)
      client_secret_setting_name = optional(string)
      login_scopes               = optional(list(string))
    })))
    google_v2 = optional(map(object({
      client_id                  = optional(string)
      client_secret_setting_name = optional(string)
      allowed_audiences          = optional(list(string))
      login_scopes               = optional(list(string))
    })))
    login = map(object({
      allowed_external_redirect_urls    = optional(list(string))
      cookie_expiration_convention      = optional(string, "FixedTime")
      cookie_expiration_time            = optional(string, "00:00:00")
      logout_endpoint                   = optional(string)
      nonce_expiration_time             = optional(string, "00:05:00")
      preserve_url_fragments_for_logins = optional(bool, false)
      token_refresh_extension_time      = optional(number, 72)
      token_store_enabled               = optional(bool, false)
      token_store_path                  = optional(string)
      token_store_sas_setting_name      = optional(string)
      validate_nonce                    = optional(bool, true)
    }))
    microsoft_v2 = optional(map(object({
      client_id                  = optional(string)
      client_secret_setting_name = optional(string)
      allowed_audiences          = optional(list(string))
      login_scopes               = optional(list(string))
    })))
    twitter_v2 = optional(map(object({
      consumer_key                 = optional(string)
      consumer_secret_setting_name = optional(string)
    })))

  }))
  default = {}
}

variable "auto_heal_setting" {
  description = "\n  Configures the Auto Heal settings for the Function App. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n  - action - (Optional) The action to take when the trigger is activated.\n    - action_type - (Required) The type of action to take. Possible values include: CustomAction, Recycle, LogEvent, HttpRequst.\n    - custom_action - (Optional) The custom action to take when the trigger is activated.\n      - executable - (Required) The executable to run when the trigger is activated.\n      - parameters - (Optional) The parameters to pass to the executable.\n    - minimum_process_execution_time - (Optional) The minimum process execution time before the action is taken. Defaults to 00:00:00.\n  - trigger - (Optional) The trigger to activate the action.\n    - private_memory_kb - (Optional) The private memory in kilobytes to trigger the action.\n    - requests - (Optional) The requests trigger to activate the action.\n      - count - (Required) The number of requests to trigger the action.\n      - interval - (Required) The interval to trigger the action.\n    - slow_request - (Optional) The slow request trigger to activate the action.\n      - count - (Required) The number of slow requests to trigger the action.\n      - interval - (Required) The interval to trigger the action.\n      - take_taken - (Required) The time taken to trigger the action.\n      - path - (Optional) The path to trigger the action. \n      > NOTE: The path property in the slow_request block is deprecated and will be removed in 4.0 of provider. Please use slow_request_with_path to set a slow request trigger with path specified.\n    - status_code - (Optional) The status code trigger to activate the action.\n      - count - (Required) The number of status codes to trigger the action.\n      - interval - (Required) The interval to trigger the action.\n      - status_code_range - (Required) The status code range to trigger the action.\n      - path - (Optional) The path to trigger the action.\n      - sub_status - (Optional) The sub status to trigger the action.\n      - win32_status_code - (Optional) The Win32 status code to trigger the action.\n\n  terraform\n\n"
  type = map(object({
    action = optional(object({
      action_type = string
      custom_action = optional(object({
        executable = string
        parameters = optional(string)
      }))
      minimum_process_execution_time = optional(string, "00:00:00")
    }))
    trigger = optional(object({
      private_memory_kb = optional(number)
      requests = optional(object({
        count    = number
        interval = string
      }))
      slow_request = optional(map(object({
        count      = number
        interval   = string
        take_taken = string
        path       = optional(string)
      })), {})
      slow_request_with_path = optional(map(object({
        count      = number
        interval   = string
        take_taken = string
        path       = optional(string)
      })), {})
      status_code = optional(map(object({
        count             = number
        interval          = string
        status_code_range = number
        path              = optional(string)
        sub_status        = optional(number)
        win32_status_code = optional(number)
      })), {})
    }))
  }))
  default = {}
}

variable "backup" {
  description = "  A map of backup settings to assign to the Function App.\n  - name - (Optional) The name of the backup. One will be generated if not set.\n  - schedule - (Optional) A map of backup schedule settings.\n    - frequency_interval - (Optional) The frequency interval of the backup.\n    - frequency_unit - (Optional) The frequency unit of the backup.\n    - keep_at_least_one_backup - (Optional) Should at least one backup be kept?.\n    - retention_period_in_days - (Optional) The retention period in days of the backup.\n    - start_time - (Optional) The start time of the backup.\n  - storage_account_url - (Optional) The URL of the Storage Account to store the backup in.\n  - enabled - (Optional) Is the backup enabled? Defaults to true.\n\n  terraform\n  backup = {\n    example = {\n      name               = \"example\"\n      schedule = {\n        frequency_interval       = 1\n        frequency_unit           = \"Day\"\n        keep_at_least_one_backup = true\n        retention_period_in_days = 7\n        start_time               = \"2020-01-01T00:00:00Z\"\n      }\n      storage_account_url = \"https://example.blob.core.windows.net/example\"\n      enabled             = true\n    }\n  }\n  \n"
  type = map(object({
    enabled             = optional(bool, true)
    name                = optional(string)
    storage_account_url = optional(string)
    schedule = optional(map(object({
      frequency_interval       = optional(number)
      frequency_unit           = optional(string)
      keep_at_least_one_backup = optional(bool)
      retention_period_in_days = optional(number)
      start_time               = optional(string)
    })))
  }))
  default = {}
}

variable "builtin_logging_enabled" {
  description = "Should builtin logging be enabled for the Function App?"
  type        = bool
  default     = true
}

variable "client_affinity_enabled" {
  description = "Should client affinity be enabled for the Function App?"
  type        = bool
  default     = false
}

variable "client_certificate_enabled" {
  description = "Should client certificate be enabled for the Function App?"
  type        = bool
  default     = false
}

variable "client_certificate_exclusion_paths" {
  description = "The client certificate exclusion paths for the Function App."
  type        = string
  default     = null
}

variable "client_certificate_mode" {
  description = "The client certificate mode for the Function App."
  type        = string
  default     = "Optional"
}

variable "connection_strings" {
  description = "  A map of connection strings to assign to the Function App.\n  - name - (Optional) The name of the connection string.\n  - type - (Optional) The type of the connection string.\n  - value - (Optional) The value of the connection string.\n  terraform\n  connection_strings = {\n    example = {\n      name  = \"example\"\n      type  = \"example\"\n      value = \"example\"\n    }\n  }\n  \n"
  type = map(object({
    name  = optional(string)
    type  = optional(string)
    value = optional(string)
  }))
  default = {}
}

variable "content_share_force_disabled" {
  description = "Should content share be force disabled for the Function App?"
  type        = bool
  default     = false
}

variable "create_service_plan" {
  description = "Should the module create a new App Service Plan for the Function App?"
  type        = bool
  default     = false
}

variable "custom_domains" {
  description = "  A map of custom domains to assign to the Function App.\n  - create_certificate - (Optional) Should a certificate be created for the custom domain? Defaults to false.\n  - create_txt_records - (Optional) Should TXT records be created for the custom domain? Defaults to false.\n  - create_cname_records - (Optional) Should CNAME records be created for the custom domain? Defaults to false.\n\n  terraform\n  custom_domains = {\n    # Allows for the configuration of custom domains for the Function App\n    # If not already set, the module allows for the creation of TXT and CNAME records\n\n    custom_domain_1 = {\n\n      zone_resource_group_name = \"<zone_resource_group_name>\"\n\n      create_txt_records = true\n      txt_name           = \"asuid.<module.naming.function_app.name_unique>\"\n      txt_zone_name      = \"<zone_name>\"\n      txt_records = {\n        record = {\n          value = \"\" # Leave empty as module will reference Function App ID after Function App creation\n        }\n      }\n\n      create_cname_records = true\n      cname_name           = \"<module.naming.function_app.name_unique>\"\n      cname_zone_name      = \"<zone_name>\"\n      cname_record         = \"<module.naming.function_app.name_unique>-custom-domain.azurewebsites.net\"\n\n      create_certificate   = true\n      certificate_name     = \"<module.naming.function_app.name_unique>-<data.azurerm_key_vault_secret.stored_certificate.name>\"\n      certificate_location = azurerm_resource_group.example.location\n      pfx_blob             = data.azurerm_key_vault_secret.stored_certificate.value\n\n      app_service_name    = \"<module.naming.function_app.name_unique>-custom-domain\"\n      hostname            = \"<module.naming.function_app.name_unique>.<root_domain>\"\n      resource_group_name = azurerm_resource_group.example.name\n      ssl_state           = \"SniEnabled\"\n      thumbprint_key      = \"custom_domain_1\" # Currently the key of the custom domain\n    }\n\n  }\n  \n"
  type = map(object({
    create_certificate           = optional(bool, false)
    certificate_name             = optional(string)
    certificate_location         = optional(string)
    pfx_blob                     = optional(string)
    pfx_password                 = optional(string)
    hostname                     = optional(string)
    app_service_name             = optional(string)
    app_service_plan_resource_id = optional(string)
    key_vault_secret_id          = optional(string)
    zone_resource_group_name     = optional(string)
    resource_group_name          = optional(string)
    ssl_state                    = optional(string)
    inherit_tags                 = optional(bool, true)
    tags                         = optional(map(any), {})
    thumbprint_key               = optional(string)
    ttl                          = optional(number, 300)
    validation_type              = optional(string, "cname-delegation")
    create_cname_records         = optional(bool, false)
    cname_name                   = optional(string)
    cname_zone_name              = optional(string)
    cname_record                 = optional(string)
    cname_target_resource_id     = optional(string)
    create_txt_records           = optional(bool, false)
    txt_name                     = optional(string)
    txt_zone_name                = optional(string)
    txt_records                  = optional(map(object({ value = string })))
  }))
  default = {}
}

variable "daily_memory_time_quota" {
  description = "(Optional) The amount of memory in gigabyte-seconds that your application is allowed to consume per day. Setting this value only affects Function Apps under the consumption plan. Defaults to 0."
  type        = number
  default     = 0
}

variable "diagnostic_settings" {
  description = "  A map of diagnostic settings to create on the Key Vault. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n  - name - (Optional) The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.\n  - log_categories - (Optional) A set of log categories to send to the log analytics workspace. Defaults to [].\n  - log_groups - (Optional) A set of log groups to send to the log analytics workspace. Defaults to [\"allLogs\"].\n  - metric_categories - (Optional) A set of metric categories to send to the log analytics workspace. Defaults to [\"AllMetrics\"].\n  - log_analytics_destination_type - (Optional) The destination type for the diagnostic setting. Possible values are Dedicated and AzureDiagnostics. Defaults to Dedicated. Will resolve to null as Function App / web App does not support Destination Table.\n  - workspace_resource_id - (Optional) The resource ID of the log analytics workspace to send logs and metrics to.\n  - storage_account_resource_id - (Optional) The resource ID of the Storage Account to send logs and metrics to.\n  - event_hub_authorization_rule_resource_id - (Optional) The resource ID of the event hub authorization rule to send logs and metrics to.\n  - event_hub_name - (Optional) The name of the event hub. If none is specified, the default event hub will be selected.\n  - marketplace_partner_resource_id - (Optional) The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic LogsLogs.\n"
  type = map(object({
    name                                     = optional(string, null)
    log_categories                           = optional(set(string), [])
    log_groups                               = optional(set(string), ["allLogs"])
    metric_categories                        = optional(set(string), ["AllMetrics"])
    log_analytics_destination_type           = optional(string, "Dedicated")
    workspace_resource_id                    = optional(string, null)
    storage_account_resource_id              = optional(string, null)
    event_hub_authorization_rule_resource_id = optional(string, null)
    event_hub_name                           = optional(string, null)
    marketplace_partner_resource_id          = optional(string, null)
  }))
  default = {}
}

variable "enable_application_insights" {
  description = "Should Application Insights be enabled for the Function App?"
  type        = bool
  default     = true
}

variable "enable_telemetry" {
  description = "  This variable controls whether or not telemetry is enabled for the module.\n  For more information see <https://aka.ms/avm/telemetryinfo>.\n  If it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "enabled" {
  description = "Is the Function App enabled? Defaults to true."
  type        = bool
  default     = true
}

variable "ftp_publish_basic_authentication_enabled" {
  description = "Should basic authentication be enabled for FTP publish?"
  type        = bool
  default     = true
}

variable "function_app_create_storage_account" {
  description = "Should a Storage Account be created for the Function App?"
  type        = bool
  default     = false
}

variable "function_app_storage_account" {
  description = "  A map of objects that represent a Storage Account to mount to the Function App.\n\n  - name - (Optional) The name of the Storage Account.\n  - resource_group_name - (Optional) The name of the resource group to deploy the Storage Account in.\n\n  terraform\n\n  \n"
  type = object({
    name                = optional(string)
    resource_group_name = optional(string)
  })
  default = {}
}

variable "function_app_storage_account_access_key" {
  description = "The access key of the Storage Account to deploy the Function App in."
  type        = string
  default     = null
}

variable "function_app_storage_account_name" {
  description = "The name of the Storage Account to deploy the Function App in."
  type        = string
  default     = null
}

variable "function_app_storage_uses_managed_identity" {
  description = "Should the Storage Account use a Managed Identity?"
  type        = bool
  default     = false
}

variable "functions_extension_version" {
  description = "The version of the Azure Functions runtime to use. Defaults to ~4."
  type        = string
  default     = "~4"
}

variable "https_only" {
  description = "Should the Function App only be accessible over HTTPS?"
  type        = bool
  default     = false
}

variable "key_vault_reference_identity_id" {
  description = "The identity ID to use for Key Vault references."
  type        = string
  default     = null
}

variable "kind" {
  description = "The type of App Service to deploy. Possible values are functionapp and webapp."
  type        = string
  default     = ""
}

variable "location" {
  description = "Azure region where the resource should be deployed.  If null, the location will be inferred from the resource group location."
  type        = string
  default     = ""
}

variable "lock" {
  description = "The lock level to apply. Possible values for kind are None, CanNotDelete, and ReadOnly."
  type = object({
    kind = string
    name = optional(string, null)

  })
  default = null
}

variable "logs" {
  description = "\nA map of logs to create on the Function App.\n\n\n"
  type = map(object({
    application_logs = optional(map(object({
      azure_blob_storage = optional(object({
        level             = optional(string, "Off")
        retention_in_days = optional(number, 0)
        sas_url           = string
      }))
      file_system_level = optional(string, "Off")
    })), {})
    detailed_error_messages = optional(bool, false)
    failed_request_tracing  = optional(bool, false)
    http_logs = optional(map(object({
      azure_blob_storage_http = optional(object({
        retention_in_days = optional(number, 0)
        sas_url           = string
      }))
      file_system = optional(object({
        retention_in_days = optional(number, 0)
        retention_in_mb   = number
      }))
    })), {})
  }))
  default = {}
}

variable "managed_identities" {
  description = "Managed identities to be created for the resource."
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default = {}
}

variable "name" {
  description = "The name which should be used for the Function App."
  type        = string
  default     = ""
}

variable "new_service_plan" {
  description = "  A map of objects that represent a new App Service Plan to create for the Function App.\n\n  - name - (Optional) The name of the App Service Plan.\n  - resource_group_name - (Optional) The name of the resource group to deploy the App Service Plan in.\n  - location - (Optional) The Azure region where the App Service Plan will be deployed. Defaults to the location of the resource group.\n  - sku_name - (Optional) The SKU name of the App Service Plan. Defaults to B1.\n  - app_service_environment_resource_id - (Optional) The resource ID of the App Service Environment to deploy the App Service Plan in.\n  - maximum_elastic_worker_count - (Optional) The maximum number of workers that can be allocated to this App Service Plan.\n  - worker_count - (Optional) The number of workers to allocate to this App Service Plan.\n  - per_site_scaling_enabled - (Optional) Should per site scaling be enabled for the App Service Plan? Defaults to false.\n  - zone_balancing_enabled - (Optional) Should zone balancing be enabled for the App Service Plan? Changing this forces a new resource to be created.\n  > **NOTE:** If this setting is set to true and the worker_count value is specified, it should be set to a multiple of the number of availability zones in the region. Please see the Azure documentation for the number of Availability Zones in your region.\n"
  type = object({
    name                                = optional(string)
    resource_group_name                 = optional(string)
    location                            = optional(string)
    sku_name                            = optional(string)
    app_service_environment_resource_id = optional(string)
    maximum_elastic_worker_count        = optional(number)
    worker_count                        = optional(number)
    per_site_scaling_enabled            = optional(bool, false)
    zone_balancing_enabled              = optional(bool)
  })
  default = {}
}

variable "os_type" {
  description = "The operating system that should be the same type of the App Service Plan to deploy the Function/Web App in."
  type        = string
  default     = ""
}

variable "private_endpoints" {
  description = "A map of private endpoints to create on this resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- name - (Optional) The name of the private endpoint. One will be generated if not set.\n- role_assignments - (Optional) A map of role assignments to create on the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time. See var.role_assignments for more information.\n- principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating private endpoints if the principal creating the assignment is constrained by RBAC rules that filters on the PrincipalType attribute.\n- lock - (Optional) The lock level to apply to the private endpoint. Default is None. Possible values are None, CanNotDelete, and ReadOnly.\n- tags - (Optional) A mapping of tags to assign to the private endpoint.\n- subnet_resource_id - The resource ID of the subnet to deploy the private endpoint in.\n- private_dns_zone_group_name - (Optional) The name of the private DNS zone group. One will be generated if not set.\n- private_dns_zone_resource_ids - (Optional) A set of resource IDs of private DNS zones to associate with the private endpoint. If not set, no zone groups will be created and the private endpoint will not be associated with any private DNS zones. DNS records must be managed external to this module.\n- application_security_group_resource_ids - (Optional) A map of resource IDs of application security groups to associate with the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n- private_service_connection_name - (Optional) The name of the private service connection. One will be generated if not set.\n- network_interface_name - (Optional) The name of the network interface. One will be generated if not set.\n- location - (Optional) The Azure location where the resources will be deployed. Defaults to the location of the resource group.\n- resource_group_name - (Optional) The resource group where the resources will be deployed. Defaults to the resource group of this resource.\n- ip_configurations - (Optional) A map of IP configurations to create on the private endpoint. If not specified the platform will create one. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  - name - The name of the IP configuration.\n  - private_ip_address - The private IP address of the IP configuration.\n"
  type = map(object({
    name = optional(string, null)
    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
      principal_type                         = optional(string, null)
    })), {})
    lock = optional(object({
      kind = string
      name = optional(string, null)
    }), null)
    tags                                    = optional(map(string), null)
    subnet_resource_id                      = string
    private_dns_zone_group_name             = optional(string, "default")
    private_dns_zone_resource_ids           = optional(set(string), [])
    application_security_group_associations = optional(map(string), {})
    private_service_connection_name         = optional(string, null)
    network_interface_name                  = optional(string, null)
    location                                = optional(string, null)
    resource_group_name                     = optional(string, null)
    ip_configurations = optional(map(object({
      name               = string
      private_ip_address = string
    })), {})
  }))
  default = {}
}

variable "private_endpoints_inherit_lock" {
  description = "Should the private endpoints inherit the lock from the parent resource? Defaults to true."
  type        = bool
  default     = true
}

variable "private_endpoints_manage_dns_zone_group" {
  description = "Whether to manage private DNS zone groups with this module. If set to false, you must manage private DNS zone groups externally, e.g. using Azure Policy."
  type        = bool
  default     = true
}

variable "public_network_access_enabled" {
  description = "Should the Function App be accessible from the public network? Defaults to true."
  type        = bool
  default     = true
}

variable "resource_group_name" {
  description = "The name of the Resource Group where the Function App will be deployed."
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "A map of role assignments to create on this resource. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n- role_definition_id_or_name - The ID or name of the role definition to assign to the principal.\n- principal_id - The ID of the principal to assign the role to.\n- description - The description of the role assignment.\n- skip_service_principal_aad_check - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n- condition - The condition which will be used to scope the role assignment.\n- condition_version - The version of the condition syntax. Valid values are 2.0.\n- delegated_managed_identity_resource_id - (Optional) The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\n- principal_type - (Optional) The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n\n> Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n"
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

variable "service_plan_resource_id" {
  description = "The resource ID of the App Service Plan to deploy the Function App in."
  type        = string
  default     = null
}

variable "site_config" {
  description = "  An object that configures the Function App's site_config block.\n - always_on - (Optional) If this Linux Web App is Always On enabled. Defaults to false.\n - api_definition_url - (Optional) The URL of the API definition that describes this Linux Function App.\n - api_management_api_id - (Optional) The ID of the API Management API for this Linux Function App.\n - app_command_line - (Optional) The App command line to launch.\n - app_scale_limit - (Optional) The number of workers this function app can scale out to. Only applicable to apps on the Consumption and Premium plan.\n - application_insights_connection_string - (Optional) The Connection String for linking the Linux Function App to Application Insights.\n - application_insights_key - (Optional) The Instrumentation Key for connecting the Linux Function App to Application Insights.\n - container_registry_managed_identity_client_id - (Optional) The Client ID of the Managed Service Identity to use for connections to the Azure Container Registry.\n - container_registry_use_managed_identity - (Optional) Should connections for Azure Container Registry use Managed Identity.\n - default_documents - (Optional) Specifies a list of Default Documents for the Linux Web App.\n - elastic_instance_minimum - (Optional) The number of minimum instances for this Linux Function App. Only affects apps on Elastic Premium plans.\n - ftps_state - (Optional) State of FTP / FTPS service for this function app. Possible values include: AllAllowed, FtpsOnly and Disabled. Defaults to Disabled.\n - health_check_eviction_time_in_min - (Optional) The amount of time in minutes that a node can be unhealthy before being removed from the load balancer. Possible values are between 2 and 10. Only valid in conjunction with health_check_path.\n - health_check_path - (Optional) The path to be checked for this function app health.\n - http2_enabled - (Optional) Specifies if the HTTP2 protocol should be enabled. Defaults to false.\n - load_balancing_mode - (Optional) The Site load balancing mode. Possible values include: WeightedRoundRobin, LeastRequests, LeastResponseTime, WeightedTotalTraffic, RequestHash, PerSiteRoundRobin. Defaults to LeastRequests if omitted.\n - managed_pipeline_mode - (Optional) Managed pipeline mode. Possible values include: Integrated, Classic. Defaults to Integrated.\n - minimum_tls_version - (Optional) The configures the minimum version of TLS required for SSL requests. Possible values include: 1.0, 1.1, and 1.2. Defaults to 1.2.\n - pre_warmed_instance_count - (Optional) The number of pre-warmed instances for this function app. Only affects apps on an Elastic Premium plan.\n - remote_debugging_enabled - (Optional) Should Remote Debugging be enabled. Defaults to false.\n - remote_debugging_version - (Optional) The Remote Debugging Version. Possible values include VS2017, VS2019, and VS2022.\n - runtime_scale_monitoring_enabled - (Optional) Should Scale Monitoring of the Functions Runtime be enabled?\n - scm_minimum_tls_version - (Optional) Configures the minimum version of TLS required for SSL requests to the SCM site Possible values include: 1.0, 1.1, and 1.2. Defaults to 1.2.\n - scm_use_main_ip_restriction - (Optional) Should the Linux Function App ip_restriction configuration be used for the SCM also.\n - use_32_bit_worker - (Optional) Should the Linux Web App use a 32-bit worker process. Defaults to false.\n - vnet_route_all_enabled - (Optional) Should all outbound traffic to have NAT Gateways, Network Security Groups and User Defined Routes applied? Defaults to false.\n - websockets_enabled - (Optional) Should Web Sockets be enabled. Defaults to false.\n - worker_count - (Optional) The number of Workers for this Linux Function App.\n\n ---\n app_service_logs block supports the following:\n - disk_quota_mb - (Optional) The amount of disk space to use for logs. Valid values are between 25 and 100. Defaults to 35.\n - retention_period_days - (Optional) The retention period for logs in days. Valid values are between 0 and 99999.(never delete).\n\n ---\n application_stack block supports the following:\n - dotnet_version - (Optional) The version of .NET to use. Possible values include 3.1, 6.0, 7.0 and 8.0.\n - java_version - (Optional) The Version of Java to use. Supported versions include 8, 11 & 17.\n - node_version - (Optional) The version of Node to run. Possible values include 12, 14, 16 and 18.\n - powershell_core_version - (Optional) The version of PowerShell Core to run. Possible values are 7, and 7.2.\n - python_version - (Optional) The version of Python to run. Possible values are 3.12, 3.11, 3.10, 3.9, 3.8 and 3.7.\n - go_version - (Optional) The version of Go to use. Possible values are 1.18, and 1.19.\n - ruby_version - (Optional) The version of Ruby to use. Possible values are 2.6, and 2.7.\n - java_server - (Optional) The Java server type. Possible values are JAVA, TOMCAT, and JBOSSEAP.\n - java_server_version - (Optional) The version of the Java server to use.\n - php_version - (Optional) The version of PHP to use. Possible values are 7.4, 8.0, 8.1, and 8.2.\n - use_custom_runtime - (Optional) Should the Linux Function App use a custom runtime?\n - use_dotnet_isolated_runtime - (Optional) Should the DotNet process use an isolated runtime. Defaults to false.\n\n ---\n docker block supports the following:\n - image_name - (Required) The name of the Docker image to use.\n - image_tag - (Required) The image tag of the image to use.\n - registry_password - (Optional) The password for the account to use to connect to the registry.\n - registry_url - (Required) The URL of the docker registry.\n - registry_username - (Optional) The username to use for connections to the registry.\n\n ---\n cors block supports the following:\n - allowed_origins - (Optional) Specifies a list of origins that should be allowed to make cross-origin calls.\n - support_credentials - (Optional) Are credentials allowed in CORS requests? Defaults to false.\n\n ---\n ip_restriction block supports the following:\n - action - (Optional) The action to take. Possible values are Allow or Deny. Defaults to Allow.\n - ip_address - (Optional) The CIDR notation of the IP or IP Range to match. For example: 10.0.0.0/24 or 192.168.10.1/32\n - name - (Optional) The name which should be used for this ip_restriction.\n - priority - (Optional) The priority value of this ip_restriction. Defaults to 65000.\n - service_tag - (Optional) The Service Tag used for this IP Restriction.\n - virtual_network_subnet_id - (Optional) The Virtual Network Subnet ID used for this IP Restriction.\n\n ---\n headers block supports the following:\n - x_azure_fdid - (Optional) Specifies a list of Azure Front Door IDs.\n - x_fd_health_probe - (Optional) Specifies if a Front Door Health Probe should be expected. The only possible value is 1.\n - x_forwarded_for - (Optional) Specifies a list of addresses for which matching should be applied. Omitting this value means allow any.\n - x_forwarded_host - (Optional) Specifies a list of Hosts for which matching should be applied.\n\n ---\n scm_ip_restriction block supports the following:\n - action - (Optional) The action to take. Possible values are Allow or Deny. Defaults to Allow.\n - ip_address - (Optional) The CIDR notation of the IP or IP Range to match. For example: 10.0.0.0/24 or 192.168.10.1/32\n - name - (Optional) The name which should be used for this ip_restriction.\n - priority - (Optional) The priority value of this ip_restriction. Defaults to 65000.\n - service_tag - (Optional) The Service Tag used for this IP Restriction.\n - virtual_network_subnet_id - (Optional) The Virtual Network Subnet ID used for this IP Restriction.\n\n ---\n headers block supports the following:\n - x_azure_fdid - (Optional) Specifies a list of Azure Front Door IDs.\n - x_fd_health_probe - (Optional) Specifies if a Front Door Health Probe should be expected. The only possible value is 1.\n - x_forwarded_for - (Optional) Specifies a list of addresses for which matching should be applied. Omitting this value means allow any.\n - x_forwarded_host - (Optional) Specifies a list of Hosts for which matching should be applied.\n\n"
  type = object({
    always_on                                     = optional(bool, false) # when running in a Consumption or Premium Plan, `always_on` feature should be turned off. Please turn it off before upgrading the service plan from standard to premium.
    api_definition_url                            = optional(string)      # (Optional) The URL of the OpenAPI (Swagger) definition that provides schema for the function's HTTP endpoints.
    api_management_api_id                         = optional(string)      # (Optional) The API Management API identifier.
    app_command_line                              = optional(string)      # (Optional) The command line to launch the application.
    auto_heal_enabled                             = optional(bool)        # (Optional) Should auto-heal be enabled for the Function App?
    app_scale_limit                               = optional(number)      # (Optional) The maximum number of workers that the Function App can scale out to.
    application_insights_connection_string        = optional(string)      # (Optional) The connection string of the Application Insights resource to send telemetry to.
    application_insights_key                      = optional(string)      # (Optional) The instrumentation key of the Application Insights resource to send telemetry to.
    container_registry_managed_identity_client_id = optional(string)
    container_registry_use_managed_identity       = optional(bool)
    default_documents                             = optional(list(string))            #(Optional) Specifies a list of Default Documents for the Windows Function App.
    elastic_instance_minimum                      = optional(number)                  #(Optional) The number of minimum instances for this Windows Function App. Only affects apps on Elastic Premium plans.
    ftps_state                                    = optional(string, "Disabled")      #(Optional) State of FTP / FTPS service for this Windows Function App. Possible values include: AllAllowed, FtpsOnly and Disabled. Defaults to Disabled.
    health_check_eviction_time_in_min             = optional(number)                  #(Optional) The amount of time in minutes that a node can be unhealthy before being removed from the load balancer. Possible values are between 2 and 10. Only valid in conjunction with health_check_path.
    health_check_path                             = optional(string)                  #(Optional) The path to be checked for this Windows Function App health.
    http2_enabled                                 = optional(bool, false)             #(Optional) Specifies if the HTTP2 protocol should be enabled. Defaults to false.
    ip_restriction_default_action                 = optional(string, "Allow")         #(Optional) The default action for IP restrictions. Possible values include: Allow and Deny. Defaults to Allow.
    load_balancing_mode                           = optional(string, "LeastRequests") #(Optional) The Site load balancing mode. Possible values include: WeightedRoundRobin, LeastRequests, LeastResponseTime, WeightedTotalTraffic, RequestHash, PerSiteRoundRobin. Defaults to LeastRequests if omitted.
    local_mysql_enabled                           = optional(bool, false)             #(Optional) Should local MySQL be enabled. Defaults to false.
    managed_pipeline_mode                         = optional(string, "Integrated")    #(Optional) Managed pipeline mode. Possible values include: Integrated, Classic. Defaults to Integrated.
    minimum_tls_version                           = optional(string, "1.2")           #(Optional) Configures the minimum version of TLS required for SSL requests. Possible values include: 1.0, 1.1, and 1.2. Defaults to 1.2.
    pre_warmed_instance_count                     = optional(number)                  #(Optional) The number of pre-warmed instances for this Windows Function App. Only affects apps on an Elastic Premium plan.
    remote_debugging_enabled                      = optional(bool, false)             #(Optional) Should Remote Debugging be enabled. Defaults to false.
    remote_debugging_version                      = optional(string)                  #(Optional) The Remote Debugging Version. Possible values include VS2017, VS2019, and VS2022.
    runtime_scale_monitoring_enabled              = optional(bool)                    #(Optional) Should runtime scale monitoring be enabled.
    scm_ip_restriction_default_action             = optional(string, "Allow")         #(Optional) The default action for SCM IP restrictions. Possible values include: Allow and Deny. Defaults to Allow.
    scm_minimum_tls_version                       = optional(string, "1.2")           #(Optional) Configures the minimum version of TLS required for SSL requests to Kudu. Possible values include: 1.0, 1.1, and 1.2. Defaults to 1.2.
    scm_use_main_ip_restriction                   = optional(bool, false)             #(Optional) Should the SCM use the same IP restrictions as the main site. Defaults to false.
    use_32_bit_worker                             = optional(bool, false)             #(Optional) Should the 32-bit worker process be used. Defaults to false.
    vnet_route_all_enabled                        = optional(bool, false)             #(Optional) Should all traffic be routed to the virtual network. Defaults to false.
    websockets_enabled                            = optional(bool, false)             #(Optional) Should Websockets be enabled. Defaults to false.
    worker_count                                  = optional(number)                  #(Optional) The number of workers for this Windows Function App. Only affects apps on an Elastic Premium plan.
    app_service_logs = optional(map(object({
      disk_quota_mb         = optional(number, 35)
      retention_period_days = optional(number)
    })), {})
    application_stack = optional(map(object({
      dotnet_version              = optional(string)
      java_version                = optional(string)
      node_version                = optional(string)
      powershell_core_version     = optional(string)
      python_version              = optional(string)
      go_version                  = optional(string)
      ruby_version                = optional(string)
      java_server                 = optional(string)
      java_server_version         = optional(string)
      php_version                 = optional(string)
      use_custom_runtime          = optional(bool)
      use_dotnet_isolated_runtime = optional(bool)
      docker = optional(list(object({
        image_name        = string
        image_tag         = string
        registry_password = optional(string)
        registry_url      = string
        registry_username = optional(string)
      })))
      current_stack                = optional(string)
      docker_image_name            = optional(string)
      docker_registry_url          = optional(string)
      docker_registry_username     = optional(string)
      docker_registry_password     = optional(string)
      docker_container_name        = optional(string)
      docker_container_tag         = optional(string)
      java_embedded_server_enabled = optional(bool)
      tomcat_version               = optional(bool)
    })), {})
    cors = optional(map(object({
      allowed_origins     = optional(list(string))
      support_credentials = optional(bool, false)
    })), {}) #(Optional) A cors block as defined above.
    ip_restriction = optional(map(object({
      action                    = optional(string, "Allow")
      ip_address                = optional(string)
      name                      = optional(string)
      priority                  = optional(number, 65000)
      service_tag               = optional(string)
      virtual_network_subnet_id = optional(string)
      headers = optional(map(object({
        x_azure_fdid      = optional(list(string))
        x_fd_health_probe = optional(number)
        x_forwarded_for   = optional(list(string))
        x_forwarded_host  = optional(list(string))
      })), {})
    })), {}) #(Optional) One or more ip_restriction blocks as defined above.
    scm_ip_restriction = optional(map(object({
      action                    = optional(string, "Allow")
      ip_address                = optional(string)
      name                      = optional(string)
      priority                  = optional(number, 65000)
      service_tag               = optional(string)
      virtual_network_subnet_id = optional(string)
      headers = optional(map(object({
        x_azure_fdid      = optional(list(string))
        x_fd_health_probe = optional(number)
        x_forwarded_for   = optional(list(string))
        x_forwarded_host  = optional(list(string))
      })), {})
    })), {}) #(Optional) One or more scm_ip_restriction blocks as defined above.
    virtual_application = optional(map(object({
      physical_path   = optional(string, "site\\wwwroot")
      preload_enabled = optional(bool, false)
      virtual_directory = optional(map(object({
        physical_path = optional(string)
        virtual_path  = optional(string)
      })), {})
      virtual_path = optional(string, "/")
      })),
      {
        default = {
          physical_path   = "site\\wwwroot"
          preload_enabled = false
          virtual_path    = "/"
        }
    }) #(Optional) One or more virtual_application blocks as defined above.
  })
  default = {}
}

variable "sticky_settings" {
  description = "  A map of sticky settings to assign to the Function App.\n  - app_setting_names - (Optional) A list of app setting names to make sticky.\n  - connection_string_names - (Optional) A list of connection string names to make sticky.\n\n  terraform\n  sticky_settings = {\n    sticky1 = {\n      app_setting_names       = [\"example1\", \"example2\"]\n      connection_string_names = [\"example1\", \"example2\"]\n    }\n  }\n"
  type = map(object({
    app_setting_names       = optional(list(string))
    connection_string_names = optional(list(string))
  }))
  default = {}
}

variable "storage_key_vault_secret_id" {
  description = "The ID of the secret in the key vault to use for the Storage Account access key."
  type        = string
  default     = null
}

variable "storage_shares_to_mount" {
  description = "  A map of objects that represent Storage Account FILE SHARES to mount to the Function App.\n  This functionality is only available for Linux Function Apps, via [documentation](https://learn.microsoft.com/en-us/azure/azure-functions/storage-considerations?tabs=azure-cli)\n\n  The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  - access_key - (Optional) The access key of the Storage Account.\n  - account_name - (Optional) The name of the Storage Account.\n  - name - (Optional) The name of the Storage Account to mount.\n  - share_name - (Optional) The name of the share to mount.\n  - type - (Optional) The type of Storage Account. Currently, only a type of AzureFiles is supported. Defaults to AzureFiles.\n  - mount_path - (Optional) The path to mount the Storage Account to.\n\n  terraform\n  storage_accounts = {\n    storacc1 = {\n      access_key   = \"00000000-0000-0000-0000-000000000000\"\n      account_name = \"example\"\n      name         = \"example\"\n      share_name   = \"example\"\n      type         = \"AzureFiles\"\n      mount_path   = \"/mnt/example\"\n    }\n  }\n  \n"
  type = map(object({
    access_key   = string
    account_name = string
    mount_path   = string
    name         = string
    share_name   = string
    type         = optional(string, "AzureFiles")
  }))
  default = {}
}

variable "tags" {
  description = "The map of tags to be applied to the resource"
  type        = map(string)
  default     = null
}

variable "timeouts" {
  description = "- create - (Defaults to 30 minutes) Used when creating the Linux Function App.\n- delete - (Defaults to 30 minutes) Used when deleting the Linux Function App.\n- read - (Defaults to 5 minutes) Used when retrieving the Linux Function App.\n- update - (Defaults to 30 minutes) Used when updating the Linux Function App.\n"
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default = null
}

variable "virtual_network_subnet_id" {
  description = "The ID of the subnet to deploy the Function App in."
  type        = string
  default     = null
}

variable "webdeploy_publish_basic_authentication_enabled" {
  description = "Should basic authentication be enabled for web deploy?"
  type        = bool
  default     = true
}

variable "zip_deploy_file" {
  description = "The path to the zip file to deploy to the Function App."
  type        = string
  default     = null
}
