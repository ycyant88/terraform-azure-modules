variable "addons" {
  description = "    Map object containing configurations for the different addon types.  Each addon type has associated fields and specific naming requirements.  A full input example is provided below.\n    map(objet({\n      \n      - arc_vcenter (Optional) - The vmware vcenter resource id as a string\n      - hcx_key_names (Optional) - A list of key names to create HCX keys for.\n      - hcx_license_type (Optional) - The type of license to configure for HCX.  Valid values are \"Advanced\" and \"Enterprise\".\n      - srm_license_key (Optional) - the license key to use when enabling the SRM addOn\n      - vr_vrs_count (Optional) - The Vsphere replication server count\n\n    }))\n\n    Example Input:\n    terraform \n    {\n      Arc = {\n        arc_vcenter = \"<vcenter resource id>\"\n      }\n      HCX = {\n        hcx_key_names = [\"key1\", \"key2\"]\n        hcx_license_type = \"Enterprise\"\n      }\n      SRM = {\n        srm_license_key = \"<srm license key value>\"\n      }\n      VR = {\n        vr_vrs_count = 2\n      }\n    }\n    \n"
  type = map(object({
    arc_vcenter      = optional(string)
    hcx_key_names    = optional(list(string), [])
    hcx_license_type = optional(string, "Enterprise")
    srm_license_key  = optional(string)
    vr_vrs_count     = optional(number, 0)
  }))
  default = {}
}

variable "avs_interconnect_connections" {
  description = "    Map of string objects describing one or more private cloud interconnect connections for private clouds in the same region.  The map key will be used for the connection name.\n    map(object({\n\n      - linked_private_cloud_resource_id = (Required) - The resource ID of the private cloud on the other side of the interconnect. Must be in the same region.\n\n      })\n    )\n\n  Example Input:\n    terraform\n    {\n      interconnect_sddc_1 = {\n        linked_private_cloud_resource_id = \"<SDDC resource ID>\"\n      }\n    }\n    \n"
  type = map(object({
    linked_private_cloud_resource_id = string
  }))
  default = {}
}

variable "avs_network_cidr" {
  description = "The full /22 or larger network CIDR summary for the private cloud managed components. This range should not intersect with any IP allocations that will be connected or visible to the private cloud."
  type        = string
  default     = ""
}

variable "clusters" {
  description = "    This object describes additional clusters in the private cloud in addition to the management cluster. The map key will be used as the cluster name\n    map(object({\n\n      - cluster_node_count = (required) - Integer number of nodes to include in this cluster between 3 and 16\n      - sku_name           = (required) - String for the sku type to use for the cluster nodes. Changing this forces a new cluster to be created\n      \n    ))}\n    Example Input:\n    terraform\n       cluster1 = {\n        cluster_node_count = 3\n        sku_name           = \"av36p\"\n       }\n    \n"
  type = map(object({
    cluster_node_count = number
    sku_name           = string
  }))
  default = {}
}

variable "customer_managed_key" {
  description = "    This object defines the customer managed key details to use when encrypting the VSAN datastore. \n   \n    - key_vault_resource_id = (Required) - The full Azure resource ID of the key vault where the encryption key will be sourced from\n    - key_name              = (Required) - The name for the encryption key\n    - key_version           = (Optional) - The key version value for the encryption key. \n\n    Example Inputs:\n    terraform\n      {\n        key_vault_resource_id = azurerm_key_vault.example.id\n        key_name              = azurerm_key_vault_key.example.name\n        key_version           = azurerm_key_vault_key.example.version\n      }\n    \n"
  type = object({
    key_vault_resource_id = optional(string, null)
    key_name              = optional(string, null)
    key_version           = optional(string, null)
  })
  default = {}
}

