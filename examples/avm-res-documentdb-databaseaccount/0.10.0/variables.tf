variable "access_key_metadata_writes_enabled" {
  description = "Defaults to false. Is write operations on metadata resources (databases, containers, throughput) via account keys enabled?"
  type        = bool
  default     = false
}

variable "analytical_storage_config" {
  description = "  Defaults to null. Configuration related to the analytical storage of this account\n\n  - schema_type - (Required) - The schema type of the Analytical Storage for this Cosmos DB account. Possible values are FullFidelity and WellDefined.\n\n  Example inputs:\n  hcl\n  analytical_storage_config = {\n    schema_type = \"WellDefined\"\n  }\n  \n"
  type = object({
    schema_type = string
  })
  default = null
}

variable "analytical_storage_enabled" {
  description = "Defaults to false. Enable Analytical Storage option for this Cosmos DB account. Enabling and then disabling analytical storage forces a new resource to be created."
  type        = bool
  default     = false
}

variable "automatic_failover_enabled" {
  description = "Defaults to true. Enable automatic failover for this Cosmos DB account."
  type        = bool
  default     = true
}

variable "backup" {
  description = "  Defaults to {}. Configures the backup policy for this Cosmos DB account.\n\n  - type                - (Optional) - Defaults to Continuous. The type of the backup. Possible values are Continuous and Periodic\n  - tier                - (Optional) - Defaults to Continuous30Days. Used when type is set to Continuous. The continuous backup tier. Possible values are Continuous7Days and Continuous30Days.\n  - interval_in_minutes - (Optional) - Defaults to 240. Used when type is set to Periodic. The interval in minutes between two backups. Possible values are between 60 and 1440\n  - retention_in_hours  - (Optional) - Defaults to 8. Used when type is set to Periodic. The time in hours that each backup is retained. Possible values are between 8 and 720\n  - storage_redundancy  - (Optional) - Defaults to Geo. Used when type is set to Periodic. The storage redundancy is used to indicate the type of backup residency. Possible values are Geo, Local and Zone\n\n  Example inputs:\n  hcl\n  # For Continuous Backup\n  backup = {\n    type = \"Continuous\"\n    tier = \"Continuous30Days\"\n  }\n\n  # For Periodic Backup\n  backup = {\n    type                = \"Periodic\"\n    storage_redundancy  = \"Geo\"\n    interval_in_minutes = 240\n    retention_in_hours  = 8\n  }\n  \n"
  type = object({
    retention_in_hours  = optional(number, 8)
    interval_in_minutes = optional(number, 240)
    storage_redundancy  = optional(string, "Geo")
    type                = optional(string, "Continuous")
    tier                = optional(string, "Continuous30Days")
  })
  default = {}
}

variable "capabilities" {
  description = "  Defaults to []. The capabilities which should be enabled for this Cosmos DB account.\n\n  - name - (Required) - The capability to enable - Possible values are AllowSelfServeUpgradeToMongo36, DeleteAllItemsByPartitionKey, DisableRateLimitingResponses, EnableAggregationPipeline, EnableCassandra, EnableGremlin, EnableMongo, EnableMongo16MBDocumentSupport, EnableMongoRetryableWrites, EnableMongoRoleBasedAccessControl, EnableNoSQLVectorSearch, EnableNoSQLFullTextSearch, EnablePartialUniqueIndex, EnableServerless, EnableTable, EnableTtlOnCustomPath, EnableUniqueCompoundNestedDocs, MongoDBv3.4, mongoEnableDocLevelTTL.\n\n  Example inputs:\n  hcl\n  capabilities = [\n    {\n      name = \"DisableRateLimitingResponses\"\n    }\n  ]\n  \n"
  type = set(object({
    name = string
  }))
  default = []
}

variable "capacity" {
  description = "  Defaults to {}. Configures the throughput limit for this Cosmos DB account.\n\n  - total_throughput_limit - (Optional) - Defaults to -1. The total throughput limit imposed on this Cosmos DB account (RU/s). Possible values are at least -1. -1 means no limit.\n\n  Example inputs:\n  hcl\n  capacity = {\n    total_throughput_limit = -1\n  }\n  \n"
  type = object({
    total_throughput_limit = optional(number, -1)
  })
  default = {}
}

variable "consistency_policy" {
  description = "  Defaults to {}. Used to define the consistency policy for this CosmosDB account\n\n  - consistency_level       - (Optional) - Defaults to BoundedStaleness. The Consistency Level to use for this CosmosDB Account - can be either BoundedStaleness, Eventual, Session, Strong or ConsistentPrefix.\n  - max_interval_in_seconds - (Optional) - Defaults to 5. Used when consistency_level is set to BoundedStaleness. When used with the Bounded Staleness consistency level, this value represents the time amount of staleness (in seconds) tolerated. The accepted range for this value is 5 - 86400 (1 day).\n  - max_staleness_prefix    - (Optional) - Defaults to 100. Used when consistency_level is set to BoundedStaleness. When used with the Bounded Staleness consistency level, this value represents the number of stale requests tolerated. The accepted range for this value is 10 \u2013 2147483647\n\n  Example inputs:\n  hcl\n  consistency_policy = {\n    consistency_level       = \"BoundedStaleness\"\n    max_interval_in_seconds = 10\n    max_interval_in_seconds = 100\n  }\n  \n"
  type = object({
    max_interval_in_seconds = optional(number, 5)
    max_staleness_prefix    = optional(number, 100)
    consistency_level       = optional(string, "BoundedStaleness")
  })
  default = {}
}

