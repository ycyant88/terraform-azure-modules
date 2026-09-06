variable "budget_enabled" {
  description = "Whether to create budgets.\nIf enabled, supply the list of budgets in var.budgets.\n"
  type        = bool
  default     = false
}

variable "budgets" {
  description = "Map of budgets to create for the subscription.\n\n- amount - The total amount of cost to track with the budget.\n- time_grain - The time grain for the budget. Must be one of Annually, BillingAnnual, BillingMonth, BillingQuarter, Monthly, or Quarterly.\n- time_period_start - The start date for the budget.\n- time_period_end - The end date for the budget.\n- relative_scope - (optional) Scope relative to the created subscription. Omit, or leave blank for subscription scope.\n- notifications - (optional) The notifications to create for the budget.\n  - enabled - Whether the notification is enabled.\n  - operator - The operator for the notification. Must be one of GreaterThan or GreaterThanOrEqualTo.\n  - threshold - The threshold for the notification. Must be between 0 and 1000.\n  - threshold_type - The threshold type for the notification. Must be one of Actual or Forecasted.\n  - contact_emails - The contact emails for the notification.\n  - contact_roles - The contact roles for the notification.\n  - contact_groups - The contact groups for the notification.\n  - locale - The locale for the notification. Must be in the format xx-xx.\n\n\ntime_period_start and time_period_end must be UTC in RFC3339 format, e.g. 2018-05-13T07:44:12Z.\n\nExample value:\n\nterraform\nsubscription_budgets = {\n  budget1 = {\n    amount            = 150\n    time_grain        = \"Monthly\"\n    time_period_start = \"2024-01-01T00:00:00Z\"\n    time_period_end   = \"2027-12-31T23:59:59Z\"\n    notifications = {\n      eightypercent = {\n        enabled        = true\n        operator       = \"GreaterThan\"\n        threshold      = 80\n        threshold_type = \"Actual\"\n        contact_emails = [\"john@contoso.com\"]\n      }\n      budgetexceeded = {\n        enabled        = true\n        operator       = \"GreaterThan\"\n        threshold      = 120\n        threshold_type = \"Forecasted\"\n        contact_roles  = [\"Owner\"]\n      }\n    }\n  }\n}\n\n"
  type = map(object({
    amount            = number
    time_grain        = string
    time_period_start = string
    time_period_end   = string
    relative_scope    = optional(string, "")
    notifications = optional(map(object({
      enabled        = bool
      operator       = string
      threshold      = number
      threshold_type = optional(string, "Actual")
      contact_emails = optional(list(string), [])
      contact_roles  = optional(list(string), [])
      contact_groups = optional(list(string), [])
      locale         = optional(string, "en-us")
    })), {})
  }))
  default = {}
}

variable "disable_telemetry" {
  description = "To disable tracking, we have included this variable with a simple boolean flag.\nThe default value is false which does not disable the telemetry.\nIf you would like to disable this tracking, then simply set this value to true and this module will not create the telemetry tracking resources and therefore telemetry tracking will be disabled.\n\nFor more information, see the [wiki](https://aka.ms/lz-vending/tf/telemetry)\n\nE.g.\n\nterraform\nmodule \"lz_vending\" {\n  source  = \"Azure/lz-vending/azurerm\"\n  version = \"<version>\" # change this to your desired version, https://www.terraform.io/language/expressions/version-constraints\n\n  # ... other module variables\n\n  disable_telemetry = true\n}\n\n"
  type        = bool
  default     = false
}

variable "location" {
  description = "The default location of resources created by this module.\nVirtual networks will be created in this location unless overridden by the location attribute.\n"
  type        = string
  default     = ""
}

variable "network_security_group_enabled" {
  description = "Whether to create network security groups and security rules in the target subscription. Requires var.network_security_groups."
  type        = bool
  default     = false
}

