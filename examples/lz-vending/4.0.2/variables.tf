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

variable "network_watcher_resource_group_enabled" {
  description = "Create NetworkWatcherRG in the subscription.\n\nAlthough this resource group is created automatically by Azure,\nit is not managed by Terraform and therefore can impede the subscription cancellation process.\n\nEnabling this variable will create the resource group in the subscription and allow Terraform to manage it,\nwhich includes destroying the resource (and all resources within it).\n"
  type        = bool
  default     = false
}

variable "resource_group_creation_enabled" {
  description = "Whether to create additional resource groups in the target subscription. Requires var.resource_groups_to_create."
  type        = bool
  default     = false
}

variable "resource_groups" {
  description = "A map of the resource groups to create. THe value is an object with the following attributes:\n\n- name - the name of the resource group\n- location - the location of the resource group\n- tags - (optional) a map of type string\n\n> Do not include the NetworkWatcherRG resource group in this map if you have enabled var.network_watcher_resource_group_enabled.\n"
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
  description = "Supply a map of objects containing the details of the role assignments to create.\n\nObject fields:\n\n- principal_id: The directory/object id of the principal to assign the role to.\n- definition: The role definition to assign. Either use the name or the role definition resource id.\n- relative_scope: (optional) Scope relative to the created subscription. Omit, or leave blank for subscription scope.\n- condition: (optional) A condition to apply to the role assignment. See [Conditions Custom Security Attributes](https://learn.microsoft.com/azure/role-based-access-control/conditions-custom-security-attributes) for more details.\n- condition_version: (optional) The version of the condition syntax. See [Conditions Custom Security Attributes](https://learn.microsoft.com/azure/role-based-access-control/conditions-custom-security-attributes) for more details.\n\nE.g.\n\nterraform\nrole_assignments = {\n  # Example using role definition name:\n  contributor_user = {\n    principal_id      = \"00000000-0000-0000-0000-000000000000\",\n    definition        = \"Contributor\",\n    relative_scope    = \"\",\n    condition         = \"(!(ActionMatches{'Microsoft.Storage/storageAccounts/blobServices/containers/blobs/read'} AND NOT SubOperationMatches{'Blob.List'})\",\n    condition_version = \"2.0\",\n  },\n  # Example using role definition id and RG scope:\n  myrg_custom_role = {\n    principal_id   = \"11111111-1111-1111-1111-111111111111\",\n    definition     = \"/providers/Microsoft.Management/managementGroups/mymg/providers/Microsoft.Authorization/roleDefinitions/aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa\",\n    relative_scope = \"/resourceGroups/MyRg\",\n  }\n}\n\n"
  type = map(object({
    principal_id      = string,
    definition        = string,
    relative_scope    = optional(string, ""),
    condition         = optional(string, ""),
    condition_version = optional(string, ""),
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
  default     = ""
}

variable "subscription_billing_scope" {
  description = "The billing scope for the new subscription alias.\n\nA valid billing scope starts with /providers/Microsoft.Billing/billingAccounts/ and is case sensitive.\n\nE.g.\n\n- For CustomerLed and FieldLed, e.g. MCA - /providers/Microsoft.Billing/billingAccounts/{billingAccountName}/billingProfiles/{billingProfileName}/invoiceSections/{invoiceSectionName}\n- For PartnerLed, e.g. MPA - /providers/Microsoft.Billing/billingAccounts/{billingAccountName}/customers/{customerName}\n- For Legacy EA - /providers/Microsoft.Billing/billingAccounts/{billingAccountName}/enrollmentAccounts/{enrollmentAccountName}\n\nYou may also supply an empty string if you do not want to create a new subscription alias.\nIn this scenario, subscription_enabled should be set to false and subscription_id must be supplied.\n"
  type        = string
  default     = ""
}

variable "subscription_display_name" {
  description = "The display name of the subscription alias.\n\nThe string must be comprised of a-z, A-Z, 0-9, -, _ and space.\nThe maximum length is 63 characters.\n\nYou may also supply an empty string if you do not want to create a new subscription alias.\nIn this scenario, subscription_enabled should be set to false and subscription_id must be supplied.\n"
  type        = string
  default     = ""
}

variable "subscription_id" {
  description = "An existing subscription id.\n\nUse this when you do not want the module to create a new subscription.\nBut do want to manage the management group membership.\n\nA GUID should be supplied in the format xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx.\nAll letters must be lowercase.\n\nWhen using this, subscription_management_group_association_enabled should be enabled,\nand subscription_management_group_id should be supplied.\n\nYou may also supply an empty string if you want to create a new subscription alias.\nIn this scenario, subscription_alias_enabled should be set to true and the following other variables must be supplied:\n\n- subscription_alias_name\n- subscription_alias_display_name\n- subscription_alias_billing_scope\n- subscription_alias_workload\n"
  type        = string
  default     = ""
}

variable "subscription_management_group_association_enabled" {
  description = "Whether to create the azurerm_management_group_subscription_association resource.\n\nIf enabled, the subscription_management_group_id must also be supplied.\n"
  type        = bool
  default     = false
}

variable "subscription_management_group_id" {
  description = "  The destination management group ID for the new subscription.\n\n**Note:** Do not supply the display name.\nThe management group ID forms part of the Azure resource ID. E.g.,\n/providers/Microsoft.Management/managementGroups/{managementGroupId}.\n"
  type        = string
  default     = ""
}

variable "subscription_register_resource_providers_and_features" {
  description = "The map of resource providers to register.\nThe map keys are the resource provider namespace, e.g. Microsoft.Compute.\nThe map values are a list of provider features to enable.\nLeave the value empty to not register any resource provider features.\n\nThe default values are taken from [Hashicorp's AzureRM provider](https://github.com/hashicorp/terraform-provider-azurerm/blob/main/internal/resourceproviders/required.go).\n"
  type        = map(set(string))
  default     = { "Microsoft.AVS" : [], "Microsoft.ApiManagement" : [], "Microsoft.AppPlatform" : [], "Microsoft.Authorization" : [], "Microsoft.Automation" : [], "Microsoft.Blueprint" : [], "Microsoft.BotService" : [], "Microsoft.Cache" : [], "Microsoft.Cdn" : [], "Microsoft.CognitiveServices" : [], "Microsoft.Compute" : [], "Microsoft.ContainerInstance" : [], "Microsoft.ContainerRegistry" : [], "Microsoft.ContainerService" : [], "Microsoft.CostManagement" : [], "Microsoft.CustomProviders" : [], "Microsoft.DBforMariaDB" : [], "Microsoft.DBforMySQL" : [], "Microsoft.DBforPostgreSQL" : [], "Microsoft.DataLakeAnalytics" : [], "Microsoft.DataLakeStore" : [], "Microsoft.DataMigration" : [], "Microsoft.DataProtection" : [], "Microsoft.Databricks" : [], "Microsoft.DesktopVirtualization" : [], "Microsoft.DevTestLab" : [], "Microsoft.Devices" : [], "Microsoft.DocumentDB" : [], "Microsoft.EventGrid" : [], "Microsoft.EventHub" : [], "Microsoft.GuestConfiguration" : [], "Microsoft.HDInsight" : [], "Microsoft.HealthcareApis" : [], "Microsoft.KeyVault" : [], "Microsoft.Kusto" : [], "Microsoft.Logic" : [], "Microsoft.MachineLearningServices" : [], "Microsoft.Maintenance" : [], "Microsoft.ManagedIdentity" : [], "Microsoft.ManagedServices" : [], "Microsoft.Management" : [], "Microsoft.Maps" : [], "Microsoft.MarketplaceOrdering" : [], "Microsoft.Media" : [], "Microsoft.MixedReality" : [], "Microsoft.Network" : [], "Microsoft.NotificationHubs" : [], "Microsoft.OperationalInsights" : [], "Microsoft.OperationsManagement" : [], "Microsoft.PolicyInsights" : [], "Microsoft.PowerBIDedicated" : [], "Microsoft.RecoveryServices" : [], "Microsoft.Relay" : [], "Microsoft.Resources" : [], "Microsoft.Search" : [], "Microsoft.Security" : [], "Microsoft.SecurityInsights" : [], "Microsoft.ServiceBus" : [], "Microsoft.ServiceFabric" : [], "Microsoft.Sql" : [], "Microsoft.Storage" : [], "Microsoft.StreamAnalytics" : [], "Microsoft.TimeSeriesInsights" : [], "Microsoft.Web" : [], "microsoft.insights" : [] }
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

variable "subscription_use_azapi" {
  description = "Whether to create a new subscription using the azapi provider. This may be required if the principal running\nterraform does not have the required permissions to create a subscription under the default management group.\nIf enabled, the following must also be supplied:\n- subscription_alias_name\n- subscription_display_name\n- subscription_billing_scope\n- subscription_workload\nOptionally, supply the following to enable the placement of the subscription into a management group:\n- subscription_management_group_id\n- subscription_management_group_association_enabled\nIf disabled, supply the subscription_id variable to use an existing subscription instead.\n> **Note**: When the subscription is destroyed, this module will try to remove the NetworkWatcherRG resource group using az cli.\n> This requires the az cli tool be installed and authenticated.\n> If the command fails for any reason, the provider will attempt to cancel the subscription anyway.\n"
  type        = bool
  default     = false
}

variable "subscription_workload" {
  description = "The billing scope for the new subscription alias.\n\nThe workload type can be either Production or DevTest and is case sensitive.\n\nYou may also supply an empty string if you do not want to create a new subscription alias.\nIn this scenario, subscription_enabled should be set to false and subscription_id must be supplied.\n"
  type        = string
  default     = ""
}

variable "umi_enabled" {
  description = "Whether to enable the creation of a user-assigned managed identity.\n\nRequires umi_name and umi_resosurce_group_name to be non-empty.\n"
  type        = bool
  default     = false
}

variable "umi_federated_credentials_advanced" {
  description = "Configure federated identity credentials, using OpenID Connect, for use scenarios outside GitHub Actions and Terraform Cloud.\n\nThe may key is arbitrary and only used for the for_each in the resource declaration.\n\nThe map value is an object with the following attributes:\n\n- name: The name of the federated credential resource, the last segment of the Azure resource id.\n- subject_identifier: The subject of the token.\n- issuer_url: The URL of the token issuer, should begin with https://\n- audience: (optional) The token audience, defaults to api://AzureADTokenExchange.\n"
  type = map(object({
    name               = string
    subject_identifier = string
    issuer_url         = string
    audiences          = optional(set(string), ["api://AzureADTokenExchange"])
  }))
  default = {}
}

variable "umi_federated_credentials_github" {
  description = "Configure federated identity credentials, using OpenID Connect, for use in GitHub actions.\n\nThe may key is arbitrary and only used for the for_each in the resource declaration.\n\nThe map value is an object with the following attributes:\n\n- name - the name of the federated credential resource, the last segment of the Azure resource id.\n- organization - the name of the GitHub organization, e.g. Azure in https://github.com/Azure/terraform-azurerm-lz-vending.\n- repository - the name of the GitHub respository, e.g. terraform-azurerm-lz-vending in https://github.com/Azure/terraform-azurerm-lz-vending.\n- entity - one of 'environment', 'pull_request', 'tag', or 'branch'\n- value - identifies the entity type, e.g. main when using entity is branch. Should be blank when entity is pull_request.\n"
  type = map(object({
    name         = optional(string, "")
    organization = string
    repository   = string
    entity       = string
    value        = optional(string, "")
  }))
  default = {}
}

variable "umi_federated_credentials_terraform_cloud" {
  description = "Configure federated identity credentials, using OpenID Connect, for use in Terraform Cloud.\n\nThe may key is arbitrary and only used for the for_each in the resource declaration.\n\nThe map value is an object with the following attributes:\n\n- name - the name of the federated credential resource, the last segment of the Azure resource id.\n- organization - the name of the Terraform Cloud organization.\n- project - the name of the Terraform Cloud project.\n- workspace - the name of the Terraform Cloud workspace.\n- run_phase - one of plan, or apply.\n"
  type = map(object({
    name         = optional(string, "")
    organization = string
    project      = string
    workspace    = string
    run_phase    = string
  }))
  default = {}
}

variable "umi_name" {
  description = "The name of the user-assigned managed identity"
  type        = string
  default     = ""
}

variable "umi_resource_group_creation_enabled" {
  description = "Whether to create the supplied resource group for the user-assigned managed identity"
  type        = bool
  default     = true
}

variable "umi_resource_group_lock_enabled" {
  description = "Whether to enable resource group lock for the user-assigned managed identity resource group"
  type        = bool
  default     = true
}

variable "umi_resource_group_lock_name" {
  description = "The name of the resource group lock for the user-assigned managed identity resource group, if blank will be set to lock-<resource_group_name>"
  type        = string
  default     = ""
}

variable "umi_resource_group_name" {
  description = "The name of the resource group in which to create the user-assigned managed identity"
  type        = string
  default     = ""
}

variable "umi_resource_group_tags" {
  description = "The tags to apply to the user-assigned managed identity resource group, if we create it."
  type        = map(string)
  default     = {}
}

variable "umi_role_assignments" {
  description = "Supply a map of objects containing the details of the role assignments to create for the user-assigned managed identity.\nThis will be merged with the other role assignments specified in var.role_assignments.\n\nThe role assignments can be used resource groups created by the var.resource_groups_to_create map.\n\nRequires both var.umi_enabled and var.role_assignment_enabled to be true.\n\nObject fields:\n\n- definition: The role definition to assign. Either use the name or the role definition resource id.\n- relative_scope: Scope relative to the created subscription. Leave blank for subscription scope.\n"
  type = map(object({
    definition        = string
    relative_scope    = optional(string, "")
    condition         = optional(string, "")
    condition_version = optional(string, "")
  }))
  default = {}
}

variable "umi_tags" {
  description = "The tags to apply to the user-assigned managed identity"
  type        = map(string)
  default     = {}
}

variable "virtual_network_enabled" {
  description = "Enables and disables the virtual network submodule."
  type        = bool
  default     = false
}

variable "virtual_networks" {
  description = "A map of the virtual networks to create. The map key must be known at the plan stage, e.g. must not be calculated and known only after apply.\n\n### Required fields\n\n- name: The name of the virtual network. [required]\n- address_space: The address space of the virtual network as a list of strings in CIDR format, e.g. [\"192.168.0.0/24\", \"10.0.0.0/24\"]. [required]\n- resource_group_name: The name of the resource group to create the virtual network in. [required]\n\n### DNS servers\n\n- dns_servers: A list of DNS servers to use for the virtual network, e.g. [\"192.168.0.1\", \"10.0.0.1\"]. If empty will use the Azure default DNS. [optional - default empty list]\n\n### DDOS protection plan\n\n- ddos_protection_enabled: Whether to enable ddos protection. [optional]\n- ddos_protection_plan_id: The resource ID of the protection plan to attach the vnet. [optional - but required if ddos_protection_enabled is true]\n\n### Location\n\n- location: The location of the virtual network (and resource group if creation is enabled). [optional, will use var.location if not specified or empty string]\n\n> Note at least one of location or var.location must be specified.\n> If both are empty then the module will fail.\n\n### Hub network peering values\n\nThe following values configure bi-directional hub & spoke peering for the given virtual network.\n\n- hub_peering_enabled: Whether to enable hub peering. [optional]\n- hub_peering_direction: The direction of the peering. [optional - allowed values are: tohub, fromhub or both - default both]\n- hub_network_resource_id: The resource ID of the hub network to peer with. [optional - but required if hub_peering_enabled is true]\n- hub_peering_name_tohub: The name of the peering to the hub network. [optional - leave empty to use calculated name]\n- hub_peering_name_fromhub: The name of the peering from the hub network. [optional - leave empty to use calculated name]\n- hub_peering_use_remote_gateways: Whether to use remote gateways for the hub peering. [optional - default true]\n\n### Mesh peering values\n\nMesh peering is the capability to create a bi-directional peerings between all supplied virtual networks in var.virtual_networks.\nPeerings will only be created between virtual networks with the mesh_peering_enabled value set to true.\n\n- mesh_peering_enabled: Whether to enable mesh peering for this virtual network. Must be enabled on more than one virtual network for any peerings to be created. [optional]\n- mesh_peering_allow_forwarded_traffic: Whether to allow forwarded traffic for the mesh peering. [optional - default false]\n\n### Resource group values\n\nThe default is that a resource group will be created for each resource_group_name specified in the var.virtual_networks map.\nIt is possible to use a pre-existing resource group by setting resource_group_creation_enabled to false.\nWe recommend using resource groups aligned to the region of the virtual network,\nhowever if you want multiple virtual networks in more than one location to share a resource group,\nonly one of the virtual networks should have resource_group_creation_enabled set to true.\n\n- resource_group_creation_enabled: Whether to create a resource group for the virtual network. [optional - default true]\n- resource_group_lock_enabled: Whether to create a CanNotDelete resource lock on the resource group. [optional - default true]\n- resource_group_lock_name: The name of the resource lock. [optional - leave empty to use calculated name]\n- resource_group_tags: A map of tags to apply to the resource group, e.g. { mytag = \"myvalue\", mytag2 = \"myvalue2\" }. [optional - default empty]\n\n### Virtual WAN values\n\n- vwan_associated_routetable_resource_id: The resource ID of the route table to associate with the virtual network. [optional - leave empty to use defaultRouteTable on hub]\n- vwan_connection_enabled: Whether to create a connection to a Virtual WAN. [optional - default false]\n- vwan_connection_name: The name of the connection to the Virtual WAN. [optional - leave empty to use calculated name]\n- vwan_hub_resource_id: The resource ID of the hub to connect to. [optional - but required if vwan_connection_enabled is true]\n- vwan_propagated_routetables_labels: A list of labels of route tables to propagate to the virtual network. [optional - leave empty to use [\"default\"]]\n- vwan_propagated_routetables_resource_ids: A list of resource IDs of route tables to propagate to the virtual network. [optional - leave empty to use defaultRouteTable on hub]\n- vwan_security_configuration: A map of security configuration values for VWAN hub connection - see below. [optional - default empty]\n  - secure_internet_traffic: Whether to forward internet-bound traffic to the destination specified in the routing policy. [optional - default false]\n  - secure_private_traffic: Whether to all internal traffic to the destination specified in the routing policy. Not compatible with routing_intent_enabled. [optional - default false]\n  - routing_intent_enabled: Enable to use with a Virtual WAN hub with routing intent enabled. Routing intent on hub is configured outside this module. [optional - default false]\n\n### Tags\n\n- tags: A map of tags to apply to the virtual network. [optional - default empty]\n"
  type = map(object({
    name                = string
    address_space       = list(string)
    resource_group_name = string

    location = optional(string, "")

    dns_servers = optional(list(string), [])

    ddos_protection_enabled = optional(bool, false)
    ddos_protection_plan_id = optional(string, "")

    hub_network_resource_id         = optional(string, "")
    hub_peering_enabled             = optional(bool, false)
    hub_peering_direction           = optional(string, "both")
    hub_peering_name_tohub          = optional(string, "")
    hub_peering_name_fromhub        = optional(string, "")
    hub_peering_use_remote_gateways = optional(bool, true)

    mesh_peering_enabled                 = optional(bool, false)
    mesh_peering_allow_forwarded_traffic = optional(bool, false)

    resource_group_creation_enabled = optional(bool, true)
    resource_group_lock_enabled     = optional(bool, true)
    resource_group_lock_name        = optional(string, "")
    resource_group_tags             = optional(map(string), {})

    vwan_associated_routetable_resource_id   = optional(string, "")
    vwan_connection_enabled                  = optional(bool, false)
    vwan_connection_name                     = optional(string, "")
    vwan_hub_resource_id                     = optional(string, "")
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
