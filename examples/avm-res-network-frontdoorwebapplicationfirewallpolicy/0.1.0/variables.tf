variable "custom_block_response_body" {
  description = "Optional. The custom block response body. If the action type is block, customer can override the response body setting this varibale. The body must be specified in base64 encoding"
  type        = string
  default     = null
}

variable "custom_block_response_status_code" {
  description = "Optional. Customer can override the response status code setting this varibale. If a custom rule block's action is block, this is the response status code. Possible values are 200, 403, 405, 406, 429"
  type        = number
  default     = null
}

variable "custom_rules" {
  description = "A list of custom rules to be applied to the WAF (Web Application Firewall) Policy.\n\nEach custom rule object in the list must include:\n\n- **name** (string, required): The name of the custom rule.\n\n- **priority** (number, required): The priority of the custom rule. Lower numbers indicate higher priority.\n\n- **type** (string, required): The type of the custom rule. Must be one of:\n  - \"MatchRule\"\n  - \"RateLimitRule\"\n\n- **action** (string, required): The action to take when the rule matches. Must be one of:\n  - \"Allow\"\n  - \"Block\"\n  - \"Log\"\n  - \"Redirect\"\n\n- **enabled** (bool, optional): Whether the rule is enabled. Defaults to true.\n\n- **rate_limit_duration_in_minutes** (number, optional): The duration of the rate limit in minutes. Required if type is \"RateLimitRule\". Defaults to 1.\n\n- **rate_limit_threshold** (number, optional): The threshold of the rate limit. Required if type is \"RateLimitRule\". Defaults to 10.\n\n- **match_conditions** (list of objects, required): A list of match conditions for the rule.\n\nEach match condition object must include:\n\n- **match_variable** (string, required): The variable to match against. Must be one of:\n  - \"Cookies\"\n  - \"PostArgs\"\n  - \"QueryStrings\"\n  - \"RemoteAddr\"\n  - \"RequestBody\"\n  - \"RequestHeader\"\n  - \"RequestMethod\"\n  - \"RequestUri\"\n  - \"SocketAddr\"\n\n- **operator** (string, required): The comparison type to use for matching with the variable value. Must be one of:\n  - \"Any\"\n  - \"BeginsWith\"\n  - \"Contains\"\n  - \"EndsWith\"\n  - \"Equal\"\n  - \"GeoMatch\"\n  - \"GreaterThan\"\n  - \"GreaterThanOrEqual\"\n  - \"IPMatch\"\n  - \"LessThan\"\n  - \"LessThanOrEqual\"\n  - \"RegEx\"\n\n- **match_values** (list of strings, required): The values to match against. Up to **600** possible values across all match_conditions and match_values in all rules. Each string can be up to **256** characters in length.\n\n- **selector** (string, optional): Required if match_variable is one of \"QueryStrings\", \"PostArgs\", \"RequestHeader\", or \"Cookies\". Specifies the key to match against.\n\n- **negation_condition** (bool, optional): Whether to negate the result of the condition. Defaults to false.\n\n- **transforms** (list of strings, optional): Up to **5** transforms to apply. Each must be one of:\n  - \"Lowercase\"\n  - \"RemoveNulls\"\n  - \"Trim\"\n  - \"Uppercase\"\n  - \"URLDecode\"\n  - \"URLEncode\"\n\n*Example 1: Basic Configuration with Default Rule Set*\nhcl\ncustom_rules = [\n    #custom rule 1\n    {\n      name     = \"RateLimitRule1\"\n      priority = 100\n      type     = \"RateLimitRule\"\n      action   = \"Block\"\n      match_conditions = [{\n        match_variable = \"QueryString\"\n        operator       = \"Contains\"\n        match_values   = [\"promo\"]\n        }\n      ]\n    },\n    #custom rule 2\n    {\n      name     = \"GeographicRule1\"\n      priority = 101\n      type     = \"MatchRule\"\n      action   = \"Block\"\n      match_conditions = [{\n        match_variable = \"RemoteAddr\"\n        operator       = \"GeoMatch\"\n        match_values   = [\"MX\", \"AR\"]\n        },\n        {\n          match_variable = \"RemoteAddr\"\n          operator       = \"IPMatch\"\n          match_values   = [\"10.10.10.0/24\"]\n        }\n      ]\n    }\n]\n\n\n"
  type = list(object({
    name                           = string               # Required
    priority                       = number               # Required
    type                           = string               # Must be "MatchRule" or "RateLimitRule"
    action                         = string               # Must be "Allow", "Block", "Log", "Redirect"
    enabled                        = optional(bool, true) # Default is true
    rate_limit_duration_in_minutes = optional(number, 1)  # Default is 1
    rate_limit_threshold           = optional(number, 10) # Default is 10
    match_conditions = list(object({
      match_variable     = string                     #Required, must be one of these values  "Cookies", "PostArgs", "QueryStrings", "RemoteAddr", "RequestBody" "RequestHeader", "RequestMethod", "RequestUri", "SocketAddr"
      operator           = string                     #(Required) Comparison type to use for matching with the variable value. Possible values are Any, BeginsWith, Contains, EndsWith, Equal, GeoMatch, GreaterThan, GreaterThanOrEqual, IPMatch, LessThan, LessThanOrEqual or RegEx
      match_values       = list(string)               # Required Up to 600 possible values to match. Limit is in total across all match_condition blocks and match_values arguments. String value itself can be up to 256 characters in length
      selector           = optional(string, null)     # (Optional) Match against a specific key if the match_variable is QueryString, PostArgs, RequestHeader or Cookies.
      negation_condition = optional(bool, null)       #(Optional) Should the result of the condition be negated.
      transforms         = optional(list(string), []) #(Optional) Up to 5 transforms to apply. Possible values are Lowercase, RemoveNulls, Trim, Uppercase, URLDecode or URLEncode.
    }))
  }))
  default = []
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see <https://aka.ms/avm/telemetryinfo>.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "enabled" {
  description = "Indicates whether the WAF Policy is enabled or disabled. Default is true."
  type        = bool
  default     = true
}