variable "dhcp_configuration" {
  description = "    This map object describes the DHCP configuration to use for the private cloud. It can remain unconfigured or define a RELAY or SERVER based configuration. Defaults to unconfigured. \n    This allows for new segments to define DHCP ranges as part of their definition. Only one DHCP configuration is allowed.\n    map(object({\n\n    - display_name           = (Required) - The display name for the dhcp configuration being created\n    - dhcp_type              = (Required) - The type for the DHCP server configuration.  Valid types are RELAY or SERVER. RELAY defines a relay configuration pointing to your existing DHCP servers. SERVER configures NSX-T to act as the DHCP server.\n    - relay_server_addresses = (Optional) - A list of existing DHCP server ip addresses from 1 to 3 servers.  Required when type is set to RELAY.    \n    - server_lease_time      = (Optional) - The lease time in seconds for the DHCP server. Defaults to 84600 seconds.(24 hours) Only valid for SERVER configurations\n    - server_address         = (Optional) - The CIDR range that NSX-T will use for the DHCP Server.\n\n  }))\n\n  Example Input:\n    terraform\n    #RELAY example\n    relay_config = {\n      display_name           = \"relay_example\"\n      dhcp_type              = \"RELAY\"\n      relay_server_addresses = [\"10.0.1.50\", \"10.0.2.50\"]      \n    }\n\n    #SERVER example\n    server_config = {\n      display_name      = \"server_example\"\n      dhcp_type         = \"SERVER\"\n      server_lease_time = 14400\n      server_address    = \"10.1.0.1/24\"\n    }\n    \n"
  type = map(object({
    display_name           = string
    dhcp_type              = string
    relay_server_addresses = optional(list(string), [])
    server_lease_time      = optional(number, 86400)
    server_address         = optional(string, null)
  }))
  default = {}
}