variable "cors_rule" {
  description = "  Defaults to null. Configures the CORS rule for this Cosmos DB account.\n\n  - allowed_headers    - (Required) - A list of headers that are allowed to be a part of the cross-origin request.\n  - allowed_methods    - (Required) - A list of HTTP headers that are allowed to be executed by the origin. Valid options are DELETE, GET, HEAD, MERGE, POST, OPTIONS, PUT or PATCH.\n  - allowed_origins    - (Required) - A list of origin domains that will be allowed by CORS.\n  - exposed_headers    - (Required) - A list of response headers that are exposed to CORS clients.\n  - max_age_in_seconds - (Optional) - Defaults to null. The number of seconds the client should cache a preflight response. Possible values are between 1 and 2147483647\n\n  Example inputs:\n  hcl\n  cors_rule = {\n    allowed_headers = [\"Custom-Header\"]\n    allowed_methods = [\"POST\"]\n    allowed_origins = [\"microsoft.com\"]\n    exposed_headers = [\"Custom-Header\"]\n    max_age_in_seconds = 100\n  }\n  \n"
  type = object({
    allowed_headers    = set(string)
    allowed_methods    = set(string)
    allowed_origins    = set(string)
    exposed_headers    = set(string)
    max_age_in_seconds = optional(number, null)
  })
  default = null
}

variable "customer_managed_key" {
  description = "  Defaults to null. Ignored for Basic and Standard. Defines a customer managed key to use for encryption.\n\n  - key_name               - (Required) - The key name for the customer managed key in the key vault.\n  - key_vault_resource_id  - (Required) - The full Azure Resource ID of the key_vault where the customer managed key will be referenced from.\n  - key_version            - (Unsupported)\n\n  - user_assigned_identity - (Required) - The user assigned identity to use when access the key vault\n    - resource_id          - (Required) - The full Azure Resource ID of the user assigned identity.\n\n  > Note: Remember to assign permission to the managed identity to access the key vault key. The Key vault used must have enabled soft delete and purge protection. The minimun required permissions is \"Key Vault Crypto Service Encryption User\"\n\n  Example Inputs:\n  hcl\n  customer_managed_key = {\n    key_name               = \"sample-customer-key\"\n    key_vault_resource_id  = \"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.KeyVault/vaults/{keyVaultName}\"\n    \n    user_assigned_identity {\n      resource_id = \"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/{managedIdentityName}\"\n    }\n  }\n  \n"
  type = object({
    key_name              = string
    key_vault_resource_id = string

    key_version = optional(string, null) # Not supported in CosmosDB

    user_assigned_identity = optional(object({
      resource_id = string
    }), null)
  })
  default = null
}