variable "network_security_groups" {
  description = "A map of the network security groups to create. The map key must be known at the plan stage, e.g. must not be calculated and known only after apply.\n\n### Required fields\n\n- name: The name of the network security group. Changing this forces a new resource to be created. [required]\n- resource_group_name: The resource group name to create the network security group in. This assumes the resource group is within the subscription being used or created during the lz-vending module call. Changing this forces a new resource to be created. [required]\n\n### Location\n\n- location: The supported Azure location where the resource exists. Changing this forces a new resource to be created.\n\n### Tags\n\n- tags: A map of tags to apply to the virtual network. [optional - default empty]\n\n\n### Security Rules\n\n- security_rules - (Optional) A map of security rules to create within the network network security group. The value is an object with the following fields: \n  - access - (Required) Specifies whether network traffic is allowed or denied. Possible values are Allow and Deny.\n  - description - (Optional) A description for this rule. Restricted to 140 characters.\n  - destination_address_prefix - (Optional) CIDR or destination IP range or * to match any IP. Tags such as VirtualNetwork, AzureLoadBalancer and Internet can also be used. Besides, it also supports all available Service Tags like \u2018Sql.WestEurope\u2018, \u2018Storage.EastUS\u2018, etc. You can list the available service tags with the CLI: shell az network list-service-tags --location westcentralus. For further information please see [Azure CLI\n  - destination_address_prefixes - (Optional) List of destination address prefixes. Tags may not be used. This is required if destination_address_prefix is not specified.\n  - destination_application_security_group_ids - (Optional) A List of destination Application Security Group IDs\n  - destination_port_range - (Optional) Destination Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if destination_port_ranges is not specified.\n  - destination_port_ranges - (Optional) List of destination ports or port ranges. This is required if destination_port_range is not specified.\n  - direction - (Required) The direction specifies if rule will be evaluated on incoming or outgoing traffic. Possible values are Inbound and Outbound.\n  - name - (Required) The name of the security rule. This needs to be unique across all Rules in the Network Security Group. Changing this forces a new resource to be created.\n  - priority - (Required) Specifies the priority of the rule. The value can be between 100 and 4096. The priority number must be unique for each rule in the collection. The lower the priority number, the higher the priority of the rule.\n  - protocol - (Required) Network protocol this rule applies to. Possible values include Tcp, Udp, Icmp, Esp, Ah or * (which matches all).\n  - source_address_prefix - (Optional) CIDR or source IP range or * to match any IP. Tags such as VirtualNetwork, AzureLoadBalancer and Internet can also be used. This is required if source_address_prefixes is not specified.\n  - source_address_prefixes - (Optional) List of source address prefixes. Tags may not be used. This is required if source_address_prefix is not specified.\n  - source_application_security_group_ids - (Optional) A List of source Application Security Group IDs\n  - source_port_range - (Optional) Source Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if source_port_ranges is not specified.\n  - source_port_ranges - (Optional) List of source ports or port ranges. This is required if source_port_range is not specified.\n\n"
  type = map(object({
    name                = string
    location            = optional(string)
    resource_group_name = string
    tags                = optional(map(string))

    security_rules = optional(map(object({
      access                                     = string
      description                                = optional(string)
      destination_address_prefix                 = optional(string)
      destination_address_prefixes               = optional(set(string))
      destination_application_security_group_ids = optional(set(string))
      destination_port_range                     = optional(string)
      destination_port_ranges                    = optional(set(string))
      direction                                  = string
      name                                       = string
      priority                                   = number
      protocol                                   = string
      source_address_prefix                      = optional(string)
      source_address_prefixes                    = optional(set(string))
      source_application_security_group_ids      = optional(set(string))
      source_port_range                          = optional(string)
      source_port_ranges                         = optional(set(string))
    })))
  }))
  default = {}
}

variable "resource_group_creation_enabled" {
  description = "Whether to create additional resource groups in the target subscription. Requires var.resource_groups."
  type        = bool
  default     = false
}

variable "resource_groups" {
  description = "A map of the resource groups to create. The value is an object with the following attributes:\n\n- name - the name of the resource group\n- location - the location of the resource group\n- tags - (optional) a map of type string\n\nWe recommend that you include an entry to create the NetworkWatcherRG resource group so that this is managed by Terraform.\n"
  type = map(object({
    name     = string
    location = string
    tags     = optional(map(string), {})
  }))
  default = {}
}

variable "role_assignment_enabled" {
  description = "Whether to create role assignments.\nIf enabled, supply the list of role assignments in var.role_assignments.\n"
  type        = bool
  default     = false
}