variable "lock" {
  description = "Controls the Resource Lock configuration for this resource. The following properties can be specified:\n\n- kind - (Required) The type of lock. Possible values are \\\"CanNotDelete\\\" and \\\"ReadOnly\\\".\n- name - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n"
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "managed_rules" {
  description = "The managed_rules variable is a list of managed rule configurations for Azure Web Application Firewall (WAF). It allows you to specify which managed rule sets to apply, customize their actions, and define any exclusions or overrides needed for your application.\n\n**Variable Type**: list(object({ ... }))\n\n---\n\n### Structure of each Managed Rule:\n\n- **type** *(string, Required)*:  \n  Specifies the type of the managed rule set to use. Possible values are:\n  - \"DefaultRuleSet\"\n  - \"Microsoft_DefaultRuleSet\"\n  - \"BotProtection\"\n  - \"Microsoft_BotManagerRuleSet\"\n\n- **action** *(string, Required)*:  \n  The action to perform when the managed rule is matched or when the anomaly score exceeds a certain threshold, depending on the DRS version. Possible values include:\n  - \"Allow\"\n  - \"Log\"\n  - \"Block\"\n  - \"Redirect\"\n\n- **version** *(string, Required)*:  \n  The version of the managed rule set to apply. Available versions depend on the type selected:\n  - For \"DefaultRuleSet\": \"1.0\", \"preview-0.1\"\n  - For \"Microsoft_DefaultRuleSet\": \"1.1\", \"2.0\", \"2.1\"\n  - For \"BotProtection\": \"preview-0.1\"\n  - For \"Microsoft_BotManagerRuleSet\": \"1.0\"\n\n- **exclusions** *(optional, list(object({ ... })))*:  \n  A list of exclusion blocks to specify variables that should be excluded from the managed rule processing.\n\n  - **match_variable** *(string, Required)*:  \n    The type of variable to exclude. Possible values:\n    - \"QueryStringArgNames\"\n    - \"RequestBodyPostArgNames\"\n    - \"RequestCookieNames\"\n    - \"RequestHeaderNames\"\n    - \"RequestBodyJsonArgNames\" *(Available only on DRS 2.0 or later)*\n\n  - **selector** *(string, Required)*:  \n    The specific value within the match_variable to exclude. If operator is \"EqualsAny\", selector must be set to \"*\".\n\n  - **operator** *(string, Required)*:  \n    The comparison operator for the selector. Possible values:\n    - \"Equals\"\n    - \"Contains\"\n    - \"StartsWith\"\n    - \"EndsWith\"\n    - \"EqualsAny\"\n\n- **overrides** *(optional, list(object({ ... })))*:  \n  A list of override blocks to customize specific rule groups or rules within the managed rule set.\n\n  - **rule_group_name** *(string, Required)*:  \n    The name of the rule group to override.\n\n  - **rules** *(optional, list(object({ ... })))*:  \n    A list of rule blocks to override individual rules.\n\n    - **rule_id** *(string, Required)*:  \n      The identifier of the managed rule to override.\n\n    - **enabled** *(bool, Optional, default = false)*:  \n      Indicates whether the managed rule override is enabled.\n\n    - **action** *(string, Required)*:  \n      The action to apply when the rule matches. Possible values depend on the DRS version:\n      - For DRS 1.1 and below: \"Allow\", \"Log\", \"Block\", \"Redirect\"\n      - For DRS 2.0 and above: \"Log\", \"AnomalyScoring\"\n\n    - **exclusions** *(optional, list(object({ ... })))*:  \n      Exclusions specific to this rule, with the same structure as above.\n\n  - **exclusions** *(optional, list(object({ ... })))*:  \n    Exclusions at the rule group level.\n\n---\n\n### Default Value:\n\nhcl\n[\n  # Managed Rule 1 - Microsoft_DefaultRuleSet 2.1\n  {\n    action  = \"Block\"\n    type    = \"Microsoft_DefaultRuleSet\"\n    version = \"2.1\"\n  },\n  # Managed Rule 2 - Microsoft_BotManagerRuleSet 1.1\n  {\n    action  = \"Block\"\n    type    = \"Microsoft_BotManagerRuleSet\"\n    version = \"1.1\"\n  }\n]\n\n*Example 1: Basic Configuration with Default Rule Set*\nhcl\nmanaged_rules = [\n  {\n    type    = \"Microsoft_DefaultRuleSet\"\n    action  = \"Block\"\n    version = \"2.1\"\n  }\n]\n\nThis configuration applies the Microsoft Default Rule Set version 2.1 with a block action for matched rules.\n\n*Example 2: Adding Exclusions*\nhcl\nmanaged_rules = [\n  {\n    type       = \"Microsoft_DefaultRuleSet\"\n    action     = \"Block\"\n    version    = \"2.1\"\n    exclusions = [\n      {\n        match_variable = \"RequestHeaderNames\"\n        selector       = \"User-Agent\"\n        operator       = \"Equals\"\n      },\n      {\n        match_variable = \"QueryStringArgNames\"\n        selector       = \"session_id\"\n        operator       = \"Contains\"\n      }\n    ]\n\n    overrides = [{\n        rule_group_name = \"PHP\"\n        rules = [{\n          rule_id = \"933100\"\n          enabled = false\n          action  = \"AnomalyScoring\"\n          },\n          {\n            rule_id = \"933110\"\n            enabled = true\n            action  = \"AnomalyScoring\"\n        }]\n      }]\n  }\n]\n \n\n"
  type = list(object({
    type    = string                    # (Required) The type of the managed rule. Possible values are "DefaultRuleSet" and "Microsoft_DefaultRuleSet", "BotProtection", "Microsoft_BotManagerRuleSet"
    action  = string                    # (Required) The action to perform for all DRS rules when the managed rule is matched or when the anomaly score is 5 or greater depending on which version of the DRS you are using. Possible values include Allow, Log, Block, and Redirect
    version = string                    # (Required) The version of the managed rule set to use. Possible values depends on which DRS type you are using, for the DefaultRuleSet type the possible values include 1.0 or preview-0.1. For Microsoft_DefaultRuleSet the possible values include 1.1, 2.0 or 2.1. For BotProtection the value must be preview-0.1 and for Microsoft_BotManagerRuleSet the value must be 1.0.
    exclusions = optional(list(object({ # (Optional) A list of Exclusion blocks.
      match_variable = string           # (Required) (Required) The variable type to be excluded. Possible values are QueryStringArgNames, RequestBodyPostArgNames, RequestCookieNames, RequestHeaderNames, RequestBodyJsonArgNames. Important: RequestBodyJsonArgNames is only available on Default Rule Set (DRS) 2.0 or later
      selector       = string           # (Required) Selector for the value in the match_variable attribute this exclusion applies to. selector must be set to * if operator is set to EqualsAny.
      operator       = string           # (Required) Comparison operator to apply to the selector when specifying which elements in the collection this exclusion applies to. Possible values are: Equals, Contains, StartsWith, EndsWith, EqualsAny
    })))

    overrides = optional(list(object({      # (Optional) A list of Override blocks.
      rule_group_name = string              # (Required) The name of the rule group to override.
      rules = optional(list(object({        # (Optional) A list of Rule blocks.
        rule_id = string                    # (Required) Identifier for the managed rule.
        enabled = optional(bool, false)     # (Optional) Is the managed rule override enabled or disabled. Defaults to false
        action  = string                    # (Required) The action to be applied when the managed rule matches or when the anomaly score is 5 or greater. Possible values for DRS 1.1 and below are Allow, Log, Block, and Redirect. For DRS 2.0 and above the possible values are Log or AnomalyScoring.
        exclusions = optional(list(object({ # (Optional) A list of Exclusion blocks.
          match_variable = string           # (Required) (Required) The variable type to be excluded. Possible values are QueryStringArgNames, RequestBodyPostArgNames, RequestCookieNames, RequestHeaderNames, RequestBodyJsonArgNames. Important: RequestBodyJsonArgNames is only available on Default Rule Set (DRS) 2.0 or later
          selector       = string           # (Required) Selector for the value in the match_variable attribute this exclusion applies to. selector must be set to * if operator is set to EqualsAny.
          operator       = string           # (Required) Comparison operator to apply to the selector when specifying which elements in the collection this exclusion applies to. Possible values are: Equals, Contains, StartsWith, EndsWith, EqualsAny
        })))
      })))

      exclusions = optional(list(object({ # (Optional) A list of Exclusion blocks.
        match_variable = string           # (Required) (Required) The variable type to be excluded. Possible values are QueryStringArgNames, RequestBodyPostArgNames, RequestCookieNames, RequestHeaderNames, RequestBodyJsonArgNames. Important: RequestBodyJsonArgNames is only available on Default Rule Set (DRS) 2.0 or later
        selector       = string           # (Required) Selector for the value in the match_variable attribute this exclusion applies to. selector must be set to * if operator is set to EqualsAny.
        operator       = string           # (Required) Comparison operator to apply to the selector when specifying which elements in the collection this exclusion applies to. Possible values are: Equals, Contains, StartsWith, EndsWith, EqualsAny
      })))

    })))
  }))
  default = [{ "action" : "Block", "type" : "Microsoft_DefaultRuleSet", "version" : "2.1" }, { "action" : "Block", "type" : "Microsoft_BotManagerRuleSet", "version" : "1.1" }]
}

variable "mode" {
  description = "The mode of the WAF Policy. Possible values are 'Detection' and 'Prevention'."
  type        = string
  default     = ""
}

variable "name" {
  description = "The name of the this resource."
  type        = string
  default     = ""
}

variable "redirect_url" {
  description = "Optional. The redirect URL for the WAF Policy."
  type        = string
  default     = null
}

variable "request_body_check_enabled" {
  description = "Indicates whether to enable request body check. Default is true."
  type        = bool
  default     = true
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "A map of role definitions and scopes to be assigned as part of this resources implementation.  Two forms are supported. Assignments against this virtual machine resource scope and assignments to external resource scopes using the system managed identity.\n\n- <map key> - Use a custom map key to define each role assignment configuration for this virtual machine\n  - principal_id                               = (optional) - The ID of the Principal (User, Group or Service Principal) to assign the Role Definition to. Changing this forces a new resource to be created.\n  - role_definition_id_or_name                 = (Optional) - The Scoped-ID of the Role Definition or the built-in role name. Changing this forces a new resource to be created. Conflicts with role_definition_name \n  - condition                                  = (Optional) - The condition that limits the resources that the role can be assigned to. Changing this forces a new resource to be created.\n  - condition_version                          = (Optional) - The version of the condition. Possible values are 1.0 or 2.0. Changing this forces a new resource to be created.\n  - description                                = (Optional) - The description for this Role Assignment. Changing this forces a new resource to be created.\n  - skip_service_principal_aad_check           = (Optional) - If the principal_id is a newly provisioned Service Principal set this value to true to skip the Azure Active Directory check which may fail due to replication lag. This argument is only valid if the principal_id is a Service Principal identity. Defaults to false.\n  - delegated_managed_identity_resource_id     = (Optional) - The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created.  \n  - principal_type                             = (Optional) - The type of the principal_id. Possible values are User, Group and ServicePrincipal. It is necessary to explicitly set this attribute when creating role assignments if the principal creating the assignment is constrained by ABAC rules that filters on the PrincipalType attribute.\n\nExample Inputs:\n\nhcl\n#typical assignment example. It is also common for the scope resource ID to be a terraform resource reference like azurerm_resource_group.example.id\nrole_assignments = {\n  role_assignment_1 = {\n    #assign a built-in role to the virtual machine\n    role_definition_id_or_name                 = \"Storage Blob Data Contributor\"\n    principal_id                               = data.azuread_client_config.current.object_id\n    description                                = \"Example for assigning a role to an existing principal for the virtual machine scope\"        \n  }\n}\n\n"
  type = map(object({
    role_definition_id_or_name             = string
    principal_id                           = string
    condition                              = optional(string, null)
    condition_version                      = optional(string, null)
    delegated_managed_identity_resource_id = optional(string, null)
    description                            = optional(string, null)
    principal_type                         = optional(string, null)
    skip_service_principal_aad_check       = optional(bool, false)

    }
  ))
  default = {}
}

variable "sku_name" {
  description = "SKU name of the WAF Policy. Possible values are 'Standard_AzureFrontDoor' and 'Premium_AzureFrontDoor'."
  type        = string
  default     = ""
}

variable "tags" {
  description = "(Optional) Tags of the resource."
  type        = map(string)
  default     = null
}