variable "diagnostic_settings" {
  description = "  Defaults to {}. A map of diagnostic settings to create. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n  - name                                     - (Optional) - The name of the diagnostic setting. One will be generated if not set, however this will not be unique if you want to create multiple diagnostic setting resources.\n  - log_categories                           - (Optional) - Defaults to []. A set of log categories to export. Possible values are: DataPlaneRequests, MongoRequests, CassandraRequests,  GremlinRequests, QueryRuntimeStatistics, PartitionKeyStatistics, PartitionKeyRUConsumption, ControlPlaneRequests or TableApiRequests.\n  - log_groups                               - (Optional) - Defaults to [] if log_categories is set, if not it defaults to [\"allLogs\", \"audit\"]. A set of log groups to send to export. Possible values are allLogs and audit.\n  - metric_categories                        - (Optional) - Defaults to [\"AllMetrics\"]. A set of metric categories to export.\n  - log_analytics_destination_type           - (Optional) - Defaults to Dedicated. The destination log analytics workspace table for the diagnostic setting. Possible values are Dedicated and AzureDiagnostics. Defaults to Dedicated.\n  - workspace_resource_id                    - (Optional) - The resource ID of the log analytics workspace to send logs and metrics to.\n  - storage_account_resource_id              - (Optional) - The resource ID of the storage account to send logs and metrics to.\n  - event_hub_authorization_rule_resource_id - (Optional) - The resource ID of the event hub authorization rule to send logs and metrics to.\n  - event_hub_name                           - (Optional) - The name of the event hub. If none is specified, the default event hub will be selected.\n  - marketplace_partner_resource_id          - (Optional) - The full ARM resource ID of the Marketplace resource to which you would like to send Diagnostic LogsLogs.\n\n  > Note: See more in CLI: az monitor diagnostic-settings categories list --resource {cosmosAccountResourceId}\n\n  Example Inputs:\n  hcl\n  diagnostic_settings = {\n    diagnostic1 = {\n      event_hub_name                           = \"hub-name\"\n      log_analytics_destination_type           = \"Dedicated\"\n      name                                     = \"diagnostics\"\n      event_hub_authorization_rule_resource_id = \"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.EventHub/namespaces/{eventHubNamespaceName}/authorizationRules/{authorizationRuleName}\"\n\n      #log_categories = [\"DataPlaneRequests\", \"MongoRequests\", \"CassandraRequests\",  \"GremlinRequests\", \"QueryRuntimeStatistics\", \"PartitionKeyStatistics\", \"PartitionKeyRUConsumption\", \"ControlPlaneRequests\",  \"TableApiRequests\"]\n\n      metric_categories           = [\"AllMetrics\"]\n      log_groups                  = [\"allLogs\", \"audit\"]\n      workspace_resource_id       = \"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.OperationalInsights/workspaces/{workspaceName}\"\n      storage_account_resource_id = \"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Storage/storageAccounts/{storageAccountName}\"\n    }\n  }\n  \n"
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

variable "enable_telemetry" {
  description = "  Defaults to true. This variable controls whether or not telemetry is enabled for the module.\n  For more information see https://aka.ms/avm/telemetryinfo.\n  If it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "free_tier_enabled" {
  description = "Defaults to false. Enable the Free Tier pricing option for this Cosmos DB account. Defaults to false. Changing this forces a new resource to be created."
  type        = bool
  default     = false
}

variable "geo_locations" {
  description = "  Default to the region where the account was deployed with zone redundant enabled. Specifies a geo_location resource, used to define where data should be replicated with the failover_priority 0 specifying the primary location.\n\n  - location          - (Required) - The name of the Azure location where the CosmosDB Account is being created.\n  - failover_priority - (Required) - The failover priority of the region. A failover priority of 0 indicates a write region.\n  - zone_redundant    - (Optional) - Defaults to true. Whether or not the region is zone redundant.\n\n  Example inputs:\n  hcl\n  geo_locations = [\n    {\n      location          = \"eastus\"\n      failover_priority = 0\n      zone_redundant    = true\n    },\n    {\n      location          = \"westus\"\n      failover_priority = 1\n      zone_redundant    = true\n    }\n  ]\n  \n"
  type = set(object({
    location          = string
    failover_priority = number
    zone_redundant    = optional(bool, true)
  }))
  default = null
}

variable "gremlin_databases" {
  description = "  Defaults to {}. Manages Gremlin Databases within a Cosmos DB Account.\n\n  - name       - (Required) - Specifies the name of the Cosmos DB Gremlin Database. Changing this forces a new resource to be created.\n  - throughput - (Optional) - Defaults to null. The throughput of the Gremlin database (RU/s). Must be set in increments of 100. The minimum value is 400. This must be set upon database creation otherwise it cannot be updated without a manual terraform destroy-apply.\n\n  - autoscale_settings - (Optional) - Defaults to null. This must be set upon database creation otherwise it cannot be updated without a manual terraform destroy-apply.\n    - max_throughput - (Required) - The maximum throughput of the Gremlin database (RU/s). Must be between 1,000 and 1,000,000. Must be set in increments of 1,000. Conflicts with throughput.\n\n  - graphs - (Optional) - Defaults to {}. Manages a Gremlin Graph within a Cosmos DB Account.\n    - name      - (Required) Specifies the name of the Cosmos DB Gremlin Graph. Changing this forces a new resource to be created.\n    - partition_key_path - (Required) - The path to use for partitioning data within the Gremlin graph (e.g., /myPartitionKey).\n    - partition_key_version - (Optional) - Defaults to null. The version of the partition key definition. Possible values are 1 or 2.\n    - throughput - (Optional) - Defaults to null. The throughput of the Gremlin graph (RU/s). Must be set in increments of 100. The minimum value is 400. This must be set upon graph creation otherwise it cannot be updated without a manual terraform destroy-apply.\n    - default_ttl - (Optional) - Defaults to null. The default Time To Live in seconds. If the value is -1, items are not automatically expired.\n    - analytical_storage_ttl - (Optional) - Defaults to null. The time to live of Analytical Storage for this Cosmos DB Gremlin Graph. Possible values are between -1 to 2147483647 not including 0. If present and the value is set to -1, it means never expire.\n    - autoscale_settings - (Optional) - Defaults to null. This must be set upon graph creation otherwise it cannot be updated without a manual terraform destroy-apply.\n      - max_throughput - (Required) - The maximum throughput of the Gremlin graph (RU/s). Must be between 1,000 and 1,000,000. Must be set in increments of 1,000. Conflicts with throughput.\n    - index_policy - (Optional) - Defaults to null. The indexing policy configuration for the Gremlin graph.\n      - automatic - (Optional) - Defaults to true. Whether automatic indexing is enabled.\n      - indexing_mode - (Required) - The indexing mode. Possible values are consistent, lazy, or none.\n      - included_paths - (Required) - List of paths to include in the index. Note: The root path \"/\" must be included in either included_paths or excluded_paths.\n      - excluded_paths - (Required) - List of paths to exclude from the index.\n      - composite_index - (Optional) - Defaults to null. List of composite index definitions.\n        - index - (Required) - Set of objects specifying path and order for each composite index (Ascending or Descending).\n      - spatial_index - (Optional) - Defaults to null. List of spatial index definitions.\n        - path - (Required) - The path for the spatial index.\n    - conflict_resolution_policy - (Optional) - Defaults to null. The conflict resolution policy for the Gremlin graph.\n      - mode - (Required) - The conflict resolution mode. Possible values are LastWriterWins or Custom.\n      - conflict_resolution_path - (Optional) - Defaults to null. The path to be used for conflict resolution (required for LastWriterWins).\n      - conflict_resolution_procedure - (Optional) - Defaults to null. The stored procedure to be used for conflict resolution (required for Custom).\n    - unique_key - (Optional) - Defaults to null. The unique key policy for the Gremlin graph.\n      - paths - (Required) - List of paths to enforce uniqueness on.\n\n  Example inputs:\n  hcl\n  gremlin_databases = {\n    \"database_name\" = {\n      name = \"database_gremlin\"\n      throughput = 400\n\n      graphs = {\n        \"graph\" = {\n          name = \"graph\"\n          partition_key_path = \"/myPartitionKey\"\n          partition_key_version = \"1\"\n          throughput = 400\n          default_ttl = 3600\n          analytical_storage_ttl = -1\n          autoscale_settings = {\n            max_throughput = 1000\n        }\n      }\n    }\n  }\n  \n"
  type = map(object({
    name = string

    throughput = optional(number, null)

    autoscale_settings = optional(object({
      max_throughput = number
    }), null)

    graphs = optional(map(object({
      name = string

      partition_key_path    = string
      partition_key_version = optional(string, null)
      throughput            = optional(number, null)

      default_ttl            = optional(number, null)
      analytical_storage_ttl = optional(number, null)

      autoscale_settings = optional(object({
        max_throughput = number
      }), null)

      index_policy = optional(object({
        automatic      = optional(bool, true)
        indexing_mode  = string
        included_paths = list(string)
        excluded_paths = list(string)

        composite_index = optional(list(object({
          index = set(object({
            path  = string
            order = string
          }))
        })), null)

        spatial_index = optional(list(object({
          path = string
        })), null)
      }), null)

      conflict_resolution_policy = optional(object({
        mode                          = string
        conflict_resolution_path      = optional(string, null)
        conflict_resolution_procedure = optional(string, null)
      }), null)

      unique_key = optional(object({
        paths = list(string)
      }), null)
    })), {})
  }))
  default = {}
}

variable "ip_range_filter" {
  description = "  Defaults to []. CosmosDB Firewall Support: This value specifies the set of IP addresses or IP address ranges in CIDR form to be included as the allowed list of client IPs for a given database account.\n\n  > Note: To enable the \"Allow access from the Azure portal\" behavior, you should add the IP addresses provided by the documentation to this list. https://learn.microsoft.com/en-us/azure/cosmos-db/how-to-configure-firewall#allow-requests-from-the-azure-portal\n  > Note: To enable the \"Accept connections from within public Azure datacenters\" behavior, you should add 0.0.0.0 to the list, see the documentation for more details. https://learn.microsoft.com/en-us/azure/cosmos-db/how-to-configure-firewall#allow-requests-from-global-azure-datacenters-or-other-sources-within-azure\n\n"
  type        = set(string)
  default     = []
}

variable "local_authentication_disabled" {
  description = "Defaults to true. Ignored for non SQL APIs accounts. Disable local authentication and ensure only MSI and AAD can be used exclusively for authentication. Can be set only when using the SQL API."
  type        = bool
  default     = true
}

variable "location" {
  description = "  Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created.\n\n  Example Inputs: eastus\n  See more in CLI: az account list-locations -o table --query \"[].name\"\n"
  type        = string
  default     = ""
}

variable "lock" {
  description = "  Defaults to null. Controls the Resource Lock configuration for this resource. \n  If specified, it will be inherited by child resources unless overriden when creating those child resources. \n  The following properties can be specified:\n\n  - kind - (Required) - The type of lock. Possible values are CanNotDelete and ReadOnly.\n  - name - (Optional) - The name of the lock. If not specified, a name will be generated based on the kind value. Changing this forces the creation of a new resource.\n\n  > Note: If you use ReadOnly kind lock, you must configure Terraform to use EntraId authentication, as the access of the account keys will be blocked thus terraform won't be to do its job.\n\n  Example Inputs:\n  hcl\n  lock = {\n    kind = \"CanNotDelete\"\n    name = \"This resource cannot be deleted easily\"\n  }\n  \n"
  type = object({
    kind = string
    name = optional(string, null)
  })
  default = null
}

variable "managed_identities" {
  description = "  Defaults to {}. Controls the Managed Identity configuration on this resource. The following properties can be specified:\n\n  - system_assigned            - (Optional) - Defaults to false. Specifies if the System Assigned Managed Identity should be enabled.\n  - user_assigned_resource_ids - (Optional) - Defaults to []. Specifies a set of User Assigned Managed Identity resource IDs to be assigned to this resource.\n\n  Example Inputs:\n  hcl\n  managed_identities = {\n    system_assigned            = true\n    user_assigned_resource_ids = [\n      \"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/{managedIdentityName}\"\n    ]\n  }\n  \n"
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default = {}
}

variable "minimal_tls_version" {
  description = "Defaults to Tls12. Specifies the minimal TLS version for the CosmosDB account. Possible values are: Tls12"
  type        = string
  default     = "Tls12"
}

variable "mongo_databases" {
  description = "  Defaults to {}. Manages SQL Databases within a Cosmos DB Account.\n\n  - name       - (Required) - Specifies the name of the Cosmos DB Mongo Database. Changing this forces a new resource to be created.\n  - throughput - (Optional) - Defaults to null. The throughput of the MongoDB database (RU/s). Must be set in increments of 100. The minimum value is 400. This must be set upon database creation otherwise it cannot be updated without a manual terraform destroy-apply.\n\n  - autoscale_settings - (Optional) - Defaults to null. This must be set upon database creation otherwise it cannot be updated without a manual terraform destroy-apply.\n    - max_throughput - (Required) - The maximum throughput of the SQL database (RU/s). Must be between 1,000 and 1,000,000. Must be set in increments of 1,000. Conflicts with throughput.\n\n  - collections - (Optional) - Defaults to {}. Manages a Mongo Collection within a Cosmos DB Account.\n    - name      - (Required) Specifies the name of the Cosmos DB Mongo Collection. Changing this forces a new resource to be created.\n\n    - throughput             - (Optional) - Defaults to null. The throughput of the MongoDB collection (RU/s). Must be set in increments of 100. The minimum value is 400. This must be set upon database creation otherwise it cannot be updated without a manual terraform destroy-apply.\n    - default_ttl_seconds    - (Optional) - Defaults to null. The default Time To Live in seconds. If the value is -1, items are not automatically expired.\n    - shard_key              - (Optional) - Defaults to null. The name of the key to partition on for sharding. There must not be any other unique index keys. Changing this forces a new resource to be created.\n\n    - autoscale_settings - (Optional) - Defaults to null. This must be set upon database creation otherwise it cannot be updated without a manual terraform destroy-apply.\n      - max_throughput   - (Required) - The maximum throughput of the MongoDB collection (RU/s). Must be between 1,000 and 1,000,000. Must be set in increments of 1,000. Conflicts with throughput.\n\n    - Index - (Optional) - Defaults to null. Improve the efficiency of MongoDB database operations.\n      - keys    - (Required) Specifies the list of user settable keys for each Cosmos DB Mongo Collection.\n      - unique  - (Optional) Defaults to false. Is the index unique or not?\n\n  Example inputs:\n  hcl\n      database_collection = {\n      name       = \"database_mongoDb_collections\"\n      throughput = 400\n\n      collections = {\n        \"collection\" = {\n          name                = \"MongoDBcollection\"\n          default_ttl_seconds = \"3600\"\n          shard_key           = \"_id\"\n          throughput          = 400\n\n          index = {\n            keys   = [\"_id\"]\n            unique = true\n          }\n        }\n      }\n    }\n  \n"
  type = map(object({
    name = string

    throughput = optional(number, null)

    autoscale_settings = optional(object({
      max_throughput = number
    }), null)

    collections = optional(map(object({
      name = string

      default_ttl_seconds = optional(string, null)
      shard_key           = optional(string, null)
      throughput          = optional(number, null)

      autoscale_settings = optional(object({
        max_throughput = number
      }), null)

      index = optional(object({
        keys   = list(string)
        unique = optional(bool, false)
      }), null)

    })), {})
  }))
  default = {}
}

variable "mongo_server_version" {
  description = "The Server Version of a MongoDB account. Defaults to 3.6 Possible values are 7.0, 6.0, 5.0, 4.2, 4.0, 3.6, and 3.2"
  type        = string
  default     = "3.6"
}

variable "multiple_write_locations_enabled" {
  description = "Defaults to false. Ignored when backup.type is Continuous. Enable multi-region writes for this Cosmos DB account."
  type        = bool
  default     = false
}

variable "name" {
  description = "  Specifies the name of the CosmosDB Account. Changing this forces a new resource to be created.\n  The name can contain only lowercase letters, numbers and the '-' character, must be between 3 and 44 characters long, and must not start or end with the character '-'.\n\n  Example Inputs: cosmos-sharepoint-prod-westus-001\n  See more: https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules#microsoftdocumentdb\n"
  type        = string
  default     = ""
}

variable "network_acl_bypass_for_azure_services" {
  description = "Defaults to false. If Azure services can bypass ACLs."
  type        = bool
  default     = false
}

variable "network_acl_bypass_resource_ids" {
  description = "Defaults to []. The list of resource Ids for Network Acl Bypass for this Cosmos DB account."
  type        = set(string)
  default     = []
}

variable "partition_merge_enabled" {
  description = "Defaults to false. Is partition merge on the Cosmos DB account enabled?"
  type        = bool
  default     = false
}

variable "private_endpoints" {
  description = "  Default to {}. A map of private endpoints to create. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n  - subnet_resource_id                      - (Required) - The resource ID of the subnet to deploy the private endpoint in.\n  - subresource_name                        - (Required) - The service name of the private endpoint. Possible value are SQL, SqlDedicated, Cassandra, MongoDB, Gremlin or Table.\n  - name                                    - (Optional) - The name of the private endpoint. One will be generated if not set.\n  - private_dns_zone_group_name             - (Optional) - The name of the private DNS zone group. One will be generated if not set.\n  - private_dns_zone_resource_ids           - (Optional) - A set of resource IDs of private DNS zones to associate with the private endpoint. If not set, no zone groups will be created and the private endpoint will not be associated with any private DNS zones. DNS records must be managed external to this module.\n  - application_security_group_associations - (Optional) - A map of resource IDs of application security groups to associate with the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n  - private_service_connection_name         - (Optional) - The name of the private service connection. One will be generated if not set.\n  - network_interface_name                  - (Optional) - The name of the network interface. One will be generated if not set.\n  - location                                - (Optional) - The Azure location where the resources will be deployed. Defaults to the location of the resource group.\n  - resource_group_name                     - (Optional) - The resource group where the resources will be deployed. Defaults to the resource group of the resource.\n\n  - ip_configurations - (Optional) - A map of IP configurations to create on the private endpoint. If not specified the platform will create one. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n    - name               - (Required) - The name of the IP configuration.\n    - private_ip_address - (Required) - The private IP address of the IP configuration.\n\n  - role_assignments - (Optional) - A map of role assignments to create on the private endpoint. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time. See var.role_assignments for more information.\n  - lock             - (Optional) - The lock level to apply to the private endpoint. Default is None. Possible values are None, CanNotDelete, and ReadOnly.\n  - tags             - (Optional) - A mapping of tags to assign to the private endpoint.\n\n  > Note: See more related to subresource_name in: https://learn.microsoft.com/en-us/azure/private-link/private-endpoint-overview#private-link-resource\n"
  type = map(object({
    subnet_resource_id = string
    subresource_name   = string

    name                                    = optional(string, null)
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

    tags = optional(map(string), null)

    lock = optional(object({
      kind = string
      name = optional(string, null)
    }), null)

    role_assignments = optional(map(object({
      role_definition_id_or_name = string
      principal_id               = string

      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      delegated_managed_identity_resource_id = optional(string, null)

      principal_type    = optional(string, null) # forced to be here by lint, not supported
      condition         = optional(string, null) # forced to be here by lint, not supported
      condition_version = optional(string, null) # forced to be here by lint, not supported
    })), {})
  }))
  default = {}
}

variable "private_endpoints_manage_dns_zone_group" {
  description = "Default to true. Whether to manage private DNS zone groups with this module. If set to false, you must manage private DNS zone groups externally, e.g. using Azure Policy."
  type        = bool
  default     = true
}

variable "public_network_access_enabled" {
  description = "Defaults to false. Whether or not public network access is allowed for this CosmosDB account."
  type        = bool
  default     = false
}

variable "resource_group_name" {
  description = "  The name of the resource group in which to create this resource.\n  Changing this forces a new resource to be created.\n  Name must be less than 90 characters long and must only contain underscores, hyphens, periods, parentheses, letters, or digits.\n\n  Example Inputs: rg-sharepoint-prod-westus-001\n  See more: https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules#microsoftresources\n"
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "  Defaults to {}. A map of role assignments to create. The map key is deliberately arbitrary to avoid issues where map keys maybe unknown at plan time.\n\n  - role_definition_id_or_name             - (Required) - The ID or name of the role definition to assign to the principal.\n  - principal_id                           - (Required) - The ID of the principal to assign the role to.\n  - description                            - (Optional) - The description of the role assignment.\n  - skip_service_principal_aad_check       - (Optional) - If set to true, skips the Azure Active Directory check for the service principal in the tenant. Defaults to false.\n  - delegated_managed_identity_resource_id - (Optional) - The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created. This field is only used in cross-tenant scenario.\n  \n  - principal_type                         - (Unsupported)\n  - condition                              - (Unsupported)\n  - condition_version                      - (Unsupported)\n\n  > Note: only set skip_service_principal_aad_check to true if you are assigning a role to a service principal.\n\n  Example Inputs:\n  hcl\n  role_assignments = {\n    \"key\" = {\n      skip_service_principal_aad_check = false\n      role_definition_id_or_name       = \"Contributor\"\n      description                      = \"This is a test role assignment\"\n      principal_id                     = \"eb5260bd-41f3-4019-9e03-606a617aec13\"\n    }\n  }\n  \n"
  type = map(object({
    role_definition_id_or_name             = string
    principal_id                           = string
    description                            = optional(string, null)
    skip_service_principal_aad_check       = optional(bool, false)
    delegated_managed_identity_resource_id = optional(string, null)

    principal_type    = optional(string, null) # forced to be here by lint, not supported
    condition         = optional(string, null) # forced to be here by lint, not supported
    condition_version = optional(string, null) # forced to be here by lint, not supported
  }))
  default = {}
}

variable "sql_databases" {
  description = "  Defaults to {}. Manages SQL Databases within a Cosmos DB Account.\n\n  - name       - (Required) - Specifies the name of the Cosmos DB SQL Container. Changing this forces a new resource to be created.\n  - throughput - (Optional) - Defaults to null. The throughput of SQL database (RU/s). Must be set in increments of 100. The minimum value is 400. This must be set upon database creation otherwise it cannot be updated without a manual terraform destroy-apply.\n\n  - autoscale_settings - (Optional) - Defaults to null. This must be set upon database creation otherwise it cannot be updated without a manual terraform destroy-apply.\n    - max_throughput - (Required) - The maximum throughput of the SQL database (RU/s). Must be between 1,000 and 1,000,000. Must be set in increments of 1,000. Conflicts with throughput.\n\n  - containers - (Optional)  - Defaults to {}. Manages SQL Containers within a Cosmos DB Account.\n    - partition_key_paths    - (Required) - Defines the partition key for the container. Changing this forces a new resource to be created.\n    - name                   - (Required) - Specifies the name of the Cosmos DB SQL Container. Changing this forces a new resource to be created.\n    - partition_key_version  - (Optional) - Defines the partition key version for the container. Changing this forces a new resource to be created.\n    - throughput             - (Optional) - Defaults to null. The throughput of SQL container (RU/s). Must be set in increments of 100. The minimum value is 400. This must be set upon container creation otherwise it cannot be updated without a manual terraform destroy-apply.\n    - default_ttl            - (Optional) - Defaults to null. The default time to live of SQL container. If missing, items are not expired automatically. If present and the value is set to -1, it is equal to infinity, and items don't expire by default. If present and the value is set to some number n - items will expire n seconds after their last modified time.\n    - analytical_storage_ttl - (Optional) - Defaults to null. The default time to live of Analytical Storage for this SQL container. If present and the value is set to -1, it is equal to infinity, and items don't expire by default. If present and the value is set to some number n - items will expire n seconds after their last modified time.\n\n    - unique_keys - (Optional) - Defaults to []. The unique keys of the container.\n      - paths - (Required) - A list of paths to use for this unique key. Changing this forces a new resource to be created.\n\n    - autoscale_settings - (Optional) - Defaults to null. This must be set upon database creation otherwise it cannot be updated without a manual terraform destroy-apply.\n      - max_throughput - (Required) - The maximum throughput of the SQL container (RU/s). Must be between 1,000 and 1,000,000. Must be set in increments of 1,000. Conflicts with throughput.\n\n    - functions - (Optional) - Defaults to {}. Manages SQL User Defined Functions.\n      - body - (Required) - Body of the User Defined Function.\n      - name - (Required) - The name which should be used for this SQL User Defined Function. Changing this forces a new SQL User Defined Function to be created.\n\n    - stored_procedures - (Optional) - Defaults to {}. Manages SQL Stored Procedures within a Cosmos DB Account SQL Database.\n      - body - (Required) - The body of the stored procedure.\n      - name - (Required) - Specifies the name of the Cosmos DB SQL Stored Procedure. Changing this forces a new resource to be created.\n\n    - triggers - (Optional) -  Defaults to {}. Manages SQL Triggers.\n      - body      - (Required) - Body of the Trigger.\n      - type      - (Required) - Type of the Trigger. Possible values are Pre and Post.\n      - operation - (Required) - The operation the trigger is associated with. Possible values are All, Create, Update, Delete and Replace.\n      - name      - (Required) - The name which should be used for this SQL Trigger. Changing this forces a new SQL Trigger to be created.\n\n    - conflict_resolution_policy - (Optional) - Defaults to null. The conflict resolution policy of the container. Changing this forces a new resource to be created.\n      - mode                          - (Required) - Indicates the conflict resolution mode. Possible values include: LastWriterWins and Custom.\n      - conflict_resolution_path      - Required if LastWriterWins is set as mode - The conflict resolution path.\n      - conflict_resolution_procedure - Required if Custom is set as mode - The procedure to resolve conflicts .\n\n    - indexing_policy - (Optional) - Defaults to {}. The indexing policy of the container.\n      - indexing_mode - (Required) - Indicates the indexing mode. Possible values include: consistent and none\n\n      - included_paths - (Optional) - Defaults to []. Either included_path or excluded_path must contain the path /*\n        - path - (Required) - Path for which the indexing behaviour applies to.\n\n      - excluded_paths - (Optional) - Defaults to []. Either included_path or excluded_path must contain the path /*\n        - path - (Required) - Path that is excluded from indexing.\n\n      - composite_indexes - (Optional) - Defaults to []. The composite indexes of the indexing policy.\n        - indexes - (Required) - The indexes of the composite indexes.\n          - path  - (Required) - Path for which the indexing behaviour applies to.\n          - order - (Required) - Order of the index. Possible values are Ascending or Descending.\n\n      - spatial_indexes - (Optional) - Defaults to []. The spatial indexes of the indexing policy.\n        - path - (Required) -  Path for which the indexing behaviour applies to. According to the service design, all spatial types including LineString, MultiPolygon, Point, and Polygon will be applied to the path.\n\n  > Note: Switching between autoscale and manual throughput is not supported via Terraform and must be completed via the Azure Portal and refreshed.\n  > Note: For indexing policy See more in: https://learn.microsoft.com/en-us/azure/cosmos-db/nosql/how-to-manage-indexing-policy?tabs=dotnetv3%2Cpythonv3\n\n  Example inputs:\n  hcl\n  sql_databases = {\n    database1 = {\n      name       = \"database1\"\n      throughput = 400\n\n      # autoscale_settings = {\n      #   max_throughput = 4000\n      # }\n\n      containers = {\n        container1 = {\n          partition_key_paths = [\"/id\"]\n          name               = \"container1\"\n          throughput         = 400\n          default_ttl        = 1000\n          analytical_storage_ttl = 1000\n\n          unique_keys = [\n            {\n              paths = [\"/field1\", \"/field2\"]\n            }\n          ]\n\n          # autoscale_settings = {\n          #   max_throughput = 4000\n          # }\n\n          functions = {\n            function1 = {\n              name = \"functionName\"\n              body = \"function function1() { }\"\n            }\n          }\n\n          stored_procedures = {\n            stored1 = {\n              name = \"storedName\"\n              body = \"function stored1() { }\"\n            }\n          }\n\n          triggers = {\n            trigger1 = {\n              name      = \"triggerName\"\n              body      = \"function trigger1() { }\"\n              type      = \"Pre\"\n              operation = \"All\"\n            }\n          }\n\n          conflict_resolution_policy = {\n            mode                     = \"LastWriterWins\"\n            conflict_resolution_path = \"/customProperty\"\n          }\n\n          indexing_policy = {\n            indexing_mode = \"consistent\"\n\n            included_paths = [\n              {\n                path = \"/*\"\n              }\n            ]\n\n            excluded_paths = [\n              {\n                path = \"/excluded/*\"\n              }\n            ]\n\n            composite_indexes = [\n              {\n                indexes = [\n                  {\n                    path  = \"/field1\"\n                    order = \"ascending\"\n                  }\n                ]\n              }\n            ]\n\n            spatial_indexes = [\n              {\n                path = \"/location/*\"\n              }\n            ]\n          }\n        }\n      }\n    }\n  }\n  \n"
  type = map(object({
    name = string

    throughput = optional(number, null)

    autoscale_settings = optional(object({
      max_throughput = number
    }), null)

    containers = optional(map(object({
      partition_key_paths    = list(string)
      name                   = string
      partition_key_version  = optional(number, 2)
      throughput             = optional(number, null)
      default_ttl            = optional(number, null)
      analytical_storage_ttl = optional(number, null)

      unique_keys = optional(list(object({
        paths = set(string)
      })), [])

      autoscale_settings = optional(object({
        max_throughput = number
      }), null)

      functions = optional(map(object({
        body = string
        name = string
      })), {})

      stored_procedures = optional(map(object({
        body = string
        name = string
      })), {})

      triggers = optional(map(object({
        body      = string
        type      = string
        operation = string
        name      = string
      })), {})

      conflict_resolution_policy = optional(object({
        mode                          = string
        conflict_resolution_path      = optional(string, null)
        conflict_resolution_procedure = optional(string, null)
      }), null)

      indexing_policy = optional(object({
        indexing_mode = string

        included_paths = optional(set(object({
          path = string
        })), [])

        excluded_paths = optional(set(object({
          path = string
        })), [])

        composite_indexes = optional(set(object({
          indexes = set(object({
            path  = string
            order = string
          }))
        })), [])

        spatial_indexes = optional(set(object({
          path = string
        })), [])
      }), null)

    })), {})
  }))
  default = {}
}

variable "sql_dedicated_gateway" {
  description = "  Defaults to null. Manages a SQL Dedicated Gateway within a Cosmos DB Account.\n\n  - instance_size  - (Optional) - The instance size for the CosmosDB SQL Dedicated Gateway. Changing this forces a new resource to be created. Possible values are Cosmos.D4s, Cosmos.D8s and Cosmos.D16s\n  - instance_count - (Optional) - The instance count for the CosmosDB SQL Dedicated Gateway. Possible value is between 1 and 5.\n\n  > Note: To create a dedicated gateway in a zone redundant region you must request Azure to enable it into your account. See more in: https://learn.microsoft.com/en-us/azure/cosmos-db/dedicated-gateway#provisioning-the-dedicated-gateway\n\n  Example inputs:\n  hcl\n  sql_dedicated_gateway = {\n    instance_count = 1\n    instance_size  = \"Cosmos.D4s\"\n  }\n  \n"
  type = object({
    instance_size  = string
    instance_count = optional(number, 1)
  })
  default = null
}

variable "tags" {
  description = "  Defaults to {}. A mapping of tags to assign to the resource. These tags will propagate to any child resource unless overriden when creating the child resource\n\n  Example Inputs:\n  hcl\n  tags = {\n    environment = \"testing\"\n  }\n  \n"
  type        = map(string)
  default     = null
}

variable "virtual_network_rules" {
  description = "  Defaults to []. Used to define which subnets are allowed to access this CosmosDB account.\n\n  - subnet_id - (Required) - The ID of the virtual network subnet.\n\n  > Note: Remember to enable Microsoft.AzureCosmosDB service endpoint on the subnet.\n\n  Example inputs:\n  hcl\n  virtual_network_rule = [\n    {\n      subnet_id = \"/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Network/virtualNetworks/{vnetName}/subnets/{subnetName}\"\n    }\n  ]\n  \n"
  type = set(object({
    subnet_id = string
  }))
  default = []
}