variable "role_assignments" {
  description = "Supply a map of objects containing the details of the role assignments to create.\n\nObject fields:\n\n- principal_id: The directory/object id of the principal to assign the role to.\n- definition: The role definition to assign. Either use the name or the role definition resource id.\n- relative_scope: (optional) Scope relative to the created subscription. Omit, or leave blank for subscription scope.\n- condition: (optional) A condition to apply to the role assignment. See [Conditions Custom Security Attributes](https://learn.microsoft.com/azure/role-based-access-control/conditions-custom-security-attributes) for more details.\n- condition_version: (optional) The version of the condition syntax. See [Conditions Custom Security Attributes](https://learn.microsoft.com/azure/role-based-access-control/conditions-custom-security-attributes) for more details.\n- principal_type: (optional) The type of the principal. Can be \"User\", \"Group\", \"Device\", \"ForeignGroup\", or \"ServicePrincipal\".\n- definition_lookup_enabled: (optional) Whether to look up the role definition resource id from the role definition name. If disabled, the definition must be a role definition resource id. Default is true.\n- use_random_uuid: (optional) Whether to use a random UUID for the role assignment name. Default is false. If set to true, the role assignment name will be a random UUID, otherwise it will be a deterministic UUID based on the scope, principal id, and role definition id.\n\nE.g.\n\nterraform\nrole_assignments = {\n  # Example using role definition name:\n  contributor_user = {\n    principal_id      = \"00000000-0000-0000-0000-000000000000\",\n    definition        = \"Contributor\",\n    relative_scope    = \"\",\n    condition         = \"(!(ActionMatches{'Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read'} AND NOT SubOperationMatches{'Blob.List'})\",\n    condition_version = \"2.0\",\n  },\n  # Example using role definition id and RG scope:\n  myrg_custom_role = {\n    principal_id   = \"11111111-1111-1111-1111-111111111111\",\n    definition     = \"/providers/Microsoft.Management/managementGroups/mymg/providers/Microsoft.Authorization/roleDefinitions/aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa\",\n    relative_scope = \"/resourceGroups/MyRg\",\n  }\n}\n\n"
  type = map(object({
    principal_id              = string,
    definition                = string,
    relative_scope            = optional(string, "")
    condition                 = optional(string)
    condition_version         = optional(string)
    principal_type            = optional(string)
    definition_lookup_enabled = optional(bool, true)
    use_random_uuid           = optional(bool, false)
  }))
  default = {}
}

variable "route_table_enabled" {
  description = "Whether to create route tables and routes in the target subscription. Requires var.route_tables."
  type        = bool
  default     = false
}

variable "route_tables" {
  description = "A map defining route tables and their associated routes to be created:\n\n- name (required): The name of the route table.\n- location (required): The location of the resource group.\n- resource_group_name (required): The name of the resource group.\n- bgp_route_propagation_enabled (optional): Boolean that controls whether routes learned by BGP are propagated to the route table. Default is true.\n- tags (optional): A map of key-value pairs for tags associated with the route table.\n- routes (optional): A map defining routes for the route table. Each route object has the following properties:\n- name (required): The name of the route.\n- address_prefix (required): The address prefix for the route.\n- next_hop_type (required): The next hop type, must be one of: 'Internet', 'None', 'VirtualAppliance', 'VirtualNetworkGateway', 'VnetLocal'.\n- next_hop_in_ip_address (optional): The next hop IP address for the route. Required if next hop type is 'VirtualAppliance'.\n"
  type = map(object({
    name                          = string
    location                      = string
    resource_group_name           = string
    bgp_route_propagation_enabled = optional(bool, true)
    tags                          = optional(map(string))

    routes = optional(map(object({
      name                   = string
      address_prefix         = string
      next_hop_type          = string
      next_hop_in_ip_address = optional(string)
    })), {})
  }))
  default = {}
}

variable "subscription_alias_enabled" {
  description = "Whether to create a new subscription using the subscription alias resource.\n\nIf enabled, the following must also be supplied:\n\n- subscription_alias_name\n- subscription_display_name\n- subscription_billing_scope\n- subscription_workload\n\nOptionally, supply the following to enable the placement of the subscription into a management group:\n\n- subscription_management_group_id\n- subscription_management_group_association_enabled\n\nIf disabled, supply the subscription_id variable to use an existing subscription instead.\n\n> **Note**: When the subscription is destroyed, this module will try to remove the NetworkWatcherRG resource group using az cli.\n> This requires the az cli tool be installed and authenticated.\n> If the command fails for any reason, the provider will attempt to cancel the subscription anyway.\n"
  type        = bool
  default     = false
}

variable "subscription_alias_name" {
  description = "The name of the subscription alias.\n\nThe string must be comprised of a-z, A-Z, 0-9, - and _.\nThe maximum length is 63 characters.\n\nYou may also supply an empty string if you do not want to create a new subscription alias.\nIn this scenario, subscription_enabled should be set to false and subscription_id must be supplied.\n"
  type        = string
  default     = null
}

variable "subscription_billing_scope" {
  description = "The billing scope for the new subscription alias.\n\nA valid billing scope starts with /providers/Microsoft.Billing/billingAccounts/ and is case sensitive.\n\nE.g.\n\n- For CustomerLed and FieldLed, e.g. MCA - /providers/Microsoft.Billing/billingAccounts/{billingAccountName}/billingProfiles/{billingProfileName}/invoiceSections/{invoiceSectionName}\n- For PartnerLed, e.g. MPA - /providers/Microsoft.Billing/billingAccounts/{billingAccountName}/customers/{customerName}\n- For Legacy EA - /providers/Microsoft.Billing/billingAccounts/{billingAccountName}/enrollmentAccounts/{enrollmentAccountName}\n\nYou may also supply an empty string if you do not want to create a new subscription alias.\nIn this scenario, subscription_enabled should be set to false and subscription_id must be supplied.\n"
  type        = string
  default     = null
}