variable "diagnostic_settings" {
  description = "  This map object is used to define the diagnostic settings on the virtual machine.  This functionality does not implement the diagnostic settings extension, but instead can be used to configure sending the vm metrics to one of the standard targets.\n  map(object({\n    \n    - name                                     = (required) - Name to use for the Diagnostic setting configuration.  Changing this creates a new resource\n    - log_categories_and_groups                = (Optional) - List of strings used to define log categories and groups. Currently not valid for the VM resource\n    - log_groups                               = (Optional) - A set of log groups to send to the log analytics workspace. Defaults to [\"allLogs\"]\n    - metric_categories                        = (Optional) - List of strings used to define metric categories. Currently only AllMetrics is valid\n    - log_analytics_destination_type           = (Optional) - Valid values are null, AzureDiagnostics, and Dedicated.  Defaults to Dedicated\n    - workspace_resource_id                    = (Optional) - The Log Analytics Workspace Azure Resource ID when sending logs or metrics to a Log Analytics Workspace\n    - storage_account_resource_id              = (Optional) - The Storage Account Azure Resource ID when sending logs or metrics to a Storage Account\n    - event_hub_authorization_rule_resource_id = (Optional) - The Event Hub Namespace Authorization Rule Resource ID when sending logs or metrics to an Event Hub Namespace\n    - event_hub_name                           = (Optional) - The Event Hub name when sending logs or metrics to an Event Hub\n    - marketplace_partner_resource_id          = (Optional) - The marketplace partner solution Azure Resource ID when sending logs or metrics to a partner integration\n\n  }))\n\n  terraform\n  Example Input:\n    diagnostic_settings = {\n      nic_diags = {\n        name                  = module.naming.monitor_diagnostic_setting.name_unique\n        workspace_resource_id = azurerm_log_analytics_workspace.this_workspace.id\n        metric_categories     = [\"AllMetrics\"]\n      }\n    }\n  \n"
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

variable "dns_forwarder_zones" {
  description = "    Map of string objects describing one or more dns forwarder zones for NSX within the private cloud. Up to 5 additional forwarder zone can be configured. \n    This is primarily useful for identity source configurations or in cases where NSX DHCP is providing DNS configurations.\n    map(object({\n\n    - display_name               = (Required) - The display name for the new forwarder zone being created.  Commonly this aligns with the domain name.\n    - dns_server_ips             = (Required) - A list of up to 3 IP addresses where zone traffic will be forwarded.\n    - domain_names               = (Required) - A list of domain names that will be forwarded as part of this zone.\n    - source_ip                  = (Optional) - Source IP of the DNS zone.  Defaults to an empty string.  \n    - 'add_to_default_dns_service' = (Optional) - Set to try to associate this zone with the default DNS service.  Up to 5 zones can be linked.\n\n  }))\n\n  Example Input:\n    terraform\n    {\n      test_local = {\n        display_name               = local.test_domain_name\n        dns_server_ips             = [\"10.0.1.53\",\"10.0.2.53\"]\n        domain_names               = [\"test.local\"]\n        add_to_default_dns_service = true\n      }\n    }\n    \n"
  type = map(object({
    display_name               = string
    dns_server_ips             = list(string)
    domain_names               = list(string)
    source_ip                  = optional(string, "")
    add_to_default_dns_service = optional(bool, false)
  }))
  default = {}
}

variable "enable_stretch_cluster" {
  description = "Set this value to true if deploying an AVS stretch cluster."
  type        = bool
  default     = false
}

variable "enable_telemetry" {
  description = "This variable controls whether or not telemetry is enabled for the module.\nFor more information see https://aka.ms/avm/telemetryinfo.\nIf it is set to false, then no telemetry will be collected.\n"
  type        = bool
  default     = true
}

variable "expressroute_connections" {
  description = "    Map of string objects describing one or more global reach connections to be configured by the private cloud. The map key will be used for the connection name.\n    map(object({\n\n    - vwan_hub_connection                  = (Optional) - Set this to true if making a connection to a VWAN hub.  Leave as false if connecting to an ExpressRoute gateway in a virtual network hub.\n    - expressroute_gateway_resource_id     = (Required) - The Azure Resource ID for the ExpressRoute gateway where the connection will be made.\n    - authorization_key_name               = (Optional) - The authorization key name that should be used from the auth key map. If no key is provided a name will be generated from the map key.\n    - fast_path_enabled                    = (Optional) - Should fast path gateway bypass be enabled. There are sku and cost considerations to be aware of when enabling fast path. Defaults to false\n    - routing_weight                       = (Optional) - The routing weight value to use for this connection.  Defaults to 0.\n    - enable_internet_security             = (Optional) - Set this to true if connecting to a secure VWAN hub and you want the hub NVA to publish a default route to AVS.\n    - routing                              =  Optional( map ( object({\n      - associated_route_table_resource_id = (Optional) - The Azure Resource ID of the Virtual Hub Route Table associated with this Express Route Connection.\n      - inbound_route_map_resource_id      = (Optional) - The Azure Resource ID Of the Route Map associated with this Express Route Connection for inbound learned routes\n      - outbound_route_map_resource_id     = (Optional) - The Azure Resource ID Of the Route Map associated with this Express Route Connection for outbound advertised routes\n      - propagated_route_table = object({ \n        - labels = (Optional) - The list of labels for route tables where the routes will be propagated to\n        - ids    = (Optional) - The list of Azure Resource IDs for route tables where the routes will be propagated to\n\n      })\n    })), null)\n  }))\n\n  Example Input:\n    terraform\n    {\n      exr_region_1 = {\n        expressroute_gateway_resource_id                     = \"<expressRoute Gateway Resource ID>\"\n        peer_expressroute_circuit_resource_id = \"Azure Resource ID for the peer expressRoute circuit\"'\n      }\n    }\n    \n"
  type = map(object({
    vwan_hub_connection              = optional(bool, false)
    expressroute_gateway_resource_id = string
    authorization_key_name           = optional(string, null)
    fast_path_enabled                = optional(bool, false)
    routing_weight                   = optional(number, 0)
    enable_internet_security         = optional(bool, false)
    tags                             = optional(map(string), {})
    routing = optional(map(object({
      associated_route_table_resource_id = optional(string, null)
      inbound_route_map_resource_id      = optional(string, null)
      outbound_route_map_resource_id     = optional(string, null)
      propagated_route_table = optional(object({
        labels = optional(list(string), [])
        ids    = optional(list(string), [])
      }), {})
    })), {})
  }))
  default = {}
}

variable "global_reach_connections" {
  description = "    Map of string objects describing one or more global reach connections to be configured by the private cloud. The map key will be used for the connection name.\n    map(object({\n\n      - authorization_key                     = (Required) - The authorization key from the peer expressroute \n      - peer_expressroute_circuit_resource_id = (Optional) - Identifier of the ExpressRoute Circuit to peer within the global reach connection\n      \n      })\n    )\n\n  Example Input:\n    terraform\n    {\n      gr_region_1 = {\n        authorization_key                     = \"<auth key value>\"\n        peer_expressroute_circuit_resource_id = \"Azure Resource ID for the peer expressRoute circuit\"'\n      }\n    }\n    \n"
  type = map(object({
    authorization_key                     = string
    peer_expressroute_circuit_resource_id = string
  }))
  default = {}
}

variable "internet_enabled" {
  description = "Configure the internet SNAT option to be on or off. Defaults to off."
  type        = bool
  default     = false
}

variable "internet_inbound_public_ips" {
  description = "    This map object that describes the public IP configuration. Configure this value in the event you need direct inbound access to the private cloud from the internet. The code uses the map key as the display name for each configuration.\n    map(object({\n\n      - number_of_ip_addresses = (required) - The number of IP addresses to assign to this private cloud.\n\n    }))\n\n    Example Input:\n    terraform\n      public_ip_config = {\n        display_name = \"public_ip_configuration\"\n        number_of_ip_addresses = 1\n      }\n    \n"
  type = map(object({
    number_of_ip_addresses = number
  }))
  default = {}
}

variable "location" {
  description = "The Azure region where this and supporting resources should be deployed.  Defaults to the Resource Groups location if undefined."
  type        = string
  default     = null
}

variable "lock" {
  description = "    \"The lock level to apply to this virtual machine and all of it's child resources. The default value is none. Possible values are None, CanNotDelete, and ReadOnly. Set the lock value on child resource values explicitly to override any inherited locks.\" \n\n    Example Inputs:\n    terraform\n    lock = {\n      name = \"lock-{resourcename}\" # optional\n      type = \"CanNotDelete\" \n    }\n    \n"
  type = object({
    name = optional(string, null)
    kind = optional(string, "None")
  })
  default = {}
}

variable "managed_identities" {
  description = "This value toggles the system managed identity to on for use with customer managed keys. User Managed identities are currently unsupported for this resource. Defaults to false."
  type = object({
    system_assigned = optional(bool, false)
  })
  default = {}
}

variable "management_cluster_size" {
  description = "The number of nodes to include in the management cluster. The minimum value is 3 and the current maximum is 16."
  type        = number
  default     = 3
}

variable "name" {
  description = "The name to use when creating the avs sddc private cloud."
  type        = string
  default     = ""
}

variable "netapp_files_datastores" {
  description = "    This map of objects describes one or more netapp volume attachments.  The map key will be used for the datastore name and should be unique. \n    map(object({\n\n      - netapp_volume_resource_id = (required) - The azure resource ID for the Azure Netapp Files volume being attached to the cluster nodes.\n      - cluster_names             = (required) - A set of cluster name(s) where this volume should be attached\n\n    }))\n\n    Example Input:\n    terraform\n      anf_datastore_cluster1 = {\n        netapp_volume_resource_id = azurerm_netapp_volume.test.id\n        cluster_names             = [\"Cluster-1\"]\n      }\n    \n"
  type = map(object({
    netapp_volume_resource_id = string
    cluster_names             = set(string)
  }))
  default = {}
}

variable "nsxt_password" {
  description = "The password value to use for the cloudadmin account password in the local domain in nsxt. If this is left as null a random password will be generated for the deployment"
  type        = string
  default     = null
}

variable "primary_zone" {
  description = "This value represents the zone for deployment in a standard deployment or the primary zone in a stretch cluster deployment. Defaults to null to let Azure select the zone"
  type        = number
  default     = null
}

variable "resource_group_name" {
  description = "The resource group where the resources will be deployed."
  type        = string
  default     = ""
}

variable "role_assignments" {
  description = "  A list of role definitions and scopes to be assigned as part of this resources implementation.  \n  list(object({\n\n    - principal_id                               = (optional) - The ID of the Principal (User, Group or Service Principal) to assign the Role Definition to. Changing this forces a new resource to be created.\n    - role_definition_id_or_name                 = (Optional) - The Scoped-ID of the Role Definition or the built-in role name. Changing this forces a new resource to be created. Conflicts with role_definition_name \n    - condition                                  = (Optional) - The condition that limits the resources that the role can be assigned to. Changing this forces a new resource to be created.\n    - condition_version                          = (Optional) - The version of the condition. Possible values are 1.0 or 2.0. Changing this forces a new resource to be created.\n    - description                                = (Optional) - The description for this Role Assignment. Changing this forces a new resource to be created.\n    - skip_service_principal_aad_check           = (Optional) - If the principal_id is a newly provisioned Service Principal set this value to true to skip the Azure Active Directory check which may fail due to replication lag. This argument is only valid if the principal_id is a Service Principal identity. Defaults to true.\n    - delegated_managed_identity_resource_id     = (Optional) - The delegated Azure Resource Id which contains a Managed Identity. Changing this forces a new resource to be created.  \n\n  }))\n\n  Example Inputs:\n\n  terraform\n    role_assignments = {\n      role_assignment_1 = {\n        role_definition_id_or_name                 = \"Contributor\"\n        principal_id                               = data.azuread_client_config.current.object_id\n        description                                = \"Example for assigning a role to an existing principal for the Private Cloud scope\"        \n      }\n    }\n  \n"
  type = map(object({
    role_definition_id_or_name             = string
    principal_id                           = optional(string)
    condition                              = optional(string)
    condition_version                      = optional(string)
    description                            = optional(string)
    skip_service_principal_aad_check       = optional(bool, true)
    delegated_managed_identity_resource_id = optional(string)
    }
  ))
  default = {}
}

variable "secondary_zone" {
  description = "This value represents the secondary zone in a stretch cluster deployment."
  type        = number
  default     = null
}

variable "segments" {
  description = "    This map object describes the additional segments to configure on the private cloud. It can remain unconfigured or define one or more new network segments. Defaults to unconfigured. \n    If the connected_gateway value is left undefined, the configuration will default to using the default T1 gateway provisioned as part of the managed service.\n    map(object({\n\n    - display_name       = (Required) - The display name for the dhcp configuration being created\n    - gateway_address    = (Required) - The CIDR range to use for the segment\n    - dhcp_ranges        = (Optional) - One or more ranges of IP addresses or CIDR blocks entered as a list of string\n    - connected_gateway  = (Optional) - The name of the T1 gateway to connect this segment to.  Defaults to the managed t1 gateway if left unconfigured.\n\n  }))\n\n  Example Input:\n    terraform\n    segment_1 = {\n      display_name    = \"segment_1\"\n      gateway_address = \"10.20.0.1/24\"\n      dhcp_ranges     = [\"10.20.0.5-10.20.0.100\"]      \n    }\n    segment_2 = {\n      display_name    = \"segment_2\"\n      gateway_address = \"10.30.0.1/24\"\n      dhcp_ranges     = [\"10.30.0.0/24\"]\n    }\n    \n"
  type = map(object({
    display_name      = string
    gateway_address   = string
    dhcp_ranges       = optional(list(string), [])
    connected_gateway = optional(string, null)
  }))
  default = {}
}

variable "sku_name" {
  description = "The sku value for the AVS SDDC management cluster nodes. Valid values are av20, av36, av36t, av36pt, av52, av64."
  type        = string
  default     = ""
}

variable "tags" {
  description = "Map of tags to be assigned to this resource"
  type        = map(any)
  default     = {}
}

variable "vcenter_identity_sources" {
  description = "  A map of objects representing a list of 0-2 identity sources for configuring LDAP or LDAPs on the private cloud. The map key will be used as the name value for the identity source.\n    map(object({\n\n      - alias             = (Required) - The domains NETBIOS name\n      - base_group_dn     = (Required) - The base distinguished name for groups\n      - base_user_dn      = (Required) - The base distinguished name for users\n      - domain            = (Required) - The fully qualified domain name for the identity source\n      - group_name        = (Optional) - The name of the LDAP group that will be added to the cloudadmins role\n      - name              = (Required) - The name to give the identity source\n      - primary_server    = (Required) - The URI of the primary server. (Ex: ldaps://server.domain.local:636)\n      - secondary_server  = (Optional) - The URI of the secondary server. (Ex: ldaps://server.domain.local:636)\n      - ssl               = (Optional) - Determines if ldap is configured to use ssl. Default to Enabled, valid values are \"Enabled\" and \"Disabled\"\n      - 'timeout'           = (Optional) - The implementation timeout value.  Defaults to 10 minutes.\n\n    }))\n\n    Example Input:\n    terraform\n      {\n        test.local = {\n          alias                   = \"test.local\"\n          base_group_dn           = \"dc=test,dc=local\"\n          base_user_dn            = \"dc=test,dc=local\"\n          domain                  = \"test.local\"\n          name                    = \"test.local\"\n          primary_server          = \"ldaps://dc01.testdomain.local:636\"\n          secondary_server        = \"ldaps://dc02.testdomain.local:636\"\n          ssl                     = \"Enabled\"\n        }\n      }\n  \n"
  type = map(object({
    alias            = string
    base_group_dn    = string
    base_user_dn     = string
    domain           = string
    group_name       = optional(string, null)
    name             = string
    primary_server   = string
    secondary_server = optional(string, null)
    ssl              = optional(string, "Enabled")
    timeout          = optional(string, "10m")
  }))
  default = {}
}

variable "vcenter_identity_sources_credentials" {
  description = "  A map of objects representing the credentials used for the identity source connection. The map key should match the vcenter identity source that uses these values. Separating this to avoid terraform issues with apply on secrets.\n    map(object({\n\n      - ldap_user          = (Required) - \"The username for the domain user the vcenter will use to query LDAP(s)\"\n      - ldap_user_password = (Required) - \"Password to use for the domain user the vcenter will use to query LDAP(s)\"\n\n    }))\n\n    Example Input:\n    terraform\n      {\n        test.local = {\n          ldap_user               = \"user@test.local\"\n          ldap_user_password      = module.create_dc.ldap_user_password\n        }\n      }\n  \n"
  type = map(object({
    ldap_user          = string
    ldap_user_password = string
  }))
  default = {}
}

variable "vcenter_password" {
  description = "The password value to use for the cloudadmin account password in the local domain in vcenter. If this is left as null a random password will be generated for the deployment"
  type        = string
  default     = null
}