variable "subscription_display_name" {
  description = "The display name of the subscription alias.\n\nThe string must be comprised of a-z, A-Z, 0-9, -, _ and space.\nThe maximum length is 63 characters.\n\nYou may also supply an empty string if you do not want to create a new subscription alias.\nIn this scenario, subscription_enabled should be set to false and subscription_id must be supplied.\n"
  type        = string
  default     = null
}

variable "subscription_id" {
  description = "An existing subscription id.\n\nUse this when you do not want the module to create a new subscription.\nBut do want to manage the management group membership.\n\nA GUID should be supplied in the format xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx.\nAll letters must be lowercase.\n\nWhen using this, subscription_management_group_association_enabled should be enabled,\nand subscription_management_group_id should be supplied.\n\nYou may also supply an empty string if you want to create a new subscription alias.\nIn this scenario, subscription_alias_enabled should be set to true and the following other variables must be supplied:\n\n- subscription_alias_name\n- subscription_alias_display_name\n- subscription_alias_billing_scope\n- subscription_alias_workload\n"
  type        = string
  default     = null
}

variable "subscription_management_group_association_enabled" {
  description = "Whether to create the management group association resource.\n\nIf enabled, the subscription_management_group_id must also be supplied.\n"
  type        = bool
  default     = false
}

variable "subscription_management_group_id" {
  description = "  The destination management group ID for the new subscription.\n\n**Note:** Do not supply the display name.\nThe management group ID forms part of the Azure resource ID. E.g.,\n/providers/Microsoft.Management/managementGroups/{managementGroupId}.\n"
  type        = string
  default     = null
}

variable "subscription_register_resource_providers_and_features" {
  description = "The map of resource providers to register.\nThe map keys are the resource provider namespace, e.g. Microsoft.Compute.\nThe map values are a list of provider features to enable.\nLeave the value empty to not register any resource provider features.\n\nThe default values are taken from [Hashicorp's AzureRM provider](https://github.com/hashicorp/terraform-provider-azurerm/blob/main/internal/resourceproviders/required.go).\n"
  type        = map(set(string))
  default     = { "Microsoft.AVS" : [], "Microsoft.ApiManagement" : [], "Microsoft.AppPlatform" : [], "Microsoft.Authorization" : [], "Microsoft.Automation" : [], "Microsoft.Blueprint" : [], "Microsoft.BotService" : [], "Microsoft.Cache" : [], "Microsoft.Cdn" : [], "Microsoft.CognitiveServices" : [], "Microsoft.Compute" : [], "Microsoft.ContainerInstance" : [], "Microsoft.ContainerRegistry" : [], "Microsoft.ContainerService" : [], "Microsoft.CostManagement" : [], "Microsoft.CustomProviders" : [], "Microsoft.DBforMariaDB" : [], "Microsoft.DBforMySQL" : [], "Microsoft.DBforPostgreSQL" : [], "Microsoft.DataLakeAnalytics" : [], "Microsoft.DataLakeStore" : [], "Microsoft.DataMigration" : [], "Microsoft.DataProtection" : [], "Microsoft.Databricks" : [], "Microsoft.DesktopVirtualization" : [], "Microsoft.DevTestLab" : [], "Microsoft.Devices" : [], "Microsoft.DocumentDB" : [], "Microsoft.EventGrid" : [], "Microsoft.EventHub" : [], "Microsoft.GuestConfiguration" : [], "Microsoft.HDInsight" : [], "Microsoft.HealthcareApis" : [], "Microsoft.KeyVault" : [], "Microsoft.Kusto" : [], "Microsoft.Logic" : [], "Microsoft.MachineLearningServices" : [], "Microsoft.Maintenance" : [], "Microsoft.ManagedIdentity" : [], "Microsoft.ManagedServices" : [], "Microsoft.Management" : [], "Microsoft.Maps" : [], "Microsoft.MarketplaceOrdering" : [], "Microsoft.MixedReality" : [], "Microsoft.Network" : [], "Microsoft.NotificationHubs" : [], "Microsoft.OperationalInsights" : [], "Microsoft.OperationsManagement" : [], "Microsoft.PolicyInsights" : [], "Microsoft.PowerBIDedicated" : [], "Microsoft.RecoveryServices" : [], "Microsoft.Relay" : [], "Microsoft.Resources" : [], "Microsoft.Search" : [], "Microsoft.Security" : [], "Microsoft.SecurityInsights" : [], "Microsoft.ServiceBus" : [], "Microsoft.ServiceFabric" : [], "Microsoft.Sql" : [], "Microsoft.Storage" : [], "Microsoft.StreamAnalytics" : [], "Microsoft.Web" : [], "microsoft.insights" : [] }
}

variable "subscription_register_resource_providers_enabled" {
  description = "Whether to register resource providers for the subscription.\nUse var.subscription_register_resource_providers_and_features to customize registration.\n"
  type        = bool
  default     = false
}

variable "subscription_tags" {
  description = "A map of tags to assign to the newly created subscription.\nOnly valid when subsciption_alias_enabled is set to true.\n\nExample value:\n\nterraform\nsubscription_tags = {\n  mytag  = \"myvalue\"\n  mytag2 = \"myvalue2\"\n}\n\n"
  type        = map(string)
  default     = {}
}

variable "subscription_update_existing" {
  description = "Whether to update an existing subscription with the supplied tags and display name.\nIf enabled, the following must also be supplied:\n- subscription_id\n"
  type        = bool
  default     = false
}

variable "subscription_workload" {
  description = "The billing scope for the new subscription alias.\n\nThe workload type can be either Production or DevTest and is case sensitive.\n\nYou may also supply an empty string if you do not want to create a new subscription alias.\nIn this scenario, subscription_enabled should be set to false and subscription_id must be supplied.\n"
  type        = string
  default     = null
}

variable "umi_enabled" {
  description = "Whether to enable the creation of a user-assigned managed identity.\n\nRequires umi.name and umi.resosurce_group_name to be non-empty.\n"
  type        = bool
  default     = false
}

variable "user_managed_identities" {
  description = "A map of user-managed identities to create. The map key must be known at the plan stage, e.g. must not be calculated and known only after apply. The value is a map of attributes.\n\n### Required fields\n\n- name: The name of the user-assigned managed identity. [required]\n- resource_group_name: The name of the resource group to create the user-assigned managed identity in. [required]\n\n### Optional fields\n\n- location: The location of the user-assigned managed identity. [optional]\n- tags: The tags to apply to the user-assigned managed identity. [optional]\n\n### Resource group values [DEPRECATED]\n\n**Note:** The creation of resource groups should be done using the resource module, in v6.0.0 these variables will be retired.\n\n- resource_group_creation_enabled: Whether to create a resource group for the user managed identity. [optional - default true]\n- resource_group_tags: The tags to apply to the user-assigned managed identity resource group, if we create it. [optional]\n- resource_group_lock_enabled: Whether to enable resource group lock for the user-assigned managed identity resource group. [optional]\n- resource_group_lock_name: The name of the resource group lock for the user-assigned managed identity resource group, if blank will be set to lock-<resource_group_name>. [optional]\n\n### Role Based Access Control (RBAC)\n\nThe following fields are used to configure role assignments for the user-assigned managed identity.\n- role_assignments: A map of role assignments to create for the user-assigned managed identity. [optional] - See role_assignments variable for details.\n\n### Federated Credentials\n\nThe following fields are used to configure federated identity credentials, using OpenID Connect, for use in GitHub actions, Azure DevOps pipelines, and Terraform Cloud.\n\n#### GitHub Actions\n\n- federated_credentials_github: A map of federated credentials to create for the user-assigned managed identity. [optional]\n  - name - the name of the federated credential resource, the last segment of the Azure resource id.\n  - organization - the name of the GitHub organization, e.g. Azure in https://github.com/Azure/terraform-azurerm-lz-vending.\n  - repository - the name of the GitHub respository, e.g. terraform-azurerm-lz-vending in https://github.com/Azure/terraform-azurerm-lz-vending.\n  - entity - one of 'environment', 'pull_request', 'tag', or 'branch'\n  - enterprise_slug - the name of the GitHub Enterprise, e.g. my-enterprise. This is optional and only valid when using an enterprise.\n  - value - identifies the entity type, e.g. main when using entity is branch. Should be blank when entity is pull_request.\n\n#### Terraform Cloud\n\n- federated_credentials_terraform_cloud: A map of federated credentials to create for the user-assigned managed identity. [optional]\n  - name - the name of the federated credential resource, the last segment of the Azure resource id.\n  - organization - the name of the Terraform Cloud organization.\n  - project - the name of the Terraform Cloud project.\n  - workspace - the name of the Terraform Cloud workspace.\n  - run_phase - one of plan, or apply.\n\n#### Advanced Federated Credentials\n\n- federated_credentials_advanced: A map of federated credentials to create for the user-assigned managed identity. [optional]\n  - name: The name of the federated credential resource, the last segment of the Azure resource id.\n  - subject_identifier: The subject of the token.\n  - issuer_url: The URL of the token issuer, should begin with https://\n  - audience: (optional) The token audience, defaults to api://AzureADTokenExchange.\n"
  type = map(object({
    name                            = string
    resource_group_name             = string
    location                        = optional(string)
    tags                            = optional(map(string), {})
    resource_group_creation_enabled = optional(bool, true)
    resource_group_tags             = optional(map(string), {})
    resource_group_lock_enabled     = optional(bool, true)
    resource_group_lock_name        = optional(string)
    role_assignments = optional(map(object({
      definition                = string
      relative_scope            = optional(string, "")
      condition                 = optional(string)
      condition_version         = optional(string)
      principal_type            = optional(string)
      definition_lookup_enabled = optional(bool, true)
      use_random_uuid           = optional(bool, false)
    })), {})
    federated_credentials_github = optional(map(object({
      name            = optional(string)
      organization    = string
      repository      = string
      entity          = string
      enterprise_slug = optional(string)
      value           = optional(string)
    })), {})
    federated_credentials_terraform_cloud = optional(map(object({
      name         = optional(string)
      organization = string
      project      = string
      workspace    = string
      run_phase    = string
    })), {})
    federated_credentials_advanced = optional(map(object({
      name               = string
      subject_identifier = string
      issuer_url         = string
      audiences          = optional(set(string), ["api://AzureADTokenExchange"])
    })), {})
  }))
  default = {}
}

variable "virtual_network_enabled" {
  description = "Enables and disables the virtual network submodule."
  type        = bool
  default     = false
}

variable "virtual_networks" {
  description = "A map of the virtual networks to create. The map key must be known at the plan stage, e.g. must not be calculated and known only after apply.\n\n### Required fields\n\n- name: The name of the virtual network. [required]\n- address_space: The address space of the virtual network as a list of strings in CIDR format, e.g. [\"192.168.0.0/24\", \"10.0.0.0/24\"]. [required]\n- resource_group_name: The name of the resource group to create the virtual network in. [required]\n\n### DNS servers\n\n- dns_servers: A list of DNS servers to use for the virtual network, e.g. [\"192.168.0.1\", \"10.0.0.1\"]. If empty will use the Azure default DNS. [optional - default empty list]\n\n### DDOS protection plan\n\n- ddos_protection_enabled: Whether to enable ddos protection. [optional]\n- ddos_protection_plan_id: The resource ID of the protection plan to attach the vnet. [optional - but required if ddos_protection_enabled is true]\n\n### Location\n\n- location: The location of the virtual network (and resource group if creation is enabled). [optional, will use var.location if not specified or empty string]\n\n> Note at least one of location or var.location must be specified.\n> If both are empty then the module will fail.\n\n#### Subnets\n\n- subnets - (Optional) A map of subnets to create in the virtual network. The value is an object with the following fields:\n  - name - The name of the subnet.\n  - address_prefixes - The IPv4 address prefixes to use for the subnet in CIDR format.\n  - nat_gateway - (Optional) An object with the following fields:\n    - id - The ID of the NAT Gateway which should be associated with the Subnet. Changing this forces a new resource to be created.\n  - network_security_group - (Optional) An object with the following fields:\n    - id - The ID of the Network Security Group which should be associated with the Subnet. Changing this forces a new association to be created.\n    - key_reference - The name of the var.network_security_group map key that should be associated with the subnet once it has been provisioned. If you are passing in an id value, this will not be used.\n  - private_endpoint_network_policies_enabled - (Optional) Enable or Disable network policies for the private endpoint on the subnet. Setting this to true will Enable the policy and setting this to false will Disable the policy. Defaults to true.\n  - private_link_service_network_policies_enabled - (Optional) Enable or Disable network policies for the private link service on the subnet. Setting this to true will Enable the policy and setting this to false will Disable the policy. Defaults to true.\n  - route_table - (Optional) An object with the following fields which are mutually exclusive, choose either an external route table or the generated route table:\n    - id - The ID of the Route Table which should be associated with the Subnet. Changing this forces a new association to be created.\n    - key_reference - The name of the var.route_tables map key that should be associated with the subnet once it has been provisioned. If you are passing in an id value, this will not be used.\n  - default_outbound_access_enabled - (Optional) Whether to allow internet access from the subnet. Defaults to false.\n  - service_endpoints - (Optional) The list of Service endpoints to associate with the subnet.\n  - service_endpoint_policies - (Optional) The list of Service Endpoint Policy objects with the resource id to associate with the subnet.\n    - id - The ID of the endpoint policy that should be associated with the subnet.\n  - service_endpoint_policy_assignment_enabled - (Optional) Should the Service Endpoint Policy be assigned to the subnet? Default true.\n  - delegation - (Optional) An object with the following fields:\n    - name - The name of the delegation.\n    - service_delegation - An object with the following fields:\n      - name - The name of the service delegation.\n      - actions - A list of actions that should be delegated, the list is specific to the service being delegated.\n\n\n### Hub network peering values\n\nThe following values configure bi-directional hub & spoke peering for the given virtual network:\n\n- hub_peering_enabled: Whether to enable hub peering. [optional]\n- hub_peering_direction: The direction of the peering. [optional - allowed values are: tohub, fromhub or both - default both]\n- hub_network_resource_id: The resource ID of the hub network to peer with. [optional - but required if hub_peering_enabled is true]\n- hub_peering_name_tohub: The name of the peering to the hub network. [optional - leave empty to use calculated name]\n- hub_peering_name_fromhub: The name of the peering from the hub network. [optional - leave empty to use calculated name]\n\n#### Hub network peering options\n\nThe following values configure the options for the hub network peering. These are configurable in each direction:\n\n- allow_forwarded_traffic: Whether to allow forwarded traffic for the peering. [optional - default true]\n- allow_gateway_transit: Whether to allow gateway transit for the peering. [optional - default false (outbound) or true (inbound)]\n- allow_virtual_network_access: Whether to allow virtual network access for the peering. [optional - default true]\n- do_not_verify_remote_gateways: Whether to not verify remote gateways for the peering. [optional - default false]\n- enable_only_ipv6_peering: Whether to enable only IPv6 peering. [optional - default false]\n- local_peered_address_spaces: A list of local address spaces to peer with. [optional - default empty and only used if peer_complete_vnets is false]\n- local_peered_subnets: A list of local subnets to peer with. [optional - default empty and only used if peer_complete_vnets is false]\n- peer_complete_vnets: Whether to peer complete virtual networks. [optional - default true]\n- remote_peered_address_spaces: A list of remote address spaces to peer with. [optional - default empty and only used if peer_complete_vnets is false]\n- remote_peered_subnets: A list of remote subnets to peer with. [optional - default empty and only used if peer_complete_vnets is false]\n- use_remote_gateways: Whether to use remote gateways for the peering. [optional - default true (outbound) or false (inbound)]\n\n### Mesh peering values\n\nMesh peering is the capability to create a bi-directional peerings between all supplied virtual networks in var.virtual_networks.\nPeerings will only be created between virtual networks with the mesh_peering_enabled value set to true.\n\n- mesh_peering_enabled: Whether to enable mesh peering for this virtual network. Must be enabled on more than one virtual network for any peerings to be created. [optional]\n- mesh_peering_allow_forwarded_traffic: Whether to allow forwarded traffic for the mesh peering. [optional - default false]\n\n### Resource group values [DEPRECATED]\n\n**Note:** The creation of resource groups should be done using the resource module, in v6.0.0 these variables will be retired from the virtual network objects.\n\nThe default is that a resource group will be created for each resource_group_name specified in the var.virtual_networks map.\nIt is possible to use a pre-existing resource group by setting resource_group_creation_enabled to false.\nWe recommend using resource groups aligned to the region of the virtual network,\nhowever if you want multiple virtual networks in more than one location to share a resource group,\nonly one of the virtual networks should have resource_group_creation_enabled set to true.\n\n- resource_group_creation_enabled: Whether to create a resource group for the virtual network. [optional - default true]\n- resource_group_lock_enabled: Whether to create a CanNotDelete resource lock on the resource group. [optional - default true]\n- resource_group_lock_name: The name of the resource lock. [optional - leave empty to use calculated name]\n- resource_group_tags: A map of tags to apply to the resource group, e.g. { mytag = \"myvalue\", mytag2 = \"myvalue2\" }. [optional - default empty]\n\n### Virtual WAN values\n\n- vwan_associated_routetable_resource_id: The resource ID of the route table to associate with the virtual network. [optional - leave empty to use defaultRouteTable on hub]\n- vwan_connection_enabled: Whether to create a connection to a Virtual WAN. [optional - default false]\n- vwan_connection_name: The name of the connection to the Virtual WAN. [optional - leave empty to use calculated name]\n- vwan_hub_resource_id: The resource ID of the hub to connect to. [optional - but required if vwan_connection_enabled is true]\n- vwan_propagated_routetables_labels: A list of labels of route tables to propagate to the virtual network. [optional - leave empty to use [\"default\"]]\n- vwan_propagated_routetables_resource_ids: A list of resource IDs of route tables to propagate to the virtual network. [optional - leave empty to use defaultRouteTable on hub]\n- vwan_security_configuration: A map of security configuration values for VWAN hub connection - see below. [optional - default empty]\n  - secure_internet_traffic: Whether to forward internet-bound traffic to the destination specified in the routing policy. [optional - default false]\n  - secure_private_traffic: Whether to all internal traffic to the destination specified in the routing policy. Not compatible with routing_intent_enabled. [optional - default false]\n  - routing_intent_enabled: Enable to use with a Virtual WAN hub with routing intent enabled. Routing intent on hub is configured outside this module. [optional - default false]\n\n### Tags\n\n- tags: A map of tags to apply to the virtual network. [optional - default empty]\n"
  type = map(object({
    name                = string
    address_space       = list(string)
    resource_group_name = string

    location = optional(string)

    dns_servers             = optional(list(string), [])
    flow_timeout_in_minutes = optional(number)

    ddos_protection_enabled = optional(bool, false)
    ddos_protection_plan_id = optional(string)

    subnets = optional(map(object(
      {
        name             = string
        address_prefixes = list(string)
        nat_gateway = optional(object({
          id = string
        }))
        network_security_group = optional(object({
          id            = optional(string)
          key_reference = optional(string)
        }))
        private_endpoint_network_policies             = optional(string, "Enabled")
        private_link_service_network_policies_enabled = optional(bool, true)
        route_table = optional(object({
          id            = optional(string)
          key_reference = optional(string)
        }))
        default_outbound_access_enabled = optional(bool, false)
        service_endpoints               = optional(set(string))
        service_endpoint_policies = optional(map(object({
          id = string
        })))
        delegations = optional(list(
          object(
            {
              name = string
              service_delegation = object({
                name = string
              })
            }
          )
        ))
      }
    )), {})

    hub_network_resource_id = optional(string)
    hub_peering_enabled     = optional(bool, false)
    hub_peering_direction   = optional(string, "both")
    hub_peering_name_tohub  = optional(string)
    hub_peering_options_tohub = optional(object({
      allow_forwarded_traffic       = optional(bool, true)
      allow_gateway_transit         = optional(bool, false)
      allow_virtual_network_access  = optional(bool, true)
      do_not_verify_remote_gateways = optional(bool, false)
      enable_only_ipv6_peering      = optional(bool, false)
      local_peered_address_spaces   = optional(list(string), [])
      local_peered_subnets          = optional(list(string), [])
      peer_complete_vnets           = optional(bool, true)
      remote_peered_address_spaces  = optional(list(string), [])
      remote_peered_subnets         = optional(list(string), [])
      use_remote_gateways           = optional(bool, true)
    }), {})
    hub_peering_name_fromhub = optional(string)
    hub_peering_options_fromhub = optional(object({
      allow_forwarded_traffic       = optional(bool, true)
      allow_gateway_transit         = optional(bool, true)
      allow_virtual_network_access  = optional(bool, true)
      do_not_verify_remote_gateways = optional(bool, false)
      enable_only_ipv6_peering      = optional(bool, false)
      local_peered_address_spaces   = optional(list(string), [])
      local_peered_subnets          = optional(list(string), [])
      peer_complete_vnets           = optional(bool, true)
      remote_peered_address_spaces  = optional(list(string), [])
      remote_peered_subnets         = optional(list(string), [])
      use_remote_gateways           = optional(bool, false)
    }), {})

    mesh_peering_enabled                 = optional(bool, false)
    mesh_peering_allow_forwarded_traffic = optional(bool, false)

    resource_group_creation_enabled = optional(bool, true)
    resource_group_lock_enabled     = optional(bool, true)
    resource_group_lock_name        = optional(string)
    resource_group_tags             = optional(map(string), {})

    vwan_associated_routetable_resource_id   = optional(string)
    vwan_connection_enabled                  = optional(bool, false)
    vwan_connection_name                     = optional(string)
    vwan_hub_resource_id                     = optional(string)
    vwan_propagated_routetables_labels       = optional(list(string), [])
    vwan_propagated_routetables_resource_ids = optional(list(string), [])
    vwan_security_configuration = optional(object({
      secure_internet_traffic = optional(bool, false)
      secure_private_traffic  = optional(bool, false)
      routing_intent_enabled  = optional(bool, false)
    }), {})

    tags = optional(map(string), {})
  }))
  default = {}
}

variable "wait_for_subscription_before_subscription_operations" {
  description = "The duration to wait after vending a subscription before performing subscription operations.\n"
  type = object({
    create  = optional(string, "30s")
    destroy = optional(string, "0s")
  })
  default = {}
}

variable "wait_for_umi_before_umi_role_assignment_operations" {
  description = "The duration to wait after creating a user managed identity before performing role assignment operations.\n"
  type = object({
    create  = optional(string, "30s")
    destroy = optional(string, "0s")
  })
  default = {}
}
